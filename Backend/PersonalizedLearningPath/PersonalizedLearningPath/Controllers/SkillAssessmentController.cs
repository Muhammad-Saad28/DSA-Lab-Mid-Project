using System.Threading;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using PersonalizedLearningPath.DTOs.SkillAssessment;
using PersonalizedLearningPath.Services.SkillAssessment;

namespace PersonalizedLearningPath.Controllers
{
    [ApiController]
    [Route("api/skill-assessment")]
    public class SkillAssessmentController : ControllerBase
    {
        private readonly ISkillAssessmentService _service;


        public SkillAssessmentController(ISkillAssessmentService service)
        {
            _service = service;
        }

        [HttpGet("start/{skillId}")]
        public async Task<IActionResult> Start(int skillId, CancellationToken ct)
        {
            return Ok(await _service.StartAssessmentAsync(skillId, ct));
        }

        [HttpPost("answer")]
        public async Task<IActionResult> Answer([FromBody] AnswerDto dto, CancellationToken ct)
        {
            return Ok(await _service.SubmitAnswerAsync(dto, ct));
        }

        // Final submission endpoint: use this on the 5th question.
        // This endpoint exists so the frontend can explicitly "finalize" an assessment.
        [HttpPost("submit")]
        public async Task<IActionResult> Submit([FromBody] AnswerDto dto, CancellationToken ct)
        {
            var result = await _service.SubmitAnswerAsync(dto, ct);
            if (!result.Completed)
            {
                // If the client calls /submit before the 5th answer, do not hand out more questions here.
                return BadRequest(new
                {
                    message = "Final submit did not complete the assessment. Call /answer until question 5, then call /submit on the 5th answer.",
                    serverTotalCount = result.TotalCount,
                    serverCorrectCount = result.CorrectCount
                });
            }

            return Ok(result);
        }
    }

}
