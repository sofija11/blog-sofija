using Blog.Application.Commands.UserUseCase;
using Blog.Application.Exceptions;
using Blog.DataAccess;
using Blog.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Implementation.Commands.UserUseCase
{
    public class EfDeleteUserUseCaseCommand : IDeleteUserUseCaseCommand
    {
        private readonly BlogContext context;

        public EfDeleteUserUseCaseCommand(BlogContext context)
        {
            this.context = context;
        }
        public int Id => 10;

        public string Name => "Delete UserUseCase";

        public void Execute(int request)
        {
            var useCase = context.UserUseCases.Find(request);

            if (useCase == null)
            {
                throw new EntityNotFoundException(request,typeof(UserUseCases));
            }

            context.UserUseCases.Remove(useCase);

            context.SaveChanges();
        }
    }
}
