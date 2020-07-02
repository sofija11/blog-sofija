using Blog.Application.DTO;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Application.Commands.Post
{
    public interface ICreatePostCommand : ICommand<PostDto>
    {
    }
}
