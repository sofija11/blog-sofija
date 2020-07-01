using AutoMapper;
using Blog.Application.DTO;
using Blog.Application.Exceptions;
using Blog.Application.Queries.Category;
using Blog.DataAccess;
using Blog.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Blog.Implementation.Queries.Categories
{
    public class EfGetOneCategoryQuery :IGetOneCategoryQuery
    {
        private readonly BlogContext context;
        private readonly IMapper mapper;

        public EfGetOneCategoryQuery(BlogContext context, IMapper mapper)
        {
            this.context = context;
            this.mapper = mapper;
        }

        public int Id => 19;

        public string Name => "Get One Category";

        public OneCategoryDto Execute(int search)
        {
            var category = context.Categories.Find(search);

            if (category == null)
            {
                throw new EntityNotFoundException(search, typeof(Category));
            }

            var query = context.Categories.Where(u => u.Id == search).First();

            var categoryy = mapper.Map<OneCategoryDto>(query);

            return categoryy;
        }
    }
}
