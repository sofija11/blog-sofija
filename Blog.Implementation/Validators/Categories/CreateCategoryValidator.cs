using Blog.Application.DTO;
using Blog.DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Blog.Implementation.Validators.Categories
{
    public class CreateCategoryValidator : AbstractValidator<CategoryDto> 
    {
        public CreateCategoryValidator(BlogContext context)
        {
            RuleFor(x => x.Name)
                .NotEmpty()
                .NotNull()
                .MinimumLength(3)
                .Must(x => !context.Categories.Any(c => c.Name == x))
                .WithMessage("Category already exist");
        }
    }
    
}
