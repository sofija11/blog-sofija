using Blog.Application.DTO;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Application.Commands.UserUseCase
{
    public interface IUpdateUserUseCaseCommand : ICommand<UserUseCaseDto>
    {
    }
}
