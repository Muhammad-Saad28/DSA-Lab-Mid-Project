using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.Json;
using System.Threading;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using PersonalizedLearningPath.Data;
using PersonalizedLearningPath.DataStructures.Trees;
using PersonalizedLearningPath.DTOs.SkillAssessment;
using PersonalizedLearningPath.Models;
using PersonalizedLearningPath.Services.Gemini;

namespace PersonalizedLearningPath.Services.SkillAssessment
{
    public class SkillAssessmentService : ISkillAssessmentService
    {
        private readonly AppDbContext _context;
        private readonly GeminiClient _gemini;

        // Complete binary tree depth/height = 5 => nodes = 2^5 - 1 = 31.
        private const int QuestionsPerSkill = 31;
        private const int QuestionsToAskPerAssessment = 5;

        public SkillAssessmentService(AppDbContext context, GeminiClient gemini)
        {
            _context = context;
            _gemini = gemini;
        }

        public async Task<BinaryQuestionTree> BuildTreeAsync(int skillId, CancellationToken ct = default)
        {
            var questions = await _context.Questions
                .Where(q => q.SkillId == skillId)
                .OrderBy(q => q.TreeIndex)
                .Take(QuestionsPerSkill)
                .ToListAsync(ct);

            if (questions.Count != QuestionsPerSkill || HasIndexGaps(questions))
            {
                questions = await GenerateQuestionsFromGeminiAsync(skillId, ct);
            }

            if (questions.Count != QuestionsPerSkill || HasIndexGaps(questions))
            {
                throw new InvalidOperationException($"Skill {skillId} must have exactly {QuestionsPerSkill} questions (found {questions.Count}).");
            }

            return new BinaryQuestionTree(questions.OrderBy(q => q.TreeIndex).ToArray());
        }

        public async Task<QuestionDto> StartAssessmentAsync(int skillId, CancellationToken ct = default)
        {
            var tree = await BuildTreeAsync(skillId, ct);
            return Map(tree.GetRoot());
        }

        public async Task<FinalAssessmentDto> SubmitAnswerAsync(AnswerDto dto, CancellationToken ct = default)
        {
            var tree = await BuildTreeAsync(dto.SkillId, ct);

            var current = tree.GetByTreeIndex(dto.CurrentIndex);
            if (current == null)
                throw new InvalidOperationException($"Current question with TreeIndex {dto.CurrentIndex} for skill {dto.SkillId} not found.");

            bool correct = string.Equals(current.CorrectAnswer, dto.SelectedOption, StringComparison.OrdinalIgnoreCase);

            int correctCount = dto.CorrectCount + (correct ? 1 : 0);
            int totalCount = dto.TotalCount + 1;

            // Hard stop: each assessment is exactly 5 answered questions per skill.
            // Even though the tree has 31 nodes, we only traverse 5 questions (root-to-leaf path).
            if (totalCount >= QuestionsToAskPerAssessment)
            {
                var level = CalculateLevel(correctCount);
                await UpsertAssessmentAsync(dto.UserId, dto.SkillId, correctCount, totalCount, level, ct);

                return new FinalAssessmentDto
                {
                    Completed = true,
                    SkillLevel = level,
                    CorrectCount = correctCount,
                    TotalCount = totalCount,
                    NextQuestion = null
                };
            }

            var next = tree.GetNextByTreeIndex(dto.CurrentIndex, correct);

            if (next == null)
            {
                var level = CalculateLevel(correctCount);
                await UpsertAssessmentAsync(dto.UserId, dto.SkillId, correctCount, totalCount, level, ct);

                return new FinalAssessmentDto
                {
                    Completed = true,
                    SkillLevel = level,
                    CorrectCount = correctCount,
                    TotalCount = totalCount,
                    NextQuestion = null
                };
            }

            return new FinalAssessmentDto
            {
                Completed = false,
                NextQuestion = Map(next),
                CorrectCount = correctCount,
                TotalCount = totalCount,
                SkillLevel = null
            };
        }

        private static string CalculateLevel(int correctCount)
        {
            return correctCount <= 2 ? "Beginner" :
                   correctCount <= 4 ? "Intermediate" :
                   "Advanced";
        }

        private async Task UpsertAssessmentAsync(int userId, int skillId, int correctCount, int totalCount, string level, CancellationToken ct)
        {
            var existing = await _context.UserSkillAssessments
                .OrderByDescending(x => x.CompletedAt)
                .FirstOrDefaultAsync(x => x.UserId == userId && x.SkillId == skillId, ct);

            if (existing == null)
            {
                _context.UserSkillAssessments.Add(new UserSkillAssessment
                {
                    UserId = userId,
                    SkillId = skillId,
                    CorrectAnswers = correctCount,
                    TotalAnswered = totalCount,
                    SkillLevel = level,
                    CompletedAt = DateTime.UtcNow
                });
            }
            else
            {
                existing.CorrectAnswers = correctCount;
                existing.TotalAnswered = totalCount;
                existing.SkillLevel = level;
                existing.CompletedAt = DateTime.UtcNow;
            }

            var skillName = await _context.Skills.Where(s => s.SkillId == skillId)
                .Select(s => s.SkillName)
                .FirstOrDefaultAsync(ct) ?? $"Skill {skillId}";

            _context.UserActivities.Add(new UserActivity
            {
                UserId = userId,
                Action = "Completed assessment",
                Label = skillName,
                SkillId = skillId,
                CreatedAt = DateTime.UtcNow
            });

            _context.UserNotifications.Add(new UserNotification
            {
                UserId = userId,
                Type = "Assessment",
                Message = $"Assessment completed: {skillName} ({level})",
                IsRead = false,
                CreatedAt = DateTime.UtcNow
            });

            await _context.SaveChangesAsync(ct);
        }

        private async Task<List<Question>> GenerateQuestionsFromGeminiAsync(int skillId, CancellationToken ct)
        {
            var skillName = await _context.Skills
                .Where(s => s.SkillId == skillId)
                .Select(s => s.SkillName)
                .FirstOrDefaultAsync(ct) ?? $"Skill {skillId}";

            var prompt = BuildGeminiPrompt(skillName);
            var raw = await _gemini.GenerateTextAsync(prompt, ct);
            var generated = ParseGeneratedQuestions(raw);

            if (generated.Count < QuestionsPerSkill)
            {
                throw new InvalidOperationException($"Gemini returned {generated.Count} questions; expected {QuestionsPerSkill}.");
            }

            // Replace any existing questions for this skill to avoid partial or misaligned trees.
            var existing = await _context.Questions
                .Where(q => q.SkillId == skillId)
                .ToListAsync(ct);

            if (existing.Count > 0)
            {
                _context.Questions.RemoveRange(existing);
            }

            var selected = generated.Take(QuestionsPerSkill).ToList();
            var entities = new List<Question>(QuestionsPerSkill);

            for (int i = 0; i < selected.Count; i++)
            {
                var item = selected[i];

                entities.Add(new Question
                {
                    SkillId = skillId,
                    QuestionText = item.Question,
                    ChoiceA = item.ChoiceA,
                    ChoiceB = item.ChoiceB,
                    ChoiceC = item.ChoiceC,
                    CorrectAnswer = NormalizeAnswer(item.Correct),
                    DifficultyLevel = NormalizeDifficulty(item.Difficulty),
                    TreeIndex = i
                });
            }

            _context.Questions.AddRange(entities);
            await _context.SaveChangesAsync(ct);

            return entities;
        }

        private static string BuildGeminiPrompt(string skillName)
        {
            return "Return ONLY JSON. Shape: {\"questions\": [ {\"question\": string, \"choiceA\": string, \"choiceB\": string, \"choiceC\": string, \"correct\": \"A|B|C\", \"difficulty\": \"Beginner|Intermediate|Advanced\"} ] }. " +
                   "Include exactly 31 items ordered from easier to harder. Ensure options are concise and distinct. Skill: " + skillName + ".";
        }

        private static List<GeneratedQuestion> ParseGeneratedQuestions(string raw)
        {
            var clean = StripCodeFences(raw).Trim();

            try
            {
                using var doc = JsonDocument.Parse(clean);

                var node = doc.RootElement;
                if (node.ValueKind == JsonValueKind.Object && node.TryGetProperty("questions", out var nested))
                {
                    node = nested;
                }

                if (node.ValueKind != JsonValueKind.Array) return new List<GeneratedQuestion>();

                var results = new List<GeneratedQuestion>();
                foreach (var item in node.EnumerateArray())
                {
                    var questionText = ReadString(item, "question")
                                      ?? ReadString(item, "prompt")
                                      ?? ReadString(item, "text");

                    var choices = ReadChoices(item);
                    var correct = ReadString(item, "correct")
                                  ?? ReadString(item, "answer")
                                  ?? string.Empty;

                    var difficulty = ReadString(item, "difficulty")
                                     ?? ReadString(item, "level")
                                     ?? "Beginner";

                    if (string.IsNullOrWhiteSpace(questionText) || string.IsNullOrWhiteSpace(choices.A) || string.IsNullOrWhiteSpace(choices.B) || string.IsNullOrWhiteSpace(choices.C))
                    {
                        continue;
                    }

                    results.Add(new GeneratedQuestion
                    {
                        Question = questionText.Trim(),
                        ChoiceA = choices.A.Trim(),
                        ChoiceB = choices.B.Trim(),
                        ChoiceC = choices.C.Trim(),
                        Correct = correct.Trim(),
                        Difficulty = difficulty.Trim()
                    });
                }

                return results;
            }
            catch (JsonException)
            {
                return new List<GeneratedQuestion>();
            }
        }

        private static (string? A, string? B, string? C) ReadChoices(JsonElement item)
        {
            string? a = ReadString(item, "choiceA") ?? ReadString(item, "a");
            string? b = ReadString(item, "choiceB") ?? ReadString(item, "b");
            string? c = ReadString(item, "choiceC") ?? ReadString(item, "c");

            if (item.TryGetProperty("choices", out var choices) && choices.ValueKind == JsonValueKind.Array)
            {
                a ??= ReadArrayString(choices, 0);
                b ??= ReadArrayString(choices, 1);
                c ??= ReadArrayString(choices, 2);
            }

            if (item.TryGetProperty("options", out var options) && options.ValueKind == JsonValueKind.Array)
            {
                a ??= ReadArrayString(options, 0);
                b ??= ReadArrayString(options, 1);
                c ??= ReadArrayString(options, 2);
            }

            return (a, b, c);
        }

        private static string? ReadArrayString(JsonElement array, int index)
        {
            if (array.ValueKind != JsonValueKind.Array) return null;
            if (index < 0 || index >= array.GetArrayLength()) return null;

            var element = array[index];
            return element.ValueKind == JsonValueKind.String ? element.GetString() : null;
        }

        private static string NormalizeAnswer(string correct)
        {
            var trimmed = (correct ?? string.Empty).Trim().ToUpperInvariant();

            return trimmed switch
            {
                "A" or "A." => "A",
                "B" or "B." => "B",
                "C" or "C." => "C",
                _ => "A"
            };
        }

        private static string NormalizeDifficulty(string? difficulty)
        {
            var value = difficulty?.Trim().ToLowerInvariant() ?? string.Empty;

            return value switch
            {
                "beginner" or "easy" => "Beginner",
                "intermediate" or "medium" => "Intermediate",
                "advanced" or "hard" => "Advanced",
                _ => "Beginner"
            };
        }

        private static string StripCodeFences(string text)
        {
            var trimmed = text.Trim();
            if (!trimmed.StartsWith("```", StringComparison.Ordinal)) return trimmed;

            var firstLineEnd = trimmed.IndexOf('\n');
            var lastFence = trimmed.LastIndexOf("```", StringComparison.Ordinal);

            if (firstLineEnd >= 0 && lastFence > firstLineEnd)
            {
                return trimmed.Substring(firstLineEnd + 1, lastFence - firstLineEnd - 1);
            }

            return trimmed;
        }

        private static string? ReadString(JsonElement element, string propertyName)
        {
            if (element.TryGetProperty(propertyName, out var property) && property.ValueKind == JsonValueKind.String)
            {
                return property.GetString();
            }

            return null;
        }

        private static bool HasIndexGaps(IReadOnlyList<Question> questions)
        {
            for (int i = 0; i < questions.Count; i++)
            {
                if (questions[i].TreeIndex != i) return true;
            }

            return false;
        }

        private QuestionDto Map(Question q) => new QuestionDto
        {
            QuestionId = q.QuestionId,
            TreeIndex = q.TreeIndex,
            QuestionText = q.QuestionText,
            ChoiceA = q.ChoiceA,
            ChoiceB = q.ChoiceB,
            ChoiceC = q.ChoiceC
        };

        private sealed class GeneratedQuestion
        {
            public string Question { get; init; } = string.Empty;
            public string ChoiceA { get; init; } = string.Empty;
            public string ChoiceB { get; init; } = string.Empty;
            public string ChoiceC { get; init; } = string.Empty;
            public string Correct { get; init; } = string.Empty;
            public string Difficulty { get; init; } = "Beginner";
        }
    }

}
