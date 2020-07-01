using AutoMapper;
using Blog.Application.Commands.Category;
using Blog.Application.DTO;
using Blog.Application.Exceptions;
using Blog.DataAccess;
using Blog.Domain.Entities;
using Blog.Implementation.Validators.Categories;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Blog.Implementation.Commands.Categories
{
    public class EfUpdateCategoryCommand : IUpdateCategoryCommand
    {
        private readonly BlogContext context;
        private readonly IMapper mapper;
        private readonly CreateCategoryValidator validator;

        public EfUpdateCategoryCommand(BlogContext context, IMapper mapper, CreateCategoryValidator validator)
        {
            this.context = context;
            this.mapper = mapper;
            this.validator = validator;
        }

        public int Id => 17;

        public string Name => "Update Category";

        public void Execute(CategoryDto request)
        {
            validator.ValidateAndThrow(request);
            var category = context.Categories.Find(request.Id);
            if (category == null)
            {
                throw new EntityNotFoundException(request.Id, typeof(Category));
            }

            var categoryy = context.Categories.Where(x => x.Id == request.Id).First();

            mapper.Map(request, categoryy);
            context.SaveChanges();
        }
    }
}
