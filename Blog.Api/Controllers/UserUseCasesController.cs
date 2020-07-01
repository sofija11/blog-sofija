using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Blog.Application;
using Blog.Application.Commands.UserUseCase;
using Blog.Application.DTO;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Blog.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserUseCasesController : ControllerBase
    {
       
        private readonly IUseCaseExecutor executor;

        public UserUseCasesController( IUseCaseExecutor executor)
        {
           
            this.executor = executor;
        }
        // GET: api/UserUseCases
        [HttpGet]
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        

        // POST: api/UserUseCases
        [HttpPost]
        public void Post([FromBody] UserUseCaseDto dto, [FromServices] ICreateUserUseCaseCommand command)
        {
            executor.ExecuteCommand(command, dto);
        }

        // PUT: api/UserUseCases/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] UserUseCaseDto dto, [FromServices] IUpdateUserUseCaseCommand command )
        {
            dto.Id = id;
            executor.ExecuteCommand(command, dto);
            return StatusCode(StatusCodes.Status204NoContent);
        }

        // DELETE: api/ApiWithActions/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeleteUserUseCaseCommand command)
        {
            executor.ExecuteCommand(command, id);
            return NoContent();
        }
    }
}
