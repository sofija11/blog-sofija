﻿using Blog.Application.DTO;
using Blog.Application.Searches;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.Application.Queries.Pictures
{
    public interface IGetPicturesQuery : IQuery<PictureSearch, PagedResponse<PictureDto>>
    {

    }
}
