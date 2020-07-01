using AutoMapper;
using Blog.Application.Commands.UserUseCase;
using Blog.Application.DTO;
using Blog.DataAccess;
using Blog.Domain.Entities;
using Blog.Implementation.Validators.UserUseCases;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Implementation.Commands.UserUseCase
{
    public class EfCreateUserUseCaseCommand : ICreateUserUseCaseCommand
    {
        private readonly BlogContext context;
        private readonly IMapper mapper;
        private readonly CreateUserUseCaseValidator validator;

        public EfCreateUserUseCaseCommand(BlogContext context, IMapper mapper, CreateUserUseCaseValidator validator)
        {
            this.context = context;
            this.mapper = mapper;
            this.validator = validator;
        }

        public int Id => 9;

        public string Name => "CreateUserUseCases";

        public void Execute(UserUseCaseDto request)
        {
            validator.ValidateAndThrow(request);

            var useCase = mapper.Map<UserUseCases>(request);

            context.Add(useCase);
            context.SaveChanges();
        }
    }
}
