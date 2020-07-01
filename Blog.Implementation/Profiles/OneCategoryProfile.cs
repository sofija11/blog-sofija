using AutoMapper;
using Blog.Application.DTO;
using Blog.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Implementation.Profiles
{
    public class OneCategoryProfile : Profile
    {
        public OneCategoryProfile()
        {
            CreateMap<OneCategoryDto, Category>();
            CreateMap<Category, OneCategoryDto>();
        }
        
    }
}
