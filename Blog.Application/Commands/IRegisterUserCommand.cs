﻿using Blog.Application.DTO;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Application.Commands
{
    public interface IRegisterUserCommand : ICommand<RegisterUserDto>
    {
    }
}
