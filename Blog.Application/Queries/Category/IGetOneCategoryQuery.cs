using Blog.Application.DTO;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Application.Queries.Category
{
   public interface IGetOneCategoryQuery : IQuery<int,OneCategoryDto>
    {
    }
}
