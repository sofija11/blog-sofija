using Blog.Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace Blog.DataAccess.Configurations
{
    public class CategoryConfigurations : IEntityTypeConfiguration<Category>
    {
        public void Configure(EntityTypeBuilder<Category> builder)
        {
            builder.Property(x => x.Name).IsRequired().HasMaxLength(20);

            builder.HasMany(p => p.Posts)
                .WithOne(c => c.Category)
                .HasForeignKey(p => p.Id)
                .OnDelete(DeleteBehavior.Restrict);
        }
    }
}
