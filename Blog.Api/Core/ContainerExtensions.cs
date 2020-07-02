using Blog.Application;
using Blog.Application.Commands;
using Blog.Application.Commands.Category;
using Blog.Application.Commands.Picture;
using Blog.Application.Commands.Post;
using Blog.Application.Commands.User;
using Blog.Application.Commands.UserUseCase;
using Blog.Application.Queries;
using Blog.Application.Queries.Category;
using Blog.Application.Queries.Pictures;
using Blog.Application.Queries.Users;
using Blog.Application.Searches;
using Blog.DataAccess;
using Blog.Implementation.Commands;
using Blog.Implementation.Commands.Categories;
using Blog.Implementation.Commands.Pictures;
using Blog.Implementation.Commands.Posts;
using Blog.Implementation.Commands.Users;
using Blog.Implementation.Commands.UserUseCase;
using Blog.Implementation.Queries;
using Blog.Implementation.Queries.Categories;

using Blog.Implementation.Queries.Users;
using Blog.Implementation.Validators;
using Blog.Implementation.Validators.Categories;
using Blog.Implementation.Validators.Pictures;
using Blog.Implementation.Validators.Posts;
using Blog.Implementation.Validators.Users;
using Blog.Implementation.Validators.UserUseCases;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.IdentityModel.Tokens;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Blog.Api.Core
{
    public static  class ContainerExtensions
    {
        public static void AddUseCases(this IServiceCollection services)
        {

            services.AddTransient<ICreateUserCommand, EfCreateUserCommand>();
            services.AddTransient<IRegisterUserCommand, EfRegisterUserCommand>();
            services.AddTransient<IDeleteUserCommand, EfDeleteUserCommand>();
            services.AddTransient<ICreateUserUseCaseCommand, EfCreateUserUseCaseCommand>();
            services.AddTransient<IDeleteUserUseCaseCommand, EfDeleteUserUseCaseCommand>();
            services.AddTransient<IUpdateUserCommand, EfUpdateUserCommand>();
            services.AddTransient<IUpdateUserUseCaseCommand,EfUpdateUserUseCaseCommand>();
            services.AddTransient<ICreateCategoryCommand, EfCreateCategoryCommand>();
            services.AddTransient<IDeleteCategoryCommand, EfDeleteCategoryCommand>();
            services.AddTransient<IUpdateCategoryCommand, EfUpdateCategoryCommand>();
            services.AddTransient<ICreatePictureCommand, EfCreatePictureCommand>();
            services.AddTransient<IDeletePictureCommand, EfDeletePictureCommand>();
            services.AddTransient<IUpdatePictureCommand, EfUpdatePictureCommand>();
            services.AddTransient<ICreatePostCommand, EfCreatePostCommand>();
            ///querii
            ///

            services.AddTransient<IGetUsersQuery, EfGetUsersQuery>();
            services.AddTransient<IGetOneUserQuery, EfGetOneUserQuery>();
            services.AddTransient<IGetUseCaseLogsQuery, EfGetUseCaseLogsQuery>();
            services.AddTransient<IGetCategoriesQuery, EfGetCategoriesQuery>();
            services.AddTransient<IGetOneCategoryQuery, EfGetOneCategoryQuery>();
           


            //validatori
            services.AddTransient<RegisterUserValidator>();
            services.AddTransient<CreateUserValidator>();
            services.AddTransient<CreateUserUseCaseValidator>();
            services.AddTransient<UpdateUserValidator>();
            services.AddTransient<UpdateUserUseCaseValidator>();
            services.AddTransient<CreateCategoryValidator>();
            services.AddTransient<DeleteCategoryValidator>();
            services.AddTransient<CreatePictureValidator>();
            services.AddTransient<DeletePictureValidator>();
            services.AddTransient<CreatePostValidator>();
        }
        public static void AddApplicationActor(this IServiceCollection services)
        {
            services.AddTransient<IApplicationActor>(x =>
            {
                var accessor = x.GetService<IHttpContextAccessor>();


                var user = accessor.HttpContext.User;

                if (user.FindFirst("ActorData") == null)
                {
                    return new AnnonymusActor();
                }

                var actorString = user.FindFirst("ActorData").Value;

                var actor = JsonConvert.DeserializeObject<JwtActor>(actorString);

                return actor;

            });

        }
        public static void AddJwt(this IServiceCollection services)
        {
            services.AddTransient<JwtManager>(x =>
            {
                var context = x.GetService<BlogContext>();

                return new JwtManager(context);
            });

           
            services.AddAuthentication(options =>
            {
                options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultSignInScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultScheme = JwtBearerDefaults.AuthenticationScheme;
            }).AddJwtBearer(cfg =>
            {
                cfg.RequireHttpsMetadata = false;
                cfg.SaveToken = true;
                cfg.TokenValidationParameters = new TokenValidationParameters
                {
                    ValidIssuer = "asp_api",
                    ValidateIssuer = true,
                    ValidAudience = "Any",
                    ValidateAudience = true,
                    IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes("ThisIsMyVerySecretKey")),
                    ValidateIssuerSigningKey = true,
                    ValidateLifetime = true,
                    ClockSkew = TimeSpan.Zero
                };
            });
        }
    }
}
