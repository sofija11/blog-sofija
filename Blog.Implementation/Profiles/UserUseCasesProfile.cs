using AutoMapper;
using Blog.Application.DTO;
using Blog.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Implementation.Profiles
{
    public class UserUseCasesProfile : Profile
    {
        public UserUseCasesProfile()
        {
            CreateMap<UserUseCases, UserUseCaseDto>();
            CreateMap<UserUseCaseDto, UserUseCases>();
        }
    }
}
