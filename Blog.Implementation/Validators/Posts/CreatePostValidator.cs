using Blog.Application.DTO;
using Blog.DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Blog.Implementation.Validators.Posts
{
    public class CreatePostValidator : AbstractValidator<PostDto> 
    {
        public CreatePostValidator(BlogContext context)
        {
            RuleFor(x => x.Name).NotEmpty().Must(x => !context.Posts.Any(name => name.Name == x))
                .WithMessage("Name already exists");
            RuleFor(x => x.Text).NotEmpty().MaximumLength(255);

            RuleFor(x => x.PictureId).NotEmpty()
                .Must(x => context.Pictures.Any(s => s.Id == x)).WithMessage("Photo must be in table Pictures");

            RuleFor(x => x.CategoryId)
                .NotEmpty()
                .Must(id => context.Categories.Any(p => p.Id == id))
                .WithMessage("Category has to be valid.");

            //RuleFor(x => x.UserId)
            //    .NotEmpty()
            //    .Must(id => context.Users.Any(u => u.Id == id))
            //    .WithMessage("User must have privilege to add post ");

        }
    }
}
