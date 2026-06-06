using System.Threading;
using System.Threading.Tasks;
using PersonalizedLearningPath.DataStructures.Trees;
using PersonalizedLearningPath.DTOs.SkillAssessment;
using PersonalizedLearningPath.Models;

namespace PersonalizedLearningPath.Services.SkillAssessment
{
    public interface ISkillAssessmentService
    {
        Task<QuestionDto> StartAssessmentAsync(int skillId, CancellationToken ct = default);
        Task<FinalAssessmentDto> SubmitAnswerAsync(AnswerDto dto, CancellationToken ct = default);
        Task<BinaryQuestionTree> BuildTreeAsync(int skillId, CancellationToken ct = default);
    }

}
