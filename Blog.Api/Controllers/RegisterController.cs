using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Blog.Application;
using Blog.Application.Commands;
using Blog.Application.DTO;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Blog.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RegisterController : ControllerBase
    {
        private readonly IUseCaseExecutor executor;
        public RegisterController(IUseCaseExecutor executor)
        {
            this.executor = executor;
        }
        // POST: api/Register
        [HttpPost]
        public void Post([FromBody] RegisterUserDto dto,
            [FromServices] IRegisterUserCommand command)
        {
            executor.ExecuteCommand(command, dto);
        }

       
    }
}
