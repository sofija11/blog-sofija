using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Blog.Application;
using Blog.Application.Searches;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Blog.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UseCaseLogsController : ControllerBase
    {
        private readonly IApplicationActor actor;
        private readonly IUseCaseExecutor executor;

        public UseCaseLogsController(IApplicationActor actor, IUseCaseExecutor executor)
        {
            this.actor = actor;
            this.executor = executor;
        }

        // GET: api/UseCaseLogs
        [HttpGet]
        public IActionResult Get([FromQuery] UseCaseLogsSearch search,[FromServices] IGetUseCaseLogsQuery query)
        {
            return Ok(executor.ExecuteQuery(query, search));
        }

       
        // POST: api/UseCaseLogs
        [HttpPost]
        public void Post([FromBody] string value)
        {
        }

        // PUT: api/UseCaseLogs/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] string value)
        {
        }

        // DELETE: api/ApiWithActions/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
        }
    }
}
