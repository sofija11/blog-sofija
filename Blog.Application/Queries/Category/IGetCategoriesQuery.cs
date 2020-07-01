using Blog.Application.DTO;
using Blog.Application.Searches;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Application.Queries.Category
{
    public interface IGetCategoriesQuery : IQuery<CategorySearch,PagedResponse<CategoryDto>>
    {
    }
}
