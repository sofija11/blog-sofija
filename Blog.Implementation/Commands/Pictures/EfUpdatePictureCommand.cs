using AutoMapper;
using Blog.Application.Commands.Picture;
using Blog.Application.DTO;
using Blog.Application.Exceptions;
using Blog.DataAccess;
using Blog.Domain.Entities;
using Blog.Implementation.Validators.Pictures;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace Blog.Implementation.Commands.Pictures
{
    public class EfUpdatePictureCommand : IUpdatePictureCommand
    {

        private readonly BlogContext context;
        private readonly IMapper mapper;
        private readonly CreatePictureValidator validator;

        public EfUpdatePictureCommand(BlogContext context, IMapper mapper, CreatePictureValidator validator)
        {
            this.context = context;
            this.mapper = mapper;
            this.validator = validator;
        }

        public int Id => 22;

        public string Name =>"Update Picture";

        public void Execute(PictureDto request)
        {
            validator.ValidateAndThrow(request);
           
            //if (findPicture == null)
            //{
            //    throw new EntityNotFoundException(request.Id, typeof(Picture));
            //}

            var picture = context.Pictures.Where(x => x.Id == request.Id).First();

            var newFileName = "";

            if (request.PictureSrc != null)
            {
                var guid = Guid.NewGuid();
                var extension = Path.GetExtension(request.PictureSrc.FileName);

                newFileName = guid + extension;

                var path = Path.Combine("wwwroot", "images", newFileName);

                using (var fileStream = new FileStream(path, FileMode.Create))
                {
                    request.PictureSrc.CopyTo(fileStream);
                }
            }
            else
            {
                newFileName = picture.PictureSrc;
            }

            mapper.Map(request, picture);
            picture.PictureSrc = newFileName;
            context.SaveChanges();

        }
    }
}
