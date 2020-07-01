using Blog.Application.DTO;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Application.Commands.Category
{
    public interface IUpdateCategoryCommand : ICommand<CategoryDto>

    {
    }
}
