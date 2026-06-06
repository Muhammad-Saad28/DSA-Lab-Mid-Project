using System.Text;
using System.Text.Json;
using Microsoft.Extensions.Configuration;

namespace PersonalizedLearningPath.Services.Gemini;

public class GeminiClient
{
    private readonly HttpClient _http;
    private readonly string _apiKey;

    public GeminiClient(HttpClient http, IConfiguration configuration)
    {
        _http = http;
        _apiKey = configuration["Gemini:ApiKey"]
                 ?? Environment.GetEnvironmentVariable("GEMINI_API_KEY")
                 ?? throw new InvalidOperationException("Gemini API key is missing. Set Gemini:ApiKey or GEMINI_API_KEY.");

        _http.Timeout = TimeSpan.FromSeconds(15);
    }

    public async Task<string> GenerateTextAsync(string prompt, CancellationToken ct = default)
    {
        var body = new
        {
            contents = new[]
            {
                new { parts = new[] { new { text = prompt } } }
            }
        };

        using var request = new HttpRequestMessage(
            HttpMethod.Post,
            $"https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key={_apiKey}")
        {
            Content = new StringContent(JsonSerializer.Serialize(body), Encoding.UTF8, "application/json")
        };

        using var response = await _http.SendAsync(request, ct);
        response.EnsureSuccessStatusCode();

        var json = await response.Content.ReadAsStringAsync(ct);
        return ExtractText(json);
    }

    private static string ExtractText(string json)
    {
        using var doc = JsonDocument.Parse(json);
        if (!doc.RootElement.TryGetProperty("candidates", out var candidates))
        {
            return json;
        }

        foreach (var candidate in candidates.EnumerateArray())
        {
            if (!candidate.TryGetProperty("content", out var content)) continue;
            if (!content.TryGetProperty("parts", out var parts)) continue;

            var sb = new StringBuilder();
            foreach (var part in parts.EnumerateArray())
            {
                if (part.TryGetProperty("text", out var textNode) && textNode.ValueKind == JsonValueKind.String)
                {
                    sb.Append(textNode.GetString());
                }
            }

            if (sb.Length > 0) return sb.ToString();
        }

        return json;
    }
}
