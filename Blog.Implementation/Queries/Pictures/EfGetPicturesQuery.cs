using AutoMapper;
using Blog.Application.DTO;
using Blog.Application.Queries;
using Blog.Application.Queries.Category;
using Blog.Application.Queries.Pictures;
using Blog.Application.Searches;
using Blog.DataAccess;
using Blog.Domain.Entities;
using Blog.Implementation.Extensions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Blog.Implementation.Queries.Pictures
{
    public class EfGetPicturesQuery : IGetPicturesQuery
    {
        private readonly BlogContext context;
        private readonly IMapper mapper;

        public EfGetPicturesQuery(BlogContext context, IMapper mapper)
        {
            this.context = context;
            this.mapper = mapper;
        }

        public int Id => 23;

        public string Name => " Get Paged Pictures";

        public PagedResponse<PictureDto> Execute(PictureSearch search)
        {
            var query = context.Pictures.AsQueryable();

            if (!string.IsNullOrEmpty(search.Name) || !string.IsNullOrWhiteSpace(search.Name))
            {
                query = query.Where(x => x.PictureSrc.ToLower().Contains(search.Name.ToLower()));
            }

            return query.Paged<PictureDto, Picture>(search, mapper);
        }
    }
}
