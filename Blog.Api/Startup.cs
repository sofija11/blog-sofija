using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
using Blog.Api.Core;
using Blog.Application;
using Blog.Application.Email;
using Blog.DataAccess;
using Blog.Implementation.Commands;
using Blog.Implementation.Commands.Categories;
using Blog.Implementation.Commands.Pictures;
using Blog.Implementation.Commands.Posts;
using Blog.Implementation.Commands.Users;
using Blog.Implementation.Commands.UserUseCase;
using Blog.Implementation.Email;
using Blog.Implementation.Logging;
using Blog.Implementation.Queries;
using Blog.Implementation.Queries.Categories;

using Blog.Implementation.Queries.Users;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;

namespace Blog.Api
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddControllers();

            services.AddTransient<BlogContext>();
            
            services.AddApplicationActor();
            services.AddJwt();
            services.AddUseCases();

            services.AddTransient<IEmailSender, SmtpEmailSender>();

            services.AddTransient<IUseCaseLogger, UseCaseLogger>();
            services.AddTransient<IUseCaseExecutor>();

            services.AddHttpContextAccessor();
            services.AddAutoMapper(typeof(EfRegisterUserCommand).Assembly);
            services.AddAutoMapper(typeof(EfCreateUserCommand).Assembly);
            services.AddAutoMapper(typeof(EfCreateUserUseCaseCommand).Assembly);
            services.AddAutoMapper(typeof(EfGetUsersQuery).Assembly);
            services.AddAutoMapper(typeof(EfGetOneUserQuery).Assembly);
            services.AddAutoMapper(typeof(EfGetUseCaseLogsQuery).Assembly);
            services.AddAutoMapper(typeof(EfCreateCategoryCommand).Assembly);
            services.AddAutoMapper(typeof(EfGetCategoriesQuery).Assembly);
            services.AddAutoMapper(typeof(EfCreatePictureCommand).Assembly);
            services.AddAutoMapper(typeof(EfUpdatePictureCommand).Assembly);
            services.AddAutoMapper(typeof(EfCreatePostCommand).Assembly);


        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseRouting();

            app.UseMiddleware<GlobalExceptionHandler>();
            app.UseAuthentication();
            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
