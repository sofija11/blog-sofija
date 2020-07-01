using Blog.Application.DTO;
using Blog.DataAccess;
using FluentValidation;
using System.Linq;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Implementation.Validators.UserUseCases
{
    public class UpdateUserUseCaseValidator : AbstractValidator<UserUseCaseDto>
    {
        public UpdateUserUseCaseValidator(BlogContext context)
        {
            RuleFor(x => x.UseCaseId).NotEmpty();
            RuleFor(x => x.UserId).NotEmpty()
                .Must(x => context.Users.Any(u => u.Id == x)).WithMessage("You can update only useCases for users in DATABASE");
        }
    }
}
