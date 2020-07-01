using AutoMapper;
using Blog.Application.Commands.UserUseCase;
using Blog.Application.DTO;
using Blog.Application.Exceptions;
using Blog.DataAccess;
using Blog.Domain.Entities;
using Blog.Implementation.Validators.UserUseCases;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Blog.Implementation.Commands.UserUseCase
{
    public class EfUpdateUserUseCaseCommand : IUpdateUserUseCaseCommand
    {
        private readonly BlogContext context;
        private readonly IMapper mapper;
        private readonly UpdateUserUseCaseValidator validator;
        public int Id => 13;

        public string Name => "Update UserUseCase";

        public void Execute(UserUseCaseDto request)
        {
            validator.ValidateAndThrow(request);

            var id = context.UserUseCases.Find(request.Id);

            if (id == null)
            {
                throw new EntityNotFoundException(request.Id, typeof(UserUseCases));
            }
            var usecase = context.UserUseCases.Where(x => x.Id == request.Id).First();
            mapper.Map(request,usecase);


        }
    }
}
