using AutoMapper;
using Blog.Application.Commands.User;
using Blog.Application.DTO;
using Blog.DataAccess;
using Blog.Domain.Entities;
using Blog.Implementation.Validators.Users;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Implementation.Commands.Users
{
    public class EfCreateUserCommand : ICreateUserCommand
    {
        private readonly BlogContext context;
        private readonly IMapper mapper;
        private readonly CreateUserValidator validator;

        public EfCreateUserCommand(BlogContext context, IMapper mapper, CreateUserValidator validator)
        {
            this.context = context;
            this.mapper = mapper;
            this.validator = validator;
        }

        public int Id => 5;

        public string Name => "Create User";

        private IEnumerable<int> useCasesForUser = new List<int> {1,3, };
        public void Execute(UserDto request)
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
        }
    }
}
