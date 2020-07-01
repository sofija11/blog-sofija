using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Blog.Application;
using Blog.Application.Commands.Picture;
using Blog.Application.DTO;
using Blog.Application.Queries.Category;
using Blog.Application.Queries.Pictures;
using Blog.Application.Searches;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Blog.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PictureController : ControllerBase
    {
        private readonly IUseCaseExecutor executor;
        private readonly IApplicationActor actor;

        public PictureController(IUseCaseExecutor executor, IApplicationActor actor)
        {
            this.executor = executor;
            this.actor = actor;
        }

        // GET: api/Picture
        [HttpGet]
        public IActionResult Get([FromQuery] PictureSearch search, [FromServices] IGetPicturesQuery query)
        {
            return Ok(executor.ExecuteQuery(query, search));
        }

        //// GET: api/Picture/5
        //[HttpGet("{id}", Name = "Get")]
        //public string Get(int id)
        //{
        //    return "value";
        //}

        // POST: api/Picture
        [HttpPost]
        public IActionResult Post([FromForm] PictureDto dto, [FromServices] ICreatePictureCommand command)
        {
            executor.ExecuteCommand(command, dto);
           
            return StatusCode(StatusCodes.Status201Created);
        }

        // PUT: api/Picture/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromForm] PictureDto dto, [FromServices] IUpdatePictureCommand command)
        {
            executor.ExecuteCommand(command, dto);

            return StatusCode(StatusCodes.Status201Created);
        }

        // DELETE: api/ApiWithActions/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeletePictureCommand command)
        {
            executor.ExecuteCommand(command, id);
            return StatusCode(StatusCodes.Status204NoContent);
        }
    }
}
