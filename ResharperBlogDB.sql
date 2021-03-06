USE [master]
GO
/****** Object:  Database [ResharperBlogDB]    Script Date: 06/13/2015 18:30:09 ******/
CREATE DATABASE [ResharperBlogDB] ON  PRIMARY 
( NAME = N'ResharperBlogDB', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.SQLEXPRESSR2\MSSQL\DATA\ResharperBlogDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ResharperBlogDB_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.SQLEXPRESSR2\MSSQL\DATA\ResharperBlogDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ResharperBlogDB] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ResharperBlogDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ResharperBlogDB] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [ResharperBlogDB] SET ANSI_NULLS OFF
GO
ALTER DATABASE [ResharperBlogDB] SET ANSI_PADDING OFF
GO
ALTER DATABASE [ResharperBlogDB] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [ResharperBlogDB] SET ARITHABORT OFF
GO
ALTER DATABASE [ResharperBlogDB] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [ResharperBlogDB] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [ResharperBlogDB] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [ResharperBlogDB] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [ResharperBlogDB] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [ResharperBlogDB] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [ResharperBlogDB] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [ResharperBlogDB] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [ResharperBlogDB] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [ResharperBlogDB] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [ResharperBlogDB] SET  DISABLE_BROKER
GO
ALTER DATABASE [ResharperBlogDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [ResharperBlogDB] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [ResharperBlogDB] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [ResharperBlogDB] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [ResharperBlogDB] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [ResharperBlogDB] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [ResharperBlogDB] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [ResharperBlogDB] SET  READ_WRITE
GO
ALTER DATABASE [ResharperBlogDB] SET RECOVERY SIMPLE
GO
ALTER DATABASE [ResharperBlogDB] SET  MULTI_USER
GO
ALTER DATABASE [ResharperBlogDB] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [ResharperBlogDB] SET DB_CHAINING OFF
GO
USE [ResharperBlogDB]
GO
/****** Object:  Table [dbo].[UserTable]    Script Date: 06/13/2015 18:30:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserTable](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[UserPic] [varchar](500) NULL,
 CONSTRAINT [PK_UserTable] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[UserTable] ON
INSERT [dbo].[UserTable] ([Id], [Username], [Password], [Name], [Email], [UserPic]) VALUES (4, N'Adnan', N'adi', N'Adnan Amin', N'adnancse23@gmail.com', N'Adnan Amin.jpg')
INSERT [dbo].[UserTable] ([Id], [Username], [Password], [Name], [Email], [UserPic]) VALUES (5, N'Motiul', N'123', N'Motiur Rahman', N'motiur@yahoo.com', N'Tulips.jpg')
SET IDENTITY_INSERT [dbo].[UserTable] OFF
/****** Object:  Table [dbo].[CategoryTable]    Script Date: 06/13/2015 18:30:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CategoryTable](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](250) NOT NULL,
 CONSTRAINT [PK_CategoryTable] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[CategoryTable] ON
INSERT [dbo].[CategoryTable] ([Id], [Name]) VALUES (1, N'Arts')
INSERT [dbo].[CategoryTable] ([Id], [Name]) VALUES (2, N'Science')
INSERT [dbo].[CategoryTable] ([Id], [Name]) VALUES (3, N'History')
INSERT [dbo].[CategoryTable] ([Id], [Name]) VALUES (4, N'Sports')
SET IDENTITY_INSERT [dbo].[CategoryTable] OFF
/****** Object:  Table [dbo].[ArticleTable]    Script Date: 06/13/2015 18:30:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArticleTable](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](250) NOT NULL,
	[Content] [varchar](max) NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[UserId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Status] [bit] NOT NULL,
	[HitCounter] [int] NOT NULL,
 CONSTRAINT [PK_ArticleTable] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ArticleTable] ON
INSERT [dbo].[ArticleTable] ([Id], [Title], [Content], [DateTime], [UserId], [CategoryId], [Status], [HitCounter]) VALUES (3, N'Money of power', N'<p>Draw your reader’s attention to the points you are making, not to yourself and all the misery and sweat of your process of research and writing. Keep the focus on what you have to say, not on the question of how you hope to develop and say it. Do not parade around in your mental underwear. Show only the well-pressed and well-shined final product.</p>', CAST(0x0000A4B500FDC08C AS DateTime), 4, 3, 0, 0)
INSERT [dbo].[ArticleTable] ([Id], [Title], [Content], [DateTime], [UserId], [CategoryId], [Status], [HitCounter]) VALUES (4, N'The Birds Life', N'<p>An international team of scientists has completed the largest whole genome study of a single class of animals to date. To map the tree of life for birds, the team sequenced, assembled and compared full genomes of 48 bird species representing all major branches of modern birds including ostrich, hummingbird, crow, duck, falcon, parrot, crane, ibis, woodpecker and eagle species. </p>', CAST(0x0000A4B501002B4C AS DateTime), 5, 3, 0, 0)
INSERT [dbo].[ArticleTable] ([Id], [Title], [Content], [DateTime], [UserId], [CategoryId], [Status], [HitCounter]) VALUES (5, N'The English Grammer', N'<p>jhds a asds uds ksd shfsd shds ufmsd fisdsafsdfa</p>', CAST(0x0000A4B501018050 AS DateTime), 4, 2, 0, 0)
INSERT [dbo].[ArticleTable] ([Id], [Title], [Content], [DateTime], [UserId], [CategoryId], [Status], [HitCounter]) VALUES (9, N'Aaaaaaaaaaaaa', N'<p><img class="fr-fin fr-dib" alt="Image title" src="http://i.froala.com/download/3544095b71c5c60758df622db28c067fe8c3961d.jpg?1434192424" width="300">sdfsfsd sdf sd fsd sd sdds</p><p>sdf d df sd fsd</p><p>dsfs sfsf&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sdfsdfsfsdf sf sd fdsf sdf sdf sd&nbsp;<img class="fr-fin fr-dib" alt="Image title" src="http://i.froala.com/download/c7af05e875b2855d57e61c67da131fa88dc535d4.jpg?1434192450" width="300">dfgdfg fg dg dfg df gdf</p><p>dgdgdfdgdfg dg df dfg dgreter ertert ert eytey rttyu tyuyiuyi yi&nbsp;</p><p><br></p>', CAST(0x0000A4B60114CA98 AS DateTime), 4, 1, 0, 0)
SET IDENTITY_INSERT [dbo].[ArticleTable] OFF
/****** Object:  Table [dbo].[CommentTable]    Script Date: 06/13/2015 18:30:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CommentTable](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Content] [varchar](max) NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[ArticleId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_CommentTable] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  ForeignKey [FK_UserTable_UserTable]    Script Date: 06/13/2015 18:30:10 ******/
ALTER TABLE [dbo].[UserTable]  WITH CHECK ADD  CONSTRAINT [FK_UserTable_UserTable] FOREIGN KEY([Id])
REFERENCES [dbo].[UserTable] ([Id])
GO
ALTER TABLE [dbo].[UserTable] CHECK CONSTRAINT [FK_UserTable_UserTable]
GO
/****** Object:  ForeignKey [FK_ArticleTable_CategoryTable]    Script Date: 06/13/2015 18:30:10 ******/
ALTER TABLE [dbo].[ArticleTable]  WITH CHECK ADD  CONSTRAINT [FK_ArticleTable_CategoryTable] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[CategoryTable] ([Id])
GO
ALTER TABLE [dbo].[ArticleTable] CHECK CONSTRAINT [FK_ArticleTable_CategoryTable]
GO
/****** Object:  ForeignKey [FK_ArticleTable_UserTable]    Script Date: 06/13/2015 18:30:10 ******/
ALTER TABLE [dbo].[ArticleTable]  WITH CHECK ADD  CONSTRAINT [FK_ArticleTable_UserTable] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserTable] ([Id])
GO
ALTER TABLE [dbo].[ArticleTable] CHECK CONSTRAINT [FK_ArticleTable_UserTable]
GO
/****** Object:  ForeignKey [FK_CommentTable_ArticleTable]    Script Date: 06/13/2015 18:30:10 ******/
ALTER TABLE [dbo].[CommentTable]  WITH CHECK ADD  CONSTRAINT [FK_CommentTable_ArticleTable] FOREIGN KEY([ArticleId])
REFERENCES [dbo].[ArticleTable] ([Id])
GO
ALTER TABLE [dbo].[CommentTable] CHECK CONSTRAINT [FK_CommentTable_ArticleTable]
GO
