﻿using Blog.Application.DTO;
using Blog.DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Blog.Implementation.Validators
{
    public class RegisterUserValidator :AbstractValidator<RegisterUserDto>
    {
        public RegisterUserValidator(BlogContext context)
        {
            
            RuleFor(x => x.FirstName).NotEmpty();
            RuleFor(x => x.LastName).NotEmpty();
            RuleFor(x => x.Password).NotEmpty().MinimumLength(10);

            RuleFor(x => x.Email).NotEmpty()
                .Must(x => !context.Users.Any(user => user.Email == x))
                .WithMessage("Email is already taken")
                .EmailAddress();

           
        }
    }
}
