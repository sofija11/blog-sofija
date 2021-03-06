USE [master]
GO
/****** Object:  Database [ajde]    Script Date: 03/07/2020 04:26:44 ******/
CREATE DATABASE [ajde]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ajde', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ajde.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ajde_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ajde_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ajde] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ajde].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ajde] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ajde] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ajde] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ajde] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ajde] SET ARITHABORT OFF 
GO
ALTER DATABASE [ajde] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ajde] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ajde] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ajde] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ajde] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ajde] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ajde] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ajde] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ajde] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ajde] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ajde] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ajde] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ajde] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ajde] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ajde] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ajde] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ajde] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ajde] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ajde] SET  MULTI_USER 
GO
ALTER DATABASE [ajde] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ajde] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ajde] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ajde] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ajde] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ajde] SET QUERY_STORE = OFF
GO
USE [ajde]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 03/07/2020 04:26:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 03/07/2020 04:26:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[Name] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 03/07/2020 04:26:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[Text] [nvarchar](200) NOT NULL,
	[PostId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pictures]    Script Date: 03/07/2020 04:26:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pictures](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[PictureSrc] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Pictures] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 03/07/2020 04:26:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[Name] [nvarchar](150) NOT NULL,
	[Text] [nvarchar](255) NOT NULL,
	[PictureId] [int] NULL,
	[CategoryId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UseCaseLogs]    Script Date: 03/07/2020 04:26:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UseCaseLogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime2](7) NOT NULL,
	[UseCaseName] [nvarchar](max) NULL,
	[Data] [nvarchar](max) NULL,
	[Actor] [nvarchar](max) NULL,
 CONSTRAINT [PK_UseCaseLogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 03/07/2020 04:26:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[FirstName] [nvarchar](20) NOT NULL,
	[LastName] [nvarchar](30) NOT NULL,
	[Email] [nvarchar](450) NOT NULL,
	[Password] [nvarchar](max) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserUseCases]    Script Date: 03/07/2020 04:26:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserUseCases](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[UseCaseId] [int] NOT NULL,
 CONSTRAINT [PK_UserUseCases] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200627165125_useri', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200630004446_added category', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200630222633_posts, comments and pictures', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200701220122_com', N'3.1.5')
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Name]) VALUES (1, CAST(N'2020-07-02T18:27:22.7958493' AS DateTime2), NULL, 0, NULL, N'Art')
INSERT [dbo].[Categories] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Name]) VALUES (2, CAST(N'2020-07-02T18:27:37.9003576' AS DateTime2), NULL, 0, NULL, N'Picture')
INSERT [dbo].[Categories] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Name]) VALUES (3, CAST(N'2020-07-02T18:28:18.9223759' AS DateTime2), NULL, 0, NULL, N'Nature')
INSERT [dbo].[Categories] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Name]) VALUES (4, CAST(N'2020-07-02T18:28:27.5668925' AS DateTime2), NULL, 0, NULL, N'Sport')
INSERT [dbo].[Categories] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Name]) VALUES (5, CAST(N'2020-07-02T18:28:32.9431893' AS DateTime2), NULL, 0, NULL, N'Love')
INSERT [dbo].[Categories] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Name]) VALUES (6, CAST(N'2020-07-02T18:28:44.4616375' AS DateTime2), NULL, 0, NULL, N'World')
INSERT [dbo].[Categories] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Name]) VALUES (7, CAST(N'2020-07-02T18:28:53.4288525' AS DateTime2), NULL, 0, NULL, N'Horoscope')
INSERT [dbo].[Categories] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Name]) VALUES (8, CAST(N'2020-07-02T18:29:07.5993890' AS DateTime2), NULL, 0, NULL, N'Frienship')
INSERT [dbo].[Categories] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Name]) VALUES (10, CAST(N'2020-07-02T00:00:00.0000000' AS DateTime2), NULL, 0, NULL, N'Water')
INSERT [dbo].[Categories] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Name]) VALUES (11, CAST(N'2020-07-03T02:38:59.9770982' AS DateTime2), NULL, 0, NULL, N'Cat 10')
INSERT [dbo].[Categories] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Name]) VALUES (12, CAST(N'2020-07-03T02:39:09.3702726' AS DateTime2), NULL, 0, NULL, N'Cat 11')
INSERT [dbo].[Categories] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Name]) VALUES (13, CAST(N'2020-07-03T02:39:17.0274932' AS DateTime2), NULL, 0, NULL, N'Cat 12')
INSERT [dbo].[Categories] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Name]) VALUES (14, CAST(N'2020-07-03T02:39:29.3412000' AS DateTime2), NULL, 0, NULL, N'Cat 14')
INSERT [dbo].[Categories] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Name]) VALUES (15, CAST(N'2020-07-03T02:39:36.8857659' AS DateTime2), NULL, 0, NULL, N'Cat 16')
INSERT [dbo].[Categories] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Name]) VALUES (16, CAST(N'2020-07-03T02:39:42.3151814' AS DateTime2), NULL, 0, NULL, N'Cat 17')
INSERT [dbo].[Categories] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Name]) VALUES (17, CAST(N'2020-07-03T02:39:48.8726614' AS DateTime2), CAST(N'2020-07-03T02:41:55.6780748' AS DateTime2), 0, NULL, N'Cat 2033')
INSERT [dbo].[Categories] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Name]) VALUES (18, CAST(N'2020-07-03T02:39:55.9134450' AS DateTime2), NULL, 0, NULL, N'Cat 19')
INSERT [dbo].[Categories] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Name]) VALUES (19, CAST(N'2020-07-03T02:40:05.8049225' AS DateTime2), CAST(N'2020-07-03T02:40:42.7784066' AS DateTime2), 1, CAST(N'2020-07-03T02:40:42.7770577' AS DateTime2), N'Cat 20')
INSERT [dbo].[Categories] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Name]) VALUES (20, CAST(N'2020-07-03T03:04:05.1293140' AS DateTime2), NULL, 0, NULL, N'Cat45')
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Pictures] ON 

INSERT [dbo].[Pictures] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [PictureSrc]) VALUES (1, CAST(N'2020-07-02T18:26:10.0402367' AS DateTime2), NULL, 0, NULL, N'88aa8d83-d5ea-4046-b581-ab91fdfa9bb5.jpg')
INSERT [dbo].[Pictures] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [PictureSrc]) VALUES (2, CAST(N'2020-07-03T03:05:53.9003955' AS DateTime2), CAST(N'2020-07-03T03:07:02.5184360' AS DateTime2), 1, CAST(N'2020-07-03T03:07:02.5183207' AS DateTime2), N'36224089-efaf-40bf-805c-34c26b8ff563.jpg')
INSERT [dbo].[Pictures] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [PictureSrc]) VALUES (3, CAST(N'2020-07-03T03:06:27.0018557' AS DateTime2), NULL, 0, NULL, N'b52ee411-b052-4299-8023-3ac019b82c69.png')
INSERT [dbo].[Pictures] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [PictureSrc]) VALUES (4, CAST(N'2020-07-03T03:06:36.6734714' AS DateTime2), NULL, 0, NULL, N'b344a905-f2be-4816-828c-356121df79b0.png')
SET IDENTITY_INSERT [dbo].[Pictures] OFF
SET IDENTITY_INSERT [dbo].[Posts] ON 

INSERT [dbo].[Posts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Name], [Text], [PictureId], [CategoryId], [UserId]) VALUES (16, CAST(N'2020-07-02T18:25:07.1503848' AS DateTime2), NULL, 0, NULL, N'Post1', N'hdhfsf', 1, 7, 1)
INSERT [dbo].[Posts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Name], [Text], [PictureId], [CategoryId], [UserId]) VALUES (17, CAST(N'2020-07-02T18:25:07.1503848' AS DateTime2), NULL, 0, NULL, N'Post2', N'frgrgr', 2, 8, 2)
INSERT [dbo].[Posts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Name], [Text], [PictureId], [CategoryId], [UserId]) VALUES (19, CAST(N'2020-07-02T18:25:07.1503848' AS DateTime2), NULL, 0, NULL, N'Post3', N'gegrge', 3, 4, 3)
INSERT [dbo].[Posts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [Name], [Text], [PictureId], [CategoryId], [UserId]) VALUES (20, CAST(N'2020-07-02T18:25:07.1503848' AS DateTime2), NULL, 0, NULL, N'Post4', N'ffrwfwf', 2, 8, 10)
SET IDENTITY_INSERT [dbo].[Posts] OFF
SET IDENTITY_INSERT [dbo].[UseCaseLogs] ON 

INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (1, CAST(N'2020-07-02T16:24:59.3509928' AS DateTime2), N'Create User', N'{"Id":0,"FirstName":"Mirjan","LastName":"Likic","Email":"mire@gmail.com","Password":"hsixiasj65","useCasesForUser":[]}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (2, CAST(N'2020-07-02T16:26:08.4770573' AS DateTime2), N'Create picture', N'{"Id":0,"PictureSrc":{"ContentDisposition":"form-data; name=\"PictureSrc\"; filename=\"blog4.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"PictureSrc\"; filename=\"blog4.jpg\""],"Content-Type":["image/jpeg"]},"Length":110643,"Name":"PictureSrc","FileName":"blog4.jpg"}}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (3, CAST(N'2020-07-02T16:27:22.6714221' AS DateTime2), N'Create Category', N'{"Id":0,"Name":"Art"}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (4, CAST(N'2020-07-02T16:27:37.5436549' AS DateTime2), N'Create Category', N'{"Id":0,"Name":"Picture"}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (5, CAST(N'2020-07-02T16:28:18.8703821' AS DateTime2), N'Create Category', N'{"Id":0,"Name":"Nature"}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (6, CAST(N'2020-07-02T16:28:27.3924601' AS DateTime2), N'Create Category', N'{"Id":0,"Name":"Sport"}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (7, CAST(N'2020-07-02T16:28:32.8505166' AS DateTime2), N'Create Category', N'{"Id":0,"Name":"Love"}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (8, CAST(N'2020-07-02T16:28:44.3630455' AS DateTime2), N'Create Category', N'{"Id":0,"Name":"World"}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (9, CAST(N'2020-07-02T16:28:53.2691137' AS DateTime2), N'Create Category', N'{"Id":0,"Name":"Horoscope"}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (10, CAST(N'2020-07-02T16:29:07.5736547' AS DateTime2), N'Create Category', N'{"Id":0,"Name":"Frienship"}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (11, CAST(N'2020-07-03T00:38:46.7082560' AS DateTime2), N'Create Category', N'{"Id":0,"Name":"Cat 10"}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (12, CAST(N'2020-07-03T00:39:09.1915113' AS DateTime2), N'Create Category', N'{"Id":0,"Name":"Cat 11"}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (13, CAST(N'2020-07-03T00:39:16.5264969' AS DateTime2), N'Create Category', N'{"Id":0,"Name":"Cat 12"}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (14, CAST(N'2020-07-03T00:39:29.1281389' AS DateTime2), N'Create Category', N'{"Id":0,"Name":"Cat 14"}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (15, CAST(N'2020-07-03T00:39:36.7962705' AS DateTime2), N'Create Category', N'{"Id":0,"Name":"Cat 16"}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (16, CAST(N'2020-07-03T00:39:42.2903319' AS DateTime2), N'Create Category', N'{"Id":0,"Name":"Cat 17"}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (17, CAST(N'2020-07-03T00:39:48.7683354' AS DateTime2), N'Create Category', N'{"Id":0,"Name":"Cat 18"}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (18, CAST(N'2020-07-03T00:39:55.7125439' AS DateTime2), N'Create Category', N'{"Id":0,"Name":"Cat 19"}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (19, CAST(N'2020-07-03T00:40:05.6201902' AS DateTime2), N'Create Category', N'{"Id":0,"Name":"Cat 20"}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (20, CAST(N'2020-07-03T00:40:42.4696961' AS DateTime2), N'Delete Category', N'19', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (21, CAST(N'2020-07-03T00:40:56.6635208' AS DateTime2), N'Get One Category', N'18', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (22, CAST(N'2020-07-03T00:41:24.6641953' AS DateTime2), N'Get Categories', N'{"Name":null,"PerPage":3,"Page":1}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (23, CAST(N'2020-07-03T00:41:54.6642730' AS DateTime2), N'Update Category', N'{"Id":17,"Name":"Cat 2033"}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (24, CAST(N'2020-07-03T00:42:45.6253444' AS DateTime2), N'Search Users', N'{"Name":null,"PerPage":3,"Page":1}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (25, CAST(N'2020-07-03T00:43:22.8902114' AS DateTime2), N'Get one user', N'1', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (26, CAST(N'2020-07-03T00:45:11.3222714' AS DateTime2), N'Create User', N'{"Id":0,"FirstName":"Marko","LastName":"Jovanic","Email":"mare@gmail.com","Password":"passssiscuhuc887","useCasesForUser":[]}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (27, CAST(N'2020-07-03T00:45:23.3298309' AS DateTime2), N'Create User', N'{"Id":0,"FirstName":"Darko","LastName":"Jovanic","Email":"mare@gmail.com","Password":"passssiscuhuc887","useCasesForUser":[]}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (28, CAST(N'2020-07-03T00:46:18.0122994' AS DateTime2), N'Create User', N'{"Id":0,"FirstName":"Darko","LastName":"Jovanic","Email":"dare@gmail.com","Password":"passdsiscuhuc887","useCasesForUser":[]}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (29, CAST(N'2020-07-03T00:46:43.8405153' AS DateTime2), N'Create User', N'{"Id":0,"FirstName":"Ljubica","LastName":"Zaric","Email":"ljube@gmail.com","Password":"pasvdvedsdsiscuhuc887","useCasesForUser":[]}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (30, CAST(N'2020-07-03T00:47:06.3809205' AS DateTime2), N'Create User', N'{"Id":0,"FirstName":"Masan","LastName":"Nikolic","Email":"nik@gmail.com","Password":"pasdsiscuhuc887","useCasesForUser":[]}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (31, CAST(N'2020-07-03T00:47:48.7985429' AS DateTime2), N'Create User', N'{"Id":0,"FirstName":"Luka","LastName":"Jovic","Email":"luke@gmail.com","Password":"pasdsidcscuhuc887","useCasesForUser":[]}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (32, CAST(N'2020-07-03T00:48:07.3525133' AS DateTime2), N'Create User', N'{"Id":0,"FirstName":"Marijan","LastName":"Jovic","Email":"ljovme@gmail.com","Password":"padcscuhuc887","useCasesForUser":[]}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (33, CAST(N'2020-07-03T00:48:29.4525926' AS DateTime2), N'Create User', N'{"Id":0,"FirstName":"Slavica","LastName":"Peric","Email":"slavka@gmail.com","Password":"padcscdduhuc887","useCasesForUser":[]}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (34, CAST(N'2020-07-03T00:48:55.6472201' AS DateTime2), N'Create User', N'{"Id":0,"FirstName":"Milica","LastName":"Zlatic","Email":"mici@gmail.com","Password":"padcscddcdcduhuc887","useCasesForUser":[]}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (35, CAST(N'2020-07-03T00:49:23.2770410' AS DateTime2), N'Create User', N'{"Id":0,"FirstName":"Zoran","LastName":"Peric","Email":"perke@gmail.com","Password":"7888duhuc887","useCasesForUser":[]}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (36, CAST(N'2020-07-03T00:49:46.5259717' AS DateTime2), N'Create User', N'{"Id":0,"FirstName":"Snezana","LastName":"Rokvic","Email":"snro@gmail.com","Password":"788hsuchuc887","useCasesForUser":[]}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (37, CAST(N'2020-07-03T00:51:09.0755419' AS DateTime2), N'Create User', N'{"Id":0,"FirstName":"Kristina","LastName":"Marjanovic","Email":"kile@gmail.com","Password":"788hsuchuc887","useCasesForUser":[]}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (38, CAST(N'2020-07-03T00:51:30.9144079' AS DateTime2), N'Create User', N'{"Id":0,"FirstName":"Bozana","LastName":"Mavic","Email":"boza@gmail.com","Password":"788hsuchuc887","useCasesForUser":[]}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (39, CAST(N'2020-07-03T00:52:02.4997388' AS DateTime2), N'Create User', N'{"Id":0,"FirstName":"Dragana","LastName":"Markovic","Email":"gaga@gmail.com","Password":"srce8338298w","useCasesForUser":[]}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (40, CAST(N'2020-07-03T00:52:34.3466594' AS DateTime2), N'Create User', N'{"Id":0,"FirstName":"Petar","LastName":"Milic","Email":"perica@gmail.com","Password":"idhsihahf988w","useCasesForUser":[]}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (41, CAST(N'2020-07-03T00:53:16.0135072' AS DateTime2), N'Create User', N'{"Id":0,"FirstName":"Ljiljana","LastName":"Nikolic","Email":"lili@gmail.com","Password":"isccihahf988w","useCasesForUser":[]}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (42, CAST(N'2020-07-03T00:53:40.4032887' AS DateTime2), N'Create User', N'{"Id":0,"FirstName":"Katarina","LastName":"Spasic","Email":"kata@gmail.com","Password":"iscccddcfeihahf988w","useCasesForUser":[]}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (43, CAST(N'2020-07-03T00:54:06.7022140' AS DateTime2), N'Create User', N'{"Id":0,"FirstName":"Zarko","LastName":"Jovanic","Email":"zare@gmail.com","Password":"iscccd88w","useCasesForUser":[]}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (44, CAST(N'2020-07-03T00:54:24.0851149' AS DateTime2), N'Create User', N'{"Id":0,"FirstName":"Zarko","LastName":"Jovanic","Email":"zare@gmail.com","Password":"iscccdrgergg88w","useCasesForUser":[]}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (45, CAST(N'2020-07-03T00:54:51.4370832' AS DateTime2), N'Create User', N'{"Id":0,"FirstName":"Dimitrije","LastName":"Milic","Email":"dim@gmail.com","Password":"idjdeifjsw","useCasesForUser":[]}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (46, CAST(N'2020-07-03T00:55:35.9033816' AS DateTime2), N'Create User', N'{"Id":0,"FirstName":"Milos","LastName":"Mimic","Email":"milmim@gmail.com","Password":"idjdeifjsw455","useCasesForUser":[]}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (47, CAST(N'2020-07-03T00:56:06.0599938' AS DateTime2), N'Delete user', N'6', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (48, CAST(N'2020-07-03T00:56:45.4769617' AS DateTime2), N'Update User', N'{"Id":0,"FirstName":"Strahinja","LastName":"Mimic","Email":"milmim@gmail.com","Password":"idjdeifjsw455","useCasesForUser":[]}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (49, CAST(N'2020-07-03T00:57:07.3467382' AS DateTime2), N'Update User', N'{"Id":0,"FirstName":"Strahinja","LastName":"Mimic","Email":"milmiam@gmail.com","Password":"idjdeifjsw455","useCasesForUser":[]}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (50, CAST(N'2020-07-03T00:57:59.5093530' AS DateTime2), N'Update User', N'{"Id":0,"FirstName":"Strahinja","LastName":"Mimic","Email":"milmiam@gmail.com","Password":"idjdeifjsw455","useCasesForUser":[]}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (51, CAST(N'2020-07-03T01:02:59.1966203' AS DateTime2), N'Get Categories', N'{"Name":null,"PerPage":3,"Page":1}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (52, CAST(N'2020-07-03T01:04:03.6875479' AS DateTime2), N'Create Category', N'{"Id":0,"Name":"Cat45"}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (53, CAST(N'2020-07-03T01:05:52.8566460' AS DateTime2), N'Create picture', N'{"Id":0,"PictureSrc":{"ContentDisposition":"form-data; name=\"PictureSrc\"; filename=\"blog8.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"PictureSrc\"; filename=\"blog8.jpg\""],"Content-Type":["image/jpeg"]},"Length":53276,"Name":"PictureSrc","FileName":"blog8.jpg"}}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (54, CAST(N'2020-07-03T01:06:26.4404683' AS DateTime2), N'Create picture', N'{"Id":0,"PictureSrc":{"ContentDisposition":"form-data; name=\"PictureSrc\"; filename=\"blog-m6.png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"PictureSrc\"; filename=\"blog-m6.png\""],"Content-Type":["image/png"]},"Length":184706,"Name":"PictureSrc","FileName":"blog-m6.png"}}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (55, CAST(N'2020-07-03T01:06:36.4577950' AS DateTime2), N'Create picture', N'{"Id":0,"PictureSrc":{"ContentDisposition":"form-data; name=\"PictureSrc\"; filename=\"blog-m4.png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"PictureSrc\"; filename=\"blog-m4.png\""],"Content-Type":["image/png"]},"Length":156244,"Name":"PictureSrc","FileName":"blog-m4.png"}}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (56, CAST(N'2020-07-03T01:07:02.0358524' AS DateTime2), N'Delete Picture', N'2', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (57, CAST(N'2020-07-03T01:15:30.6443853' AS DateTime2), N'Create User', N'{"Id":0,"FirstName":"Sofija","LastName":"Vitorovic","Email":"sofadmin@gmail.com","Password":"sifra110699","useCasesForUser":[]}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (58, CAST(N'2020-07-03T01:36:07.0043612' AS DateTime2), N'Search Users', N'{"Name":null,"PerPage":3,"Page":1}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (59, CAST(N'2020-07-03T01:42:47.5976578' AS DateTime2), N'Search Users', N'{"Name":null,"PerPage":3,"Page":1}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (60, CAST(N'2020-07-03T01:46:10.6907004' AS DateTime2), N'Search Users', N'{"Name":null,"PerPage":3,"Page":1}', N'Neautorizovan korisnik')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (61, CAST(N'2020-07-03T01:50:31.4346470' AS DateTime2), N'Search Users', N'{"Name":null,"PerPage":3,"Page":1}', N'sofadmin@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (62, CAST(N'2020-07-03T01:52:35.5101880' AS DateTime2), N'Get Categories', N'{"Name":null,"PerPage":3,"Page":1}', N'sofadmin@gmail.com')
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [Actor]) VALUES (63, CAST(N'2020-07-03T01:52:41.9335756' AS DateTime2), N'Get Categories', N'{"Name":null,"PerPage":3,"Page":1}', N'Neautorizovan korisnik')
SET IDENTITY_INSERT [dbo].[UseCaseLogs] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [FirstName], [LastName], [Email], [Password]) VALUES (1, CAST(N'2020-07-02T18:25:07.1503848' AS DateTime2), NULL, 0, NULL, N'Mirjan', N'Likic', N'mire@gmail.com', N'a2e5f868e0e16fe7b1d9910e7685600f9cc9647dcfa1bd64c82394c39b6aad03')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [FirstName], [LastName], [Email], [Password]) VALUES (2, CAST(N'2020-07-03T02:45:12.7249480' AS DateTime2), NULL, 0, NULL, N'Marko', N'Jovanic', N'mare@gmail.com', N'3b4a5be8997c515ff8c93849ab2a42b68124f5dd1effb68fe383b1e9c19e9968')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [FirstName], [LastName], [Email], [Password]) VALUES (3, CAST(N'2020-07-03T02:46:18.1387763' AS DateTime2), NULL, 0, NULL, N'Darko', N'Jovanic', N'dare@gmail.com', N'9e49c361570de60d172932825d27ebf2715c092d45a3625827cf670c7bb03583')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [FirstName], [LastName], [Email], [Password]) VALUES (4, CAST(N'2020-07-03T02:46:44.0224185' AS DateTime2), NULL, 0, NULL, N'Ljubica', N'Zaric', N'ljube@gmail.com', N'59fbe5b0560a91a2d8c246292e11b7f73dd2e42f00a3a72accc686ad13f3a0b1')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [FirstName], [LastName], [Email], [Password]) VALUES (5, CAST(N'2020-07-03T02:47:06.4802500' AS DateTime2), NULL, 0, NULL, N'Masan', N'Nikolic', N'nik@gmail.com', N'a36cfac5f897371c22a91089855bf39a60f89bbedc9473081baf156e5e1b7b4c')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [FirstName], [LastName], [Email], [Password]) VALUES (6, CAST(N'2020-07-03T02:47:48.9626182' AS DateTime2), CAST(N'2020-07-03T02:56:06.1119782' AS DateTime2), 1, CAST(N'2020-07-03T02:56:06.1031499' AS DateTime2), N'Luka', N'Jovic', N'luke@gmail.com', N'07fcf099b0ca16d265bfbe3059a515fa08541a4df726e09d702c97a32ae3493d')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [FirstName], [LastName], [Email], [Password]) VALUES (7, CAST(N'2020-07-03T02:48:07.4629752' AS DateTime2), NULL, 0, NULL, N'Marijan', N'Jovic', N'ljovme@gmail.com', N'eb2eb33b5cd35f735b5b9f5563eb4682e2adb5f9d0619b85f8d06c88a72735b0')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [FirstName], [LastName], [Email], [Password]) VALUES (8, CAST(N'2020-07-03T02:48:29.5506274' AS DateTime2), NULL, 0, NULL, N'Slavica', N'Peric', N'slavka@gmail.com', N'f5cd3f22db73df914131f0bcb847b834dee2396cae9ea2e581e228a43411df61')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [FirstName], [LastName], [Email], [Password]) VALUES (9, CAST(N'2020-07-03T02:48:55.7530167' AS DateTime2), NULL, 0, NULL, N'Milica', N'Zlatic', N'mici@gmail.com', N'0580a8dd827b764f3653508be997ed73a88c126033363dbb75c1cc61410f57ca')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [FirstName], [LastName], [Email], [Password]) VALUES (10, CAST(N'2020-07-03T02:49:23.3684504' AS DateTime2), NULL, 0, NULL, N'Zoran', N'Peric', N'perke@gmail.com', N'296a8bb211054f3777964a5d731c2ae40df5c94eb9535a81f6791c112a310126')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [FirstName], [LastName], [Email], [Password]) VALUES (11, CAST(N'2020-07-03T02:49:46.7646788' AS DateTime2), NULL, 0, NULL, N'Snezana', N'Rokvic', N'snro@gmail.com', N'b18283db4808139b2328a1457ff999a6130d0419e378b254efcbff34bdc5d653')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [FirstName], [LastName], [Email], [Password]) VALUES (12, CAST(N'2020-07-03T02:51:09.1601443' AS DateTime2), NULL, 0, NULL, N'Kristina', N'Marjanovic', N'kile@gmail.com', N'b18283db4808139b2328a1457ff999a6130d0419e378b254efcbff34bdc5d653')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [FirstName], [LastName], [Email], [Password]) VALUES (13, CAST(N'2020-07-03T02:51:30.9580342' AS DateTime2), NULL, 0, NULL, N'Bozana', N'Mavic', N'boza@gmail.com', N'b18283db4808139b2328a1457ff999a6130d0419e378b254efcbff34bdc5d653')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [FirstName], [LastName], [Email], [Password]) VALUES (14, CAST(N'2020-07-03T02:52:02.5734625' AS DateTime2), NULL, 0, NULL, N'Dragana', N'Markovic', N'gaga@gmail.com', N'9fb922b484070195d85553f0745059b5307542521556d23a4127ad6fec5f2545')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [FirstName], [LastName], [Email], [Password]) VALUES (15, CAST(N'2020-07-03T02:52:34.3920185' AS DateTime2), NULL, 0, NULL, N'Petar', N'Milic', N'perica@gmail.com', N'5e25e942e8835fb181fee2ca47a7d2f3081003c3b453e01f7e4d5876aee936e4')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [FirstName], [LastName], [Email], [Password]) VALUES (16, CAST(N'2020-07-03T02:53:16.1177806' AS DateTime2), NULL, 0, NULL, N'Ljiljana', N'Nikolic', N'lili@gmail.com', N'2b49b6a5a0f958c5774e7a9fffecee8b6ce1932ba795059d6bf77a090bd7e28c')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [FirstName], [LastName], [Email], [Password]) VALUES (17, CAST(N'2020-07-03T02:53:40.5507078' AS DateTime2), NULL, 0, NULL, N'Katarina', N'Spasic', N'kata@gmail.com', N'e127a852a0b9003b4ce671ad70bfd87959ba077655522c93fe65046c63a5ac72')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [FirstName], [LastName], [Email], [Password]) VALUES (18, CAST(N'2020-07-03T02:54:25.6082971' AS DateTime2), NULL, 0, NULL, N'Zarko', N'Jovanic', N'zare@gmail.com', N'b8623e906691dbbf2fc3bfa163242487100c1682f7e7451de4cb65ebfe30942b')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [FirstName], [LastName], [Email], [Password]) VALUES (19, CAST(N'2020-07-03T02:54:51.4820614' AS DateTime2), NULL, 0, NULL, N'Dimitrije', N'Milic', N'dim@gmail.com', N'e5c2cfc34a079bc89ec04a8c4e15eec931f88a9557824bf92e7a5b9e4ec46f3d')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [FirstName], [LastName], [Email], [Password]) VALUES (20, CAST(N'2020-07-03T02:55:37.0972820' AS DateTime2), NULL, 0, NULL, N'Milos', N'Mimic', N'milmim@gmail.com', N'30112bd931dd7420e1d61afc26bc62279d57b3c89c85374022f3a34f2071090a')
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [DeletedAt], [FirstName], [LastName], [Email], [Password]) VALUES (21, CAST(N'2020-07-03T03:15:38.7451359' AS DateTime2), NULL, 0, NULL, N'Sofija', N'Vitorovic', N'sofadmin@gmail.com', N'aa7714b4b49c3662c92e053128fbaf486b128ac2abfa5fb8111831dcc3f03f72')
SET IDENTITY_INSERT [dbo].[Users] OFF
SET IDENTITY_INSERT [dbo].[UserUseCases] ON 

INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (1, 1, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (2, 1, 3)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (3, 2, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (4, 2, 3)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (5, 3, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (6, 3, 3)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (7, 4, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (8, 4, 3)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (9, 5, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (10, 5, 3)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (11, 6, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (12, 6, 3)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (13, 7, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (14, 7, 3)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (15, 8, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (16, 8, 3)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (17, 9, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (18, 9, 3)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (19, 10, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (20, 10, 3)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (21, 11, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (22, 11, 3)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (23, 12, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (24, 12, 3)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (25, 13, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (26, 13, 3)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (27, 14, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (28, 14, 3)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (29, 15, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (30, 15, 3)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (31, 16, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (32, 16, 3)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (33, 17, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (34, 17, 3)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (35, 18, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (36, 18, 3)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (37, 19, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (38, 19, 3)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (39, 20, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (40, 20, 3)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (41, 21, 1)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (42, 21, 33)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (43, 21, 32)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (44, 21, 31)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (45, 21, 30)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (46, 21, 29)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (47, 21, 28)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (48, 21, 27)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (49, 21, 26)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (50, 21, 25)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (51, 21, 24)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (52, 21, 23)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (53, 21, 20)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (54, 21, 19)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (55, 21, 18)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (56, 21, 34)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (57, 21, 17)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (58, 21, 15)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (59, 21, 14)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (60, 21, 13)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (61, 21, 12)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (62, 21, 11)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (63, 21, 10)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (64, 21, 9)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (65, 21, 8)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (66, 21, 7)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (67, 21, 6)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (68, 21, 5)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (69, 21, 4)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (70, 21, 3)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (71, 21, 2)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (72, 21, 16)
INSERT [dbo].[UserUseCases] ([Id], [UserId], [UseCaseId]) VALUES (73, 21, 35)
SET IDENTITY_INSERT [dbo].[UserUseCases] OFF
/****** Object:  Index [IX_Posts_PictureId]    Script Date: 03/07/2020 04:26:45 ******/
CREATE NONCLUSTERED INDEX [IX_Posts_PictureId] ON [dbo].[Posts]
(
	[PictureId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users_Email]    Script Date: 03/07/2020 04:26:45 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_Email] ON [dbo].[Users]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserUseCases_UserId]    Script Date: 03/07/2020 04:26:45 ******/
CREATE NONCLUSTERED INDEX [IX_UserUseCases_UserId] ON [dbo].[UserUseCases]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Comments] ADD  DEFAULT ((0)) FOR [PostId]
GO
ALTER TABLE [dbo].[Comments] ADD  DEFAULT ((0)) FOR [UserId]
GO
ALTER TABLE [dbo].[Posts] ADD  CONSTRAINT [DF__Posts__CategoryI__5CD6CB2B]  DEFAULT ((0)) FOR [CategoryId]
GO
ALTER TABLE [dbo].[Posts] ADD  CONSTRAINT [DF__Posts__UserId__5DCAEF64]  DEFAULT ((0)) FOR [UserId]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Categories_Id] FOREIGN KEY([Id])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Categories_Id]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Pictures_PictureId] FOREIGN KEY([PictureId])
REFERENCES [dbo].[Pictures] ([Id])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Pictures_PictureId]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Users_Id] FOREIGN KEY([Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Users_Id]
GO
ALTER TABLE [dbo].[UserUseCases]  WITH CHECK ADD  CONSTRAINT [FK_UserUseCases_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserUseCases] CHECK CONSTRAINT [FK_UserUseCases_Users_UserId]
GO
USE [master]
GO
ALTER DATABASE [ajde] SET  READ_WRITE 
GO
