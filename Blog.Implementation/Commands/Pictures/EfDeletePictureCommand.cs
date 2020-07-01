using AutoMapper;
using Blog.Application.Commands.Picture;
using Blog.Application.Exceptions;
using Blog.DataAccess;
using Blog.Domain.Entities;
using Blog.Implementation.Validators.Pictures;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Implementation.Commands.Pictures
{
    public class EfDeletePictureCommand : IDeletePictureCommand
    {
        private readonly BlogContext context;
       
        private readonly DeletePictureValidator validator;

        public EfDeletePictureCommand(BlogContext context, DeletePictureValidator validator)
        {
            this.context = context;
           
            this.validator = validator;
        }

        public int Id => 21;

        public string Name => "Delete Picture";

        public void Execute(int request)
        {
            //validator.ValidateAndThrow(request);

            var findPicture = context.Pictures.Find(request);

            if (findPicture == null)
            {
                throw new EntityNotFoundException(request, typeof(Picture));
            }

            findPicture.IsDeleted = true;
            findPicture.DeletedAt = DateTime.Now;

            context.SaveChanges();
        }
    }
}
