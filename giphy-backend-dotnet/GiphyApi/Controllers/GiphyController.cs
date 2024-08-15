using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using System.Net.Http;
using System.Threading.Tasks;

namespace GifSearchApi.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class GiphyController : ControllerBase
    {
        private readonly HttpClient _httpClient;
        private readonly string _giphyApiKey;

        public GiphyController(HttpClient httpClient, IConfiguration configuration)
        {
            _httpClient = httpClient;
            _giphyApiKey = configuration["GiphyApiKey"];
        }

        [HttpGet("search")]
        public async Task<IActionResult> Search([FromQuery] string query)
        {
            if (string.IsNullOrEmpty(query))
            {
                return BadRequest(new { error = "Query parameter is required" });
            }

            try
            {
                // example => https://api.giphy.com/v1/gifs/search?api_key=LQQbgB0jgYYH3OrpASCDoewvMJUJXTtI&q=funny&limit=10
                var requestUri = $"https://api.giphy.com/v1/gifs/search?api_key={_giphyApiKey}&q={query}&limit=10";
                var response = await _httpClient.GetStringAsync(requestUri);
                return Ok(response);
            }
            catch (HttpRequestException)
            {
                return StatusCode(500, new { error = "Error fetching data from Giphy" });
            }
        }
    }
}
