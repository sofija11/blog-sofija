﻿using AutoMapper;
using Blog.Application.Commands;
using Blog.Application.DTO;
using Blog.Application.Email;
using Blog.DataAccess;
using Blog.Domain.Entities;
using Blog.Implementation.Validators;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Implementation.Commands
{
    public class EfRegisterUserCommand : IRegisterUserCommand
    {
        private readonly BlogContext context;
        private readonly RegisterUserValidator validator;
        private readonly IMapper mapper;
        private readonly IEmailSender email;
        public EfRegisterUserCommand(BlogContext context, RegisterUserValidator validator, IMapper mapper, IEmailSender email)
        {
            this.context = context;
            this.validator = validator;
            this.mapper = mapper;
            this.email = email;
        }


        public int Id => 1;

        public string Name => "User Registration";
        private IEnumerable<int> useCasesForUser = new List<int> { 1,3,5 };
        public void Execute(RegisterUserDto request)
        {
            validator.ValidateAndThrow(request);
            var user = mapper.Map<User>(request);

            user.Password = EasyEncryption.SHA.ComputeSHA256Hash(request.Password);
            context.Add(user);
            context.SaveChanges();

            int id = user.Id;
            foreach (var uc in useCasesForUser)
            {
                context.UserUseCases.Add(new UserUseCases
                {
                    UserId = id,
                    UseCaseId = uc
                });
            }

            context.SaveChanges();

            email.Send(new SendEmailDto
            {
                Content = "<h2> Successful registration to Blog </h2>",
                SendTo = request.Email,
                Subject = "Successful registration"

            });
        }
    }
}
