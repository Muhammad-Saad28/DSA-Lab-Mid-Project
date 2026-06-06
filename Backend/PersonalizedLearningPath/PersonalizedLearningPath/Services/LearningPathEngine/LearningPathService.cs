using System.Text.Json;
using Microsoft.EntityFrameworkCore;
using PersonalizedLearningPath.CoreIntelligence;
using PersonalizedLearningPath.Data;
using PersonalizedLearningPath.DTOs.LearningPath;
using PersonalizedLearningPath.Models;
using PersonalizedLearningPath.Services.Gemini;

namespace PersonalizedLearningPath.Services.LearningPathEngine;

public class LearningPathService : ILearningPathService
{
    private readonly AppDbContext _db;
    private readonly GeminiClient _gemini;

    public LearningPathService(AppDbContext db, GeminiClient gemini)
    {
        _db = db;
        _gemini = gemini;
    }

    public async Task<LearningPathDto> GenerateOrGetActiveAsync(int userId, int skillId, CancellationToken ct = default)
    {
        var userExists = await _db.Users.AnyAsync(u => u.Id == userId, ct);
        if (!userExists) throw new InvalidOperationException("User not found");

        var skill = await _db.Skills.FirstOrDefaultAsync(s => s.SkillId == skillId, ct);
        if (skill == null) throw new InvalidOperationException("Skill not found");

        var existing = await _db.LearningPaths
            .Include(lp => lp.LearningPathCourses)
            .ThenInclude(lpc => lpc.Course)
            .FirstOrDefaultAsync(lp => lp.UserId == userId && lp.SkillId == skillId && lp.Status == "Active", ct);

        if (existing != null)
        {
            return await MapLearningPathAsync(existing, skill.SkillName, userId, ct);
        }

        var courses = await _db.Courses
            .Where(c => c.SkillId == skillId)
            .ToListAsync(ct);

        if (courses.Count == 0)
        {
            courses = await GenerateCoursesFromGeminiAsync(skill, ct);
        }

        var ordered = LearningPathBuilder.OrderCourses(courses);
        var roadmap = LearningPathBuilder.BuildRoadmapCourseIds(ordered);

        var path = new LearningPath
        {
            UserId = userId,
            SkillId = skillId,
            Status = "Active"
        };

        _db.LearningPaths.Add(path);
        await _db.SaveChangesAsync(ct);

        // Create path-course rows in roadmap order
        var courseById = ordered.ToDictionary(c => c.CourseId, c => c);
        foreach (var courseId in roadmap)
        {
            if (!courseById.ContainsKey(courseId)) continue;

            _db.LearningPathCourses.Add(new LearningPathCourse
            {
                PathId = path.PathId,
                CourseId = courseId,
                IsCompleted = false,
                CompletionPercentage = 0
            });
        }

        await _db.SaveChangesAsync(ct);

        // Reload with includes for DTO mapping
        var created = await _db.LearningPaths
            .Include(lp => lp.LearningPathCourses)
            .ThenInclude(lpc => lpc.Course)
            .FirstAsync(lp => lp.PathId == path.PathId, ct);

        _db.UserActivities.Add(new UserActivity
        {
            UserId = userId,
            Action = "Started learning path",
            Label = skill.SkillName,
            PathId = created.PathId,
            SkillId = skillId,
            CreatedAt = DateTime.UtcNow
        });

        _db.UserNotifications.Add(new UserNotification
        {
            UserId = userId,
            Type = "LearningPath",
            Message = $"New learning path started: {skill.SkillName}",
            IsRead = false,
            CreatedAt = DateTime.UtcNow
        });

        await _db.SaveChangesAsync(ct);

        return await MapLearningPathAsync(created, skill.SkillName, userId, ct);
    }

    public async Task<LearningPathDto> GetByIdAsync(int pathId, CancellationToken ct = default)
    {
        var path = await _db.LearningPaths
            .Include(lp => lp.Skill)
            .Include(lp => lp.LearningPathCourses)
            .ThenInclude(lpc => lpc.Course)
            .FirstOrDefaultAsync(lp => lp.PathId == pathId, ct);

        if (path == null) throw new InvalidOperationException("Learning path not found");

        return await MapLearningPathAsync(path, path.Skill.SkillName, path.UserId, ct);
    }

    private async Task<LearningPathDto> MapLearningPathAsync(LearningPath path, string skillName, int userId, CancellationToken ct)
    {
        var courses = path.LearningPathCourses
            .OrderBy(lpc => lpc.Course.CourseLevel)
            .ThenBy(lpc => lpc.Course.SequenceOrder)
            .ThenBy(lpc => lpc.CourseId)
            .ToList();

        // Refresh completion percentage from watched videos for accuracy
        var courseDtos = new List<CourseDto>(courses.Count);
        var percentages = new List<int>(courses.Count);

        foreach (var lpc in courses)
        {
            var pct = await ProgressTracker.CalculateCourseCompletionAsync(_db, userId, lpc.CourseId, ct);
            var completed = pct >= 100;
            percentages.Add(pct);

            // Persist quick snapshot in LearningPathCourses
            if (lpc.CompletionPercentage != pct || lpc.IsCompleted != completed)
            {
                lpc.CompletionPercentage = pct;
                lpc.IsCompleted = completed;
            }

            courseDtos.Add(new CourseDto
            {
                CourseId = lpc.CourseId,
                SkillId = lpc.Course.SkillId,
                CourseTitle = lpc.Course.CourseTitle,
                CourseLevel = lpc.Course.CourseLevel,
                YoutubeVideoUrl = lpc.Course.YoutubeVideoUrl,
                TotalVideos = lpc.Course.TotalVideos,
                SequenceOrder = lpc.Course.SequenceOrder,
                IsCompleted = completed,
                CompletionPercentage = pct
            });
        }

        await _db.SaveChangesAsync(ct);

        var activeCourseId = courseDtos.FirstOrDefault(c => !c.IsCompleted)?.CourseId;
        var skillPct = ProgressTracker.CalculateSkillCompletionFromCourses(percentages);

        return new LearningPathDto
        {
            PathId = path.PathId,
            UserId = path.UserId,
            SkillId = path.SkillId,
            SkillName = skillName,
            CreatedAt = path.CreatedAt,
            Status = path.Status,
            SkillCompletionPercentage = skillPct,
            ActiveCourseId = activeCourseId,
            Courses = courseDtos
        };
    }

    private async Task<List<Course>> GenerateCoursesFromGeminiAsync(Skill skill, CancellationToken ct)
    {
        var prompt = BuildGeminiPrompt(skill.SkillName);
        var raw = await _gemini.GenerateTextAsync(prompt, ct);
        var generated = ParseGeneratedCourses(raw);

        if (generated.Count == 0)
        {
            throw new InvalidOperationException("No courses found for this skill");
        }

        var courses = generated
            .Select((c, idx) => new Course
            {
                SkillId = skill.SkillId,
                CourseTitle = c.Title,
                CourseLevel = NormalizeLevel(c.Level),
                YoutubeVideoUrl = c.Youtube,
                TotalVideos = c.TotalVideos > 0 ? c.TotalVideos : 1,
                SequenceOrder = c.Sequence > 0 ? c.Sequence : idx + 1
            })
            .ToList();

        _db.Courses.AddRange(courses);
        await _db.SaveChangesAsync(ct);

        return courses;
    }

    private static string BuildGeminiPrompt(string skillName)
    {
        return "Return ONLY JSON. Shape: {\"courses\": [ {\"title\": string, \"level\": \"Beginner|Intermediate|Advanced\", \"sequence\": int, \"youtube\": url, \"totalVideos\": int } ] }. " +
               "Include 5-8 ordered items. YouTube links must be valid watch URLs. Skill: " + skillName + ".";
    }

    private static List<GeneratedCourse> ParseGeneratedCourses(string raw)
    {
        var clean = StripCodeFences(raw).Trim();

        try
        {
            using var doc = JsonDocument.Parse(clean);

            var node = doc.RootElement;
            if (node.ValueKind == JsonValueKind.Object && node.TryGetProperty("courses", out var nested))
            {
                node = nested;
            }

            if (node.ValueKind != JsonValueKind.Array) return new List<GeneratedCourse>();

            var results = new List<GeneratedCourse>();
            foreach (var item in node.EnumerateArray())
            {
                var title = ReadString(item, "title") ?? ReadString(item, "name");
                var level = ReadString(item, "level") ?? "Beginner";
                var youtube = ReadString(item, "youtube")
                              ?? ReadString(item, "url")
                              ?? ReadString(item, "link");

                var sequence = ReadInt(item, "sequence");
                var totalVideos = ReadInt(item, "totalVideos");

                if (string.IsNullOrWhiteSpace(title) || string.IsNullOrWhiteSpace(youtube)) continue;

                results.Add(new GeneratedCourse
                {
                    Title = title.Trim(),
                    Level = level.Trim(),
                    Youtube = youtube.Trim(),
                    Sequence = sequence,
                    TotalVideos = totalVideos
                });
            }

            return results;
        }
        catch (JsonException)
        {
            return new List<GeneratedCourse>();
        }
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

    private static string NormalizeLevel(string? level)
    {
        var value = level?.Trim().ToLowerInvariant() ?? string.Empty;

        return value switch
        {
            "beginner" => "Beginner",
            "intermediate" => "Intermediate",
            "advanced" => "Advanced",
            _ => "Beginner"
        };
    }

    private static string? ReadString(JsonElement element, string propertyName)
    {
        if (element.TryGetProperty(propertyName, out var property) && property.ValueKind == JsonValueKind.String)
        {
            return property.GetString();
        }

        return null;
    }

    private static int ReadInt(JsonElement element, string propertyName)
    {
        if (element.TryGetProperty(propertyName, out var property))
        {
            return property.ValueKind switch
            {
                JsonValueKind.Number when property.TryGetInt32(out var value) => value,
                JsonValueKind.String when int.TryParse(property.GetString(), out var value) => value,
                _ => 0
            };
        }

        return 0;
    }

    private class GeneratedCourse
    {
        public string Title { get; init; } = string.Empty;
        public string Level { get; init; } = "Beginner";
        public string Youtube { get; init; } = string.Empty;
        public int Sequence { get; init; }
        public int TotalVideos { get; init; }
    }
}
