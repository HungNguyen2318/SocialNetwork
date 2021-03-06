USE [master]
GO
/****** Object:  Database [MiniWorld]    Script Date: 29/9/2020 2:21:06 PM ******/
CREATE DATABASE [MiniWorld]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MiniWorld', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\MiniWorld.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MiniWorld_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\MiniWorld_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MiniWorld] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MiniWorld].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MiniWorld] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MiniWorld] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MiniWorld] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MiniWorld] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MiniWorld] SET ARITHABORT OFF 
GO
ALTER DATABASE [MiniWorld] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [MiniWorld] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MiniWorld] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MiniWorld] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MiniWorld] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MiniWorld] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MiniWorld] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MiniWorld] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MiniWorld] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MiniWorld] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MiniWorld] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MiniWorld] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MiniWorld] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MiniWorld] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MiniWorld] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MiniWorld] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MiniWorld] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MiniWorld] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MiniWorld] SET  MULTI_USER 
GO
ALTER DATABASE [MiniWorld] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MiniWorld] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MiniWorld] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MiniWorld] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [MiniWorld] SET DELAYED_DURABILITY = DISABLED 
GO
USE [MiniWorld]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 29/9/2020 2:21:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[Email] [nvarchar](50) NOT NULL,
	[Password] [varchar](max) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[LinkImage] [varchar](255) NULL,
	[Birthday] [date] NOT NULL,
	[Gender] [varchar](10) NULL,
	[StateID] [int] NOT NULL,
	[CreatedDay] [datetime] NOT NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Article]    Script Date: 29/9/2020 2:21:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Article](
	[ArticleID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Tittle] [nvarchar](250) NOT NULL,
	[ContentArticle] [nvarchar](max) NOT NULL,
	[LinkImageArticle] [nvarchar](255) NULL,
	[IsDelete] [nvarchar](10) NOT NULL,
	[CreatedDay] [datetime] NOT NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[ArticleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Comment]    Script Date: 29/9/2020 2:21:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[CommentID] [int] IDENTITY(1,1) NOT NULL,
	[ArticleID] [int] NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[CreatedDay] [datetime] NOT NULL DEFAULT (getdate()),
	[IsDelete] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Emotion]    Script Date: 29/9/2020 2:21:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Emotion](
	[EmotionsID] [int] IDENTITY(1,1) NOT NULL,
	[ArticleID] [int] NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[TypeID] [int] NOT NULL,
	[CreatedDay] [datetime] NOT NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[EmotionsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EmotionDetail]    Script Date: 29/9/2020 2:21:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmotionDetail](
	[TypeID] [int] NOT NULL,
	[TypeName] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Notification]    Script Date: 29/9/2020 2:21:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification](
	[NotificationID] [int] IDENTITY(1,1) NOT NULL,
	[ArticleID] [int] NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[ContentNotification] [nvarchar](max) NOT NULL,
	[CreatedDay] [datetime] NOT NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[NotificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[State]    Script Date: 29/9/2020 2:21:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[State](
	[StateID] [int] NOT NULL,
	[StateName] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Account] ([Email], [Password], [Username], [LinkImage], [Birthday], [Gender], [StateID], [CreatedDay]) VALUES (N'admin@gmail.com', N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', N'admin', N'https://i.imgur.com/15redh7.jpg', CAST(N'1999-03-18' AS Date), N'Male', 2, CAST(N'2020-09-25 02:38:53.450' AS DateTime))
INSERT [dbo].[Account] ([Email], [Password], [Username], [LinkImage], [Birthday], [Gender], [StateID], [CreatedDay]) VALUES (N'banhthitheo@gmail.com', N'52f1476494897c64f417deb7ef7cd690f1cea9edce638746c420f1240d3d39dc', N'anhtuan', N'', CAST(N'1997-10-18' AS Date), N'Male', 2, CAST(N'2020-09-29 08:06:45.060' AS DateTime))
INSERT [dbo].[Account] ([Email], [Password], [Username], [LinkImage], [Birthday], [Gender], [StateID], [CreatedDay]) VALUES (N'hungnmse130008@fpt.edu.vn', N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', N'hung', N'https://i.imgur.com/i5V6EhP.jpg', CAST(N'1999-03-18' AS Date), N'Male', 2, CAST(N'2020-09-25 23:33:28.423' AS DateTime))
INSERT [dbo].[Account] ([Email], [Password], [Username], [LinkImage], [Birthday], [Gender], [StateID], [CreatedDay]) VALUES (N'lordofdeath613@gmail.com', N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', N'Hung23', N'https://i.imgur.com/6npKttr.jpg', CAST(N'1999-03-18' AS Date), N'Male', 2, CAST(N'2020-09-29 13:36:40.390' AS DateTime))
INSERT [dbo].[Account] ([Email], [Password], [Username], [LinkImage], [Birthday], [Gender], [StateID], [CreatedDay]) VALUES (N'minhhung180399@icloud.com', N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', N'Hung', N'https://i.imgur.com/lt1KtVA.jpg', CAST(N'1999-03-18' AS Date), N'Male', 2, CAST(N'2020-09-27 16:42:58.013' AS DateTime))
INSERT [dbo].[Account] ([Email], [Password], [Username], [LinkImage], [Birthday], [Gender], [StateID], [CreatedDay]) VALUES (N'nguyenminhhung402@gmail.com', N'6b86b273ff34fce19d6b804eff5a3f5747ada4eaa22f1d49c01e52ddb7875b4b', N'Hung', N'https://i.imgur.com/2kBuTUM.jpg', CAST(N'1999-03-18' AS Date), N'Male', 2, CAST(N'2020-09-24 23:46:05.160' AS DateTime))
SET IDENTITY_INSERT [dbo].[Article] ON 

INSERT [dbo].[Article] ([ArticleID], [Email], [Tittle], [ContentArticle], [LinkImageArticle], [IsDelete], [CreatedDay]) VALUES (1, N'nguyenminhhung402@gmail.com', N'hihihihihih tittle', N'test...', N'https://i.imgur.com/Oqw4C2X.jpg', N'Delete', CAST(N'2020-09-24 23:51:49.650' AS DateTime))
INSERT [dbo].[Article] ([ArticleID], [Email], [Tittle], [ContentArticle], [LinkImageArticle], [IsDelete], [CreatedDay]) VALUES (2, N'nguyenminhhung402@gmail.com', N'hihihihihih tittle', N'test...', N'https://i.imgur.com/Oqw4C2X.jpg', N'Active', CAST(N'2020-09-24 23:51:50.120' AS DateTime))
INSERT [dbo].[Article] ([ArticleID], [Email], [Tittle], [ContentArticle], [LinkImageArticle], [IsDelete], [CreatedDay]) VALUES (3, N'nguyenminhhung402@gmail.com', N'hihihihihih tittle', N'test...', N'https://i.imgur.com/Oqw4C2X.jpg', N'Active', CAST(N'2020-09-24 23:51:50.440' AS DateTime))
INSERT [dbo].[Article] ([ArticleID], [Email], [Tittle], [ContentArticle], [LinkImageArticle], [IsDelete], [CreatedDay]) VALUES (4, N'nguyenminhhung402@gmail.com', N'hihihihihih tittle', N'test...', N'https://i.imgur.com/Oqw4C2X.jpg', N'Active', CAST(N'2020-09-24 23:51:50.643' AS DateTime))
INSERT [dbo].[Article] ([ArticleID], [Email], [Tittle], [ContentArticle], [LinkImageArticle], [IsDelete], [CreatedDay]) VALUES (5, N'nguyenminhhung402@gmail.com', N'hihihihihih tittle', N'test...', N'https://i.imgur.com/Oqw4C2X.jpg', N'Active', CAST(N'2020-09-24 23:51:51.017' AS DateTime))
INSERT [dbo].[Article] ([ArticleID], [Email], [Tittle], [ContentArticle], [LinkImageArticle], [IsDelete], [CreatedDay]) VALUES (6, N'nguyenminhhung402@gmail.com', N'hihihihihih tittle', N'test...', N'https://i.imgur.com/Oqw4C2X.jpg', N'Active', CAST(N'2020-09-24 23:51:51.393' AS DateTime))
INSERT [dbo].[Article] ([ArticleID], [Email], [Tittle], [ContentArticle], [LinkImageArticle], [IsDelete], [CreatedDay]) VALUES (7, N'nguyenminhhung402@gmail.com', N'hihihihihih tittle', N'test...', N'https://i.imgur.com/Oqw4C2X.jpg', N'Active', CAST(N'2020-09-24 23:51:51.770' AS DateTime))
INSERT [dbo].[Article] ([ArticleID], [Email], [Tittle], [ContentArticle], [LinkImageArticle], [IsDelete], [CreatedDay]) VALUES (8, N'nguyenminhhung402@gmail.com', N'hihihihihih tittle', N'test...', N'https://i.imgur.com/Oqw4C2X.jpg', N'Active', CAST(N'2020-09-24 23:51:52.223' AS DateTime))
INSERT [dbo].[Article] ([ArticleID], [Email], [Tittle], [ContentArticle], [LinkImageArticle], [IsDelete], [CreatedDay]) VALUES (9, N'nguyenminhhung402@gmail.com', N'hihihihihih tittle', N'test...', N'https://i.imgur.com/Oqw4C2X.jpg', N'Active', CAST(N'2020-09-24 23:51:52.637' AS DateTime))
INSERT [dbo].[Article] ([ArticleID], [Email], [Tittle], [ContentArticle], [LinkImageArticle], [IsDelete], [CreatedDay]) VALUES (10, N'nguyenminhhung402@gmail.com', N'hihihihihih tittle', N'test...', N'https://i.imgur.com/Oqw4C2X.jpg', N'Active', CAST(N'2020-09-24 23:51:53.050' AS DateTime))
INSERT [dbo].[Article] ([ArticleID], [Email], [Tittle], [ContentArticle], [LinkImageArticle], [IsDelete], [CreatedDay]) VALUES (11, N'nguyenminhhung402@gmail.com', N'hihihihihih tittle', N'test...', N'https://i.imgur.com/Oqw4C2X.jpg', N'Active', CAST(N'2020-09-24 23:51:53.420' AS DateTime))
INSERT [dbo].[Article] ([ArticleID], [Email], [Tittle], [ContentArticle], [LinkImageArticle], [IsDelete], [CreatedDay]) VALUES (12, N'nguyenminhhung402@gmail.com', N'hihihihihih tittle', N'test...', N'https://i.imgur.com/Oqw4C2X.jpg', N'Active', CAST(N'2020-09-24 23:51:53.823' AS DateTime))
INSERT [dbo].[Article] ([ArticleID], [Email], [Tittle], [ContentArticle], [LinkImageArticle], [IsDelete], [CreatedDay]) VALUES (13, N'nguyenminhhung402@gmail.com', N'hihihihihih tittle', N'test...', N'https://i.imgur.com/Oqw4C2X.jpg', N'Active', CAST(N'2020-09-24 23:51:54.213' AS DateTime))
INSERT [dbo].[Article] ([ArticleID], [Email], [Tittle], [ContentArticle], [LinkImageArticle], [IsDelete], [CreatedDay]) VALUES (14, N'nguyenminhhung402@gmail.com', N'test tittle', N'test...', N'https://i.imgur.com/Oqw4C2X.jpg', N'Active', CAST(N'2020-09-24 23:52:06.033' AS DateTime))
INSERT [dbo].[Article] ([ArticleID], [Email], [Tittle], [ContentArticle], [LinkImageArticle], [IsDelete], [CreatedDay]) VALUES (15, N'nguyenminhhung402@gmail.com', N'test tittle', N'test...', N'https://i.imgur.com/Oqw4C2X.jpg', N'Active', CAST(N'2020-09-24 23:52:06.283' AS DateTime))
INSERT [dbo].[Article] ([ArticleID], [Email], [Tittle], [ContentArticle], [LinkImageArticle], [IsDelete], [CreatedDay]) VALUES (16, N'nguyenminhhung402@gmail.com', N'test tittle', N'test...', N'https://i.imgur.com/Oqw4C2X.jpg', N'Active', CAST(N'2020-09-24 23:52:06.493' AS DateTime))
INSERT [dbo].[Article] ([ArticleID], [Email], [Tittle], [ContentArticle], [LinkImageArticle], [IsDelete], [CreatedDay]) VALUES (17, N'nguyenminhhung402@gmail.com', N'test tittle', N'test...', N'https://i.imgur.com/Oqw4C2X.jpg', N'Active', CAST(N'2020-09-24 23:52:06.880' AS DateTime))
INSERT [dbo].[Article] ([ArticleID], [Email], [Tittle], [ContentArticle], [LinkImageArticle], [IsDelete], [CreatedDay]) VALUES (18, N'nguyenminhhung402@gmail.com', N'test tittle', N'test...', N'https://i.imgur.com/Oqw4C2X.jpg', N'Active', CAST(N'2020-09-24 23:52:07.270' AS DateTime))
INSERT [dbo].[Article] ([ArticleID], [Email], [Tittle], [ContentArticle], [LinkImageArticle], [IsDelete], [CreatedDay]) VALUES (19, N'nguyenminhhung402@gmail.com', N'test tittle', N'test...', N'https://i.imgur.com/Oqw4C2X.jpg', N'Active', CAST(N'2020-09-24 23:52:07.647' AS DateTime))
INSERT [dbo].[Article] ([ArticleID], [Email], [Tittle], [ContentArticle], [LinkImageArticle], [IsDelete], [CreatedDay]) VALUES (20, N'nguyenminhhung402@gmail.com', N'test tittle', N'test...', N'https://i.imgur.com/Oqw4C2X.jpg', N'Active', CAST(N'2020-09-24 23:52:08.037' AS DateTime))
INSERT [dbo].[Article] ([ArticleID], [Email], [Tittle], [ContentArticle], [LinkImageArticle], [IsDelete], [CreatedDay]) VALUES (21, N'nguyenminhhung402@gmail.com', N'test tittle', N'test...', N'https://i.imgur.com/Oqw4C2X.jpg', N'Active', CAST(N'2020-09-24 23:52:08.420' AS DateTime))
INSERT [dbo].[Article] ([ArticleID], [Email], [Tittle], [ContentArticle], [LinkImageArticle], [IsDelete], [CreatedDay]) VALUES (22, N'nguyenminhhung402@gmail.com', N'test tittle', N'test...', N'https://i.imgur.com/Oqw4C2X.jpg', N'Active', CAST(N'2020-09-24 23:52:08.803' AS DateTime))
INSERT [dbo].[Article] ([ArticleID], [Email], [Tittle], [ContentArticle], [LinkImageArticle], [IsDelete], [CreatedDay]) VALUES (23, N'nguyenminhhung402@gmail.com', N'test tittle', N'test...', N'https://i.imgur.com/Oqw4C2X.jpg', N'Active', CAST(N'2020-09-24 23:52:09.187' AS DateTime))
INSERT [dbo].[Article] ([ArticleID], [Email], [Tittle], [ContentArticle], [LinkImageArticle], [IsDelete], [CreatedDay]) VALUES (24, N'nguyenminhhung402@gmail.com', N'test tittle', N'test...', N'https://i.imgur.com/Oqw4C2X.jpg', N'Active', CAST(N'2020-09-24 23:52:09.560' AS DateTime))
INSERT [dbo].[Article] ([ArticleID], [Email], [Tittle], [ContentArticle], [LinkImageArticle], [IsDelete], [CreatedDay]) VALUES (25, N'nguyenminhhung402@gmail.com', N'test tittle', N'test...', N'https://i.imgur.com/Oqw4C2X.jpg', N'Active', CAST(N'2020-09-24 23:52:09.957' AS DateTime))
INSERT [dbo].[Article] ([ArticleID], [Email], [Tittle], [ContentArticle], [LinkImageArticle], [IsDelete], [CreatedDay]) VALUES (26, N'nguyenminhhung402@gmail.com', N'test tittle', N'test...', N'https://i.imgur.com/Oqw4C2X.jpg', N'Active', CAST(N'2020-09-24 23:52:10.350' AS DateTime))
INSERT [dbo].[Article] ([ArticleID], [Email], [Tittle], [ContentArticle], [LinkImageArticle], [IsDelete], [CreatedDay]) VALUES (27, N'nguyenminhhung402@gmail.com', N'test tittle', N'test...', N'https://i.imgur.com/Oqw4C2X.jpg', N'Delete', CAST(N'2020-09-24 23:52:10.747' AS DateTime))
INSERT [dbo].[Article] ([ArticleID], [Email], [Tittle], [ContentArticle], [LinkImageArticle], [IsDelete], [CreatedDay]) VALUES (28, N'nguyenminhhung402@gmail.com', N'test tittle', N'test...', N'https://i.imgur.com/Oqw4C2X.jpg', N'Delete', CAST(N'2020-09-24 23:52:11.130' AS DateTime))
INSERT [dbo].[Article] ([ArticleID], [Email], [Tittle], [ContentArticle], [LinkImageArticle], [IsDelete], [CreatedDay]) VALUES (29, N'nguyenminhhung402@gmail.com', N'heloo', N'pageing                    ', N'https://i.imgur.com/HfEtxBc.jpg', N'0', CAST(N'2020-09-25 02:21:55.367' AS DateTime))
INSERT [dbo].[Article] ([ArticleID], [Email], [Tittle], [ContentArticle], [LinkImageArticle], [IsDelete], [CreatedDay]) VALUES (30, N'nguyenminhhung402@gmail.com', N'heloo', N'Test thu xem post dc ko ', N'https://i.imgur.com/1L4m6Kc.jpg', N'Delete', CAST(N'2020-09-25 02:37:48.410' AS DateTime))
INSERT [dbo].[Article] ([ArticleID], [Email], [Tittle], [ContentArticle], [LinkImageArticle], [IsDelete], [CreatedDay]) VALUES (31, N'nguyenminhhung402@gmail.com', N'heloo', N'                    dfdf', N'https://i.imgur.com/ctppnTV.jpg', N'Delete', CAST(N'2020-09-25 03:05:39.397' AS DateTime))
INSERT [dbo].[Article] ([ArticleID], [Email], [Tittle], [ContentArticle], [LinkImageArticle], [IsDelete], [CreatedDay]) VALUES (32, N'nguyenminhhung402@gmail.com', N'Test_01', N'abcabcabcbacbabcabcbacbabcabcbac                    ', N'https://i.imgur.com/j9Zi1i9.jpg', N'Active', CAST(N'2020-09-25 10:56:03.690' AS DateTime))
INSERT [dbo].[Article] ([ArticleID], [Email], [Tittle], [ContentArticle], [LinkImageArticle], [IsDelete], [CreatedDay]) VALUES (33, N'nguyenminhhung402@gmail.com', N'test_xuong hang', N'1
2
3
4
5                    ', N'https://i.imgur.com/U3eynIS.jpg', N'Active', CAST(N'2020-09-25 14:40:06.180' AS DateTime))
INSERT [dbo].[Article] ([ArticleID], [Email], [Tittle], [ContentArticle], [LinkImageArticle], [IsDelete], [CreatedDay]) VALUES (34, N'nguyenminhhung402@gmail.com', N'test_xuong hang 02', N'1
2
3
4
5                    ', N'https://i.imgur.com/jaL8gTU.jpg', N'Active', CAST(N'2020-09-25 14:41:41.763' AS DateTime))
INSERT [dbo].[Article] ([ArticleID], [Email], [Tittle], [ContentArticle], [LinkImageArticle], [IsDelete], [CreatedDay]) VALUES (35, N'nguyenminhhung402@gmail.com', N'test_xuong hang 03', N'1
2
3
4
5      ', N'https://i.imgur.com/NyppPxQ.jpg', N'Active', CAST(N'2020-09-25 14:45:56.440' AS DateTime))
INSERT [dbo].[Article] ([ArticleID], [Email], [Tittle], [ContentArticle], [LinkImageArticle], [IsDelete], [CreatedDay]) VALUES (36, N'nguyenminhhung402@gmail.com', N'test_xuong hang 04', N'1<br>2<br>3<br>4<br>5    ', N'https://i.imgur.com/48rVdmz.jpg', N'Active', CAST(N'2020-09-25 14:48:53.190' AS DateTime))
INSERT [dbo].[Article] ([ArticleID], [Email], [Tittle], [ContentArticle], [LinkImageArticle], [IsDelete], [CreatedDay]) VALUES (37, N'nguyenminhhung402@gmail.com', N'test tittle', N'hello', N'https://i.imgur.com/Oqw4C2X.jpg', N'Active', CAST(N'2020-09-25 16:36:12.103' AS DateTime))
INSERT [dbo].[Article] ([ArticleID], [Email], [Tittle], [ContentArticle], [LinkImageArticle], [IsDelete], [CreatedDay]) VALUES (38, N'nguyenminhhung402@gmail.com', N'test tittle', N'hello', N'https://i.imgur.com/Oqw4C2X.jpg', N'Active', CAST(N'2020-09-25 16:36:12.307' AS DateTime))
INSERT [dbo].[Article] ([ArticleID], [Email], [Tittle], [ContentArticle], [LinkImageArticle], [IsDelete], [CreatedDay]) VALUES (39, N'nguyenminhhung402@gmail.com', N'test tittle', N'hello', N'https://i.imgur.com/Oqw4C2X.jpg', N'Active', CAST(N'2020-09-25 16:36:12.483' AS DateTime))
INSERT [dbo].[Article] ([ArticleID], [Email], [Tittle], [ContentArticle], [LinkImageArticle], [IsDelete], [CreatedDay]) VALUES (40, N'nguyenminhhung402@gmail.com', N'test tittle', N'hello', N'https://i.imgur.com/Oqw4C2X.jpg', N'Active', CAST(N'2020-09-25 16:36:12.660' AS DateTime))
INSERT [dbo].[Article] ([ArticleID], [Email], [Tittle], [ContentArticle], [LinkImageArticle], [IsDelete], [CreatedDay]) VALUES (41, N'nguyenminhhung402@gmail.com', N'test tittle', N'hello', N'https://i.imgur.com/Oqw4C2X.jpg', N'Active', CAST(N'2020-09-25 16:36:12.810' AS DateTime))
INSERT [dbo].[Article] ([ArticleID], [Email], [Tittle], [ContentArticle], [LinkImageArticle], [IsDelete], [CreatedDay]) VALUES (42, N'nguyenminhhung402@gmail.com', N'test tittle', N'hello', N'https://i.imgur.com/Oqw4C2X.jpg', N'Active', CAST(N'2020-09-25 16:36:13.320' AS DateTime))
INSERT [dbo].[Article] ([ArticleID], [Email], [Tittle], [ContentArticle], [LinkImageArticle], [IsDelete], [CreatedDay]) VALUES (43, N'nguyenminhhung402@gmail.com', N'test tittle', N'hello', N'https://i.imgur.com/Oqw4C2X.jpg', N'Active', CAST(N'2020-09-25 16:36:13.427' AS DateTime))
INSERT [dbo].[Article] ([ArticleID], [Email], [Tittle], [ContentArticle], [LinkImageArticle], [IsDelete], [CreatedDay]) VALUES (44, N'nguyenminhhung402@gmail.com', N'test tittle', N'hello', N'https://i.imgur.com/Oqw4C2X.jpg', N'Active', CAST(N'2020-09-25 16:36:13.520' AS DateTime))
INSERT [dbo].[Article] ([ArticleID], [Email], [Tittle], [ContentArticle], [LinkImageArticle], [IsDelete], [CreatedDay]) VALUES (45, N'nguyenminhhung402@gmail.com', N'test tittle', N'hello', N'https://i.imgur.com/Oqw4C2X.jpg', N'Active', CAST(N'2020-09-25 16:36:13.617' AS DateTime))
INSERT [dbo].[Article] ([ArticleID], [Email], [Tittle], [ContentArticle], [LinkImageArticle], [IsDelete], [CreatedDay]) VALUES (46, N'nguyenminhhung402@gmail.com', N'test tittle', N'hello', N'https://i.imgur.com/Oqw4C2X.jpg', N'Active', CAST(N'2020-09-25 16:36:13.717' AS DateTime))
INSERT [dbo].[Article] ([ArticleID], [Email], [Tittle], [ContentArticle], [LinkImageArticle], [IsDelete], [CreatedDay]) VALUES (47, N'nguyenminhhung402@gmail.com', N'test tittle', N'hello', N'https://i.imgur.com/Oqw4C2X.jpg', N'Delete', CAST(N'2020-09-25 16:36:13.810' AS DateTime))
INSERT [dbo].[Article] ([ArticleID], [Email], [Tittle], [ContentArticle], [LinkImageArticle], [IsDelete], [CreatedDay]) VALUES (48, N'nguyenminhhung402@gmail.com', N'test tittle', N'hello', N'https://i.imgur.com/Oqw4C2X.jpg', N'Delete', CAST(N'2020-09-25 16:36:13.903' AS DateTime))
INSERT [dbo].[Article] ([ArticleID], [Email], [Tittle], [ContentArticle], [LinkImageArticle], [IsDelete], [CreatedDay]) VALUES (49, N'nguyenminhhung402@gmail.com', N'test tittle', N'hello', N'https://i.imgur.com/Oqw4C2X.jpg', N'Delete', CAST(N'2020-09-25 16:36:13.993' AS DateTime))
INSERT [dbo].[Article] ([ArticleID], [Email], [Tittle], [ContentArticle], [LinkImageArticle], [IsDelete], [CreatedDay]) VALUES (50, N'nguyenminhhung402@gmail.com', N'test tittle', N'hello', N'https://i.imgur.com/Oqw4C2X.jpg', N'Delete', CAST(N'2020-09-25 16:36:14.090' AS DateTime))
INSERT [dbo].[Article] ([ArticleID], [Email], [Tittle], [ContentArticle], [LinkImageArticle], [IsDelete], [CreatedDay]) VALUES (51, N'nguyenminhhung402@gmail.com', N'test tittle', N'hello', N'https://i.imgur.com/Oqw4C2X.jpg', N'Delete', CAST(N'2020-09-25 16:36:14.200' AS DateTime))
INSERT [dbo].[Article] ([ArticleID], [Email], [Tittle], [ContentArticle], [LinkImageArticle], [IsDelete], [CreatedDay]) VALUES (52, N'nguyenminhhung402@gmail.com', N'test tittle', N'hello', N'https://i.imgur.com/Oqw4C2X.jpg', N'Delete', CAST(N'2020-09-25 16:36:14.300' AS DateTime))
INSERT [dbo].[Article] ([ArticleID], [Email], [Tittle], [ContentArticle], [LinkImageArticle], [IsDelete], [CreatedDay]) VALUES (53, N'nguyenminhhung402@gmail.com', N'test tittle', N'hello', N'https://i.imgur.com/Oqw4C2X.jpg', N'Delete', CAST(N'2020-09-25 16:36:14.390' AS DateTime))
INSERT [dbo].[Article] ([ArticleID], [Email], [Tittle], [ContentArticle], [LinkImageArticle], [IsDelete], [CreatedDay]) VALUES (54, N'nguyenminhhung402@gmail.com', N'test tittle', N'hello', N'https://i.imgur.com/Oqw4C2X.jpg', N'Delete', CAST(N'2020-09-25 16:36:14.483' AS DateTime))
INSERT [dbo].[Article] ([ArticleID], [Email], [Tittle], [ContentArticle], [LinkImageArticle], [IsDelete], [CreatedDay]) VALUES (55, N'nguyenminhhung402@gmail.com', N'test tittle', N'hello', N'https://i.imgur.com/Oqw4C2X.jpg', N'Delete', CAST(N'2020-09-25 16:36:14.580' AS DateTime))
INSERT [dbo].[Article] ([ArticleID], [Email], [Tittle], [ContentArticle], [LinkImageArticle], [IsDelete], [CreatedDay]) VALUES (56, N'nguyenminhhung402@gmail.com', N'test tittle', N'hello', N'https://i.imgur.com/Oqw4C2X.jpg', N'Delete', CAST(N'2020-09-25 16:36:14.680' AS DateTime))
INSERT [dbo].[Article] ([ArticleID], [Email], [Tittle], [ContentArticle], [LinkImageArticle], [IsDelete], [CreatedDay]) VALUES (57, N'nguyenminhhung402@gmail.com', N'test tittle', N'hello', N'https://i.imgur.com/Oqw4C2X.jpg', N'Delete', CAST(N'2020-09-25 16:36:14.773' AS DateTime))
INSERT [dbo].[Article] ([ArticleID], [Email], [Tittle], [ContentArticle], [LinkImageArticle], [IsDelete], [CreatedDay]) VALUES (58, N'nguyenminhhung402@gmail.com', N'test tittle', N'hello', N'https://i.imgur.com/Oqw4C2X.jpg', N'Delete', CAST(N'2020-09-25 16:36:14.873' AS DateTime))
INSERT [dbo].[Article] ([ArticleID], [Email], [Tittle], [ContentArticle], [LinkImageArticle], [IsDelete], [CreatedDay]) VALUES (59, N'nguyenminhhung402@gmail.com', N'test tittle', N'hello', N'https://i.imgur.com/Oqw4C2X.jpg', N'Delete', CAST(N'2020-09-25 16:36:14.987' AS DateTime))
INSERT [dbo].[Article] ([ArticleID], [Email], [Tittle], [ContentArticle], [LinkImageArticle], [IsDelete], [CreatedDay]) VALUES (60, N'nguyenminhhung402@gmail.com', N'test tittle', N'hello', N'https://i.imgur.com/Oqw4C2X.jpg', N'Delete', CAST(N'2020-09-25 16:36:15.080' AS DateTime))
INSERT [dbo].[Article] ([ArticleID], [Email], [Tittle], [ContentArticle], [LinkImageArticle], [IsDelete], [CreatedDay]) VALUES (61, N'nguyenminhhung402@gmail.com', N'test tittle', N'hello', N'https://i.imgur.com/Oqw4C2X.jpg', N'Delete', CAST(N'2020-09-25 16:38:07.690' AS DateTime))
INSERT [dbo].[Article] ([ArticleID], [Email], [Tittle], [ContentArticle], [LinkImageArticle], [IsDelete], [CreatedDay]) VALUES (62, N'nguyenminhhung402@gmail.com', N'test tittle', N'hello', N'https://i.imgur.com/Oqw4C2X.jpg', N'Delete', CAST(N'2020-09-25 16:38:08.123' AS DateTime))
INSERT [dbo].[Article] ([ArticleID], [Email], [Tittle], [ContentArticle], [LinkImageArticle], [IsDelete], [CreatedDay]) VALUES (63, N'nguyenminhhung402@gmail.com', N'test tittle', N'hello', N'https://i.imgur.com/Oqw4C2X.jpg', N'Delete', CAST(N'2020-09-25 16:38:08.440' AS DateTime))
INSERT [dbo].[Article] ([ArticleID], [Email], [Tittle], [ContentArticle], [LinkImageArticle], [IsDelete], [CreatedDay]) VALUES (64, N'hungnmse130008@fpt.edu.vn', N'mail_fpt', N'content                     ', N'https://i.imgur.com/UYmxfuR.jpg', N'Delete', CAST(N'2020-09-25 23:34:39.547' AS DateTime))
INSERT [dbo].[Article] ([ArticleID], [Email], [Tittle], [ContentArticle], [LinkImageArticle], [IsDelete], [CreatedDay]) VALUES (65, N'minhhung180399@icloud.com', N'mail icoud', N'1234<br>5678                    ', N'https://i.imgur.com/i1PyJhv.jpg', N'Delete', CAST(N'2020-09-27 16:51:38.790' AS DateTime))
INSERT [dbo].[Article] ([ArticleID], [Email], [Tittle], [ContentArticle], [LinkImageArticle], [IsDelete], [CreatedDay]) VALUES (66, N'nguyenminhhung402@gmail.com', N'test', N'ghjkl                    ', N'https://i.imgur.com/q1QrT5O.jpg', N'Active', CAST(N'2020-09-27 21:04:04.577' AS DateTime))
SET IDENTITY_INSERT [dbo].[Article] OFF
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([CommentID], [ArticleID], [Email], [Content], [CreatedDay], [IsDelete]) VALUES (1, 3, N'admin@gmail.com', N'test_comment_01', CAST(N'2020-09-25 22:48:48.337' AS DateTime), 1)
INSERT [dbo].[Comment] ([CommentID], [ArticleID], [Email], [Content], [CreatedDay], [IsDelete]) VALUES (2, 3, N'admin@gmail.com', N'test_comment_01', CAST(N'2020-09-25 22:51:27.697' AS DateTime), 1)
INSERT [dbo].[Comment] ([CommentID], [ArticleID], [Email], [Content], [CreatedDay], [IsDelete]) VALUES (3, 63, N'nguyenminhhung402@gmail.com', N'hi', CAST(N'2020-09-25 23:06:30.000' AS DateTime), 1)
INSERT [dbo].[Comment] ([CommentID], [ArticleID], [Email], [Content], [CreatedDay], [IsDelete]) VALUES (4, 63, N'nguyenminhhung402@gmail.com', N'hi', CAST(N'2020-09-25 23:07:23.687' AS DateTime), 1)
INSERT [dbo].[Comment] ([CommentID], [ArticleID], [Email], [Content], [CreatedDay], [IsDelete]) VALUES (5, 63, N'nguyenminhhung402@gmail.com', N'hello con c**', CAST(N'2020-09-25 23:22:03.330' AS DateTime), 1)
INSERT [dbo].[Comment] ([CommentID], [ArticleID], [Email], [Content], [CreatedDay], [IsDelete]) VALUES (6, 63, N'nguyenminhhung402@gmail.com', N'hello con c**', CAST(N'2020-09-25 23:23:22.593' AS DateTime), 1)
INSERT [dbo].[Comment] ([CommentID], [ArticleID], [Email], [Content], [CreatedDay], [IsDelete]) VALUES (7, 63, N'nguyenminhhung402@gmail.com', N'hello', CAST(N'2020-09-25 23:23:31.823' AS DateTime), 0)
INSERT [dbo].[Comment] ([CommentID], [ArticleID], [Email], [Content], [CreatedDay], [IsDelete]) VALUES (8, 63, N'nguyenminhhung402@gmail.com', N'hello', CAST(N'2020-09-25 23:25:35.207' AS DateTime), 0)
INSERT [dbo].[Comment] ([CommentID], [ArticleID], [Email], [Content], [CreatedDay], [IsDelete]) VALUES (9, 63, N'admin@gmail.com', N'hello', CAST(N'2020-09-25 23:30:01.033' AS DateTime), 0)
INSERT [dbo].[Comment] ([CommentID], [ArticleID], [Email], [Content], [CreatedDay], [IsDelete]) VALUES (10, 63, N'nguyenminhhung402@gmail.com', N'hello 1', CAST(N'2020-09-26 00:30:33.907' AS DateTime), 0)
INSERT [dbo].[Comment] ([CommentID], [ArticleID], [Email], [Content], [CreatedDay], [IsDelete]) VALUES (11, 64, N'minhhung180399@icloud.com', N'test comment', CAST(N'2020-09-27 16:51:11.297' AS DateTime), 0)
INSERT [dbo].[Comment] ([CommentID], [ArticleID], [Email], [Content], [CreatedDay], [IsDelete]) VALUES (12, 57, N'admin@gmail.com', N'test comment', CAST(N'2020-09-27 17:04:17.880' AS DateTime), 1)
INSERT [dbo].[Comment] ([CommentID], [ArticleID], [Email], [Content], [CreatedDay], [IsDelete]) VALUES (13, 49, N'nguyenminhhung402@gmail.com', N'test comment', CAST(N'2020-09-27 20:21:55.127' AS DateTime), 0)
INSERT [dbo].[Comment] ([CommentID], [ArticleID], [Email], [Content], [CreatedDay], [IsDelete]) VALUES (14, 66, N'nguyenminhhung402@gmail.com', N'test comment 1', CAST(N'2020-09-27 21:13:12.233' AS DateTime), 1)
INSERT [dbo].[Comment] ([CommentID], [ArticleID], [Email], [Content], [CreatedDay], [IsDelete]) VALUES (15, 47, N'nguyenminhhung402@gmail.com', N'test comment 1', CAST(N'2020-09-27 21:50:47.803' AS DateTime), 1)
INSERT [dbo].[Comment] ([CommentID], [ArticleID], [Email], [Content], [CreatedDay], [IsDelete]) VALUES (16, 66, N'banhthitheo@gmail.com', N'hello', CAST(N'2020-09-29 08:08:13.370' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[Comment] OFF
SET IDENTITY_INSERT [dbo].[Emotion] ON 

INSERT [dbo].[Emotion] ([EmotionsID], [ArticleID], [Email], [TypeID], [CreatedDay]) VALUES (2, 1, N'admin@gmail.com', 1, CAST(N'2020-09-25 16:29:18.200' AS DateTime))
INSERT [dbo].[Emotion] ([EmotionsID], [ArticleID], [Email], [TypeID], [CreatedDay]) VALUES (3, 3, N'admin@gmail.com', 1, CAST(N'2020-09-25 16:30:30.267' AS DateTime))
INSERT [dbo].[Emotion] ([EmotionsID], [ArticleID], [Email], [TypeID], [CreatedDay]) VALUES (4, 63, N'nguyenminhhung402@gmail.com', 1, CAST(N'2020-09-25 16:56:53.597' AS DateTime))
INSERT [dbo].[Emotion] ([EmotionsID], [ArticleID], [Email], [TypeID], [CreatedDay]) VALUES (14, 62, N'nguyenminhhung402@gmail.com', 3, CAST(N'2020-09-25 18:49:26.767' AS DateTime))
INSERT [dbo].[Emotion] ([EmotionsID], [ArticleID], [Email], [TypeID], [CreatedDay]) VALUES (15, 63, N'admin@gmail.com', 1, CAST(N'2020-09-25 19:17:51.310' AS DateTime))
INSERT [dbo].[Emotion] ([EmotionsID], [ArticleID], [Email], [TypeID], [CreatedDay]) VALUES (16, 64, N'admin@gmail.com', 1, CAST(N'2020-09-25 23:34:54.470' AS DateTime))
INSERT [dbo].[Emotion] ([EmotionsID], [ArticleID], [Email], [TypeID], [CreatedDay]) VALUES (17, 64, N'nguyenminhhung402@gmail.com', 2, CAST(N'2020-09-26 00:41:12.480' AS DateTime))
INSERT [dbo].[Emotion] ([EmotionsID], [ArticleID], [Email], [TypeID], [CreatedDay]) VALUES (18, 64, N'minhhung180399@icloud.com', 1, CAST(N'2020-09-27 16:51:05.287' AS DateTime))
INSERT [dbo].[Emotion] ([EmotionsID], [ArticleID], [Email], [TypeID], [CreatedDay]) VALUES (19, 57, N'admin@gmail.com', 2, CAST(N'2020-09-27 17:04:13.920' AS DateTime))
INSERT [dbo].[Emotion] ([EmotionsID], [ArticleID], [Email], [TypeID], [CreatedDay]) VALUES (20, 50, N'nguyenminhhung402@gmail.com', 2, CAST(N'2020-09-27 20:20:38.147' AS DateTime))
INSERT [dbo].[Emotion] ([EmotionsID], [ArticleID], [Email], [TypeID], [CreatedDay]) VALUES (21, 66, N'nguyenminhhung402@gmail.com', 1, CAST(N'2020-09-27 21:17:52.547' AS DateTime))
INSERT [dbo].[Emotion] ([EmotionsID], [ArticleID], [Email], [TypeID], [CreatedDay]) VALUES (24, 66, N'admin@gmail.com', 1, CAST(N'2020-09-28 23:47:22.477' AS DateTime))
INSERT [dbo].[Emotion] ([EmotionsID], [ArticleID], [Email], [TypeID], [CreatedDay]) VALUES (25, 66, N'banhthitheo@gmail.com', 2, CAST(N'2020-09-29 08:07:59.747' AS DateTime))
SET IDENTITY_INSERT [dbo].[Emotion] OFF
INSERT [dbo].[EmotionDetail] ([TypeID], [TypeName]) VALUES (1, N'Like')
INSERT [dbo].[EmotionDetail] ([TypeID], [TypeName]) VALUES (2, N'Dislike')
INSERT [dbo].[EmotionDetail] ([TypeID], [TypeName]) VALUES (3, N'None')
SET IDENTITY_INSERT [dbo].[Notification] ON 

INSERT [dbo].[Notification] ([NotificationID], [ArticleID], [Email], [ContentNotification], [CreatedDay]) VALUES (1, 3, N'admin@gmail.com', N'test_comment_01', CAST(N'2020-09-26 00:08:59.050' AS DateTime))
INSERT [dbo].[Notification] ([NotificationID], [ArticleID], [Email], [ContentNotification], [CreatedDay]) VALUES (2, 2, N'admin@gmail.com', N'test_comment_01', CAST(N'2020-09-26 00:16:32.950' AS DateTime))
INSERT [dbo].[Notification] ([NotificationID], [ArticleID], [Email], [ContentNotification], [CreatedDay]) VALUES (3, 2, N'admin@gmail.com', N'test_comment_01', CAST(N'2020-09-26 00:16:40.823' AS DateTime))
INSERT [dbo].[Notification] ([NotificationID], [ArticleID], [Email], [ContentNotification], [CreatedDay]) VALUES (4, 2, N'admin@gmail.com', N'test_comment_01', CAST(N'2020-09-26 00:16:41.127' AS DateTime))
INSERT [dbo].[Notification] ([NotificationID], [ArticleID], [Email], [ContentNotification], [CreatedDay]) VALUES (5, 63, N'nguyenminhhung402@gmail.com', N'nguyenminhhung402@gmail.com <b>commented</b> on your artilce: test tittle', CAST(N'2020-09-26 00:30:33.900' AS DateTime))
INSERT [dbo].[Notification] ([NotificationID], [ArticleID], [Email], [ContentNotification], [CreatedDay]) VALUES (6, 64, N'hungnmse130008@fpt.edu.vn', N'nguyenminhhung402@gmail.com <b>liked</b> on your artilce: mail_fpt', CAST(N'2020-09-26 00:41:12.487' AS DateTime))
INSERT [dbo].[Notification] ([NotificationID], [ArticleID], [Email], [ContentNotification], [CreatedDay]) VALUES (7, 64, N'hungnmse130008@fpt.edu.vn', N'nguyenminhhung402@gmail.com <b>unliked</b> on your artilce: mail_fpt', CAST(N'2020-09-26 00:41:25.487' AS DateTime))
INSERT [dbo].[Notification] ([NotificationID], [ArticleID], [Email], [ContentNotification], [CreatedDay]) VALUES (8, 64, N'hungnmse130008@fpt.edu.vn', N'nguyenminhhung402@gmail.com <b>disliked</b> on your artilce: mail_fpt', CAST(N'2020-09-26 00:41:31.127' AS DateTime))
INSERT [dbo].[Notification] ([NotificationID], [ArticleID], [Email], [ContentNotification], [CreatedDay]) VALUES (9, 64, N'hungnmse130008@fpt.edu.vn', N'nguyenminhhung402@gmail.com <b>undisliked</b> on your artilce: mail_fpt', CAST(N'2020-09-26 00:41:36.850' AS DateTime))
INSERT [dbo].[Notification] ([NotificationID], [ArticleID], [Email], [ContentNotification], [CreatedDay]) VALUES (10, 64, N'hungnmse130008@fpt.edu.vn', N'nguyenminhhung402@gmail.com <b>liked</b> on your artilce: mail_fpt', CAST(N'2020-09-26 00:41:46.017' AS DateTime))
INSERT [dbo].[Notification] ([NotificationID], [ArticleID], [Email], [ContentNotification], [CreatedDay]) VALUES (11, 64, N'hungnmse130008@fpt.edu.vn', N'nguyenminhhung402@gmail.com <b>disliked</b> on your artilce: mail_fpt', CAST(N'2020-09-26 00:41:51.617' AS DateTime))
INSERT [dbo].[Notification] ([NotificationID], [ArticleID], [Email], [ContentNotification], [CreatedDay]) VALUES (12, 64, N'hungnmse130008@fpt.edu.vn', N'minhhung180399@icloud.com <b>liked</b> on your artilce: mail_fpt', CAST(N'2020-09-27 16:51:05.293' AS DateTime))
INSERT [dbo].[Notification] ([NotificationID], [ArticleID], [Email], [ContentNotification], [CreatedDay]) VALUES (13, 64, N'hungnmse130008@fpt.edu.vn', N'minhhung180399@icloud.com <b>commented</b> on your artilce: mail_fpt', CAST(N'2020-09-27 16:51:11.290' AS DateTime))
INSERT [dbo].[Notification] ([NotificationID], [ArticleID], [Email], [ContentNotification], [CreatedDay]) VALUES (14, 57, N'nguyenminhhung402@gmail.com', N'admin@gmail.com <b>liked</b> on your artilce: test tittle', CAST(N'2020-09-27 17:04:13.930' AS DateTime))
INSERT [dbo].[Notification] ([NotificationID], [ArticleID], [Email], [ContentNotification], [CreatedDay]) VALUES (15, 57, N'nguyenminhhung402@gmail.com', N'admin@gmail.com <b>commented</b> on your artilce: test tittle', CAST(N'2020-09-27 17:04:17.877' AS DateTime))
INSERT [dbo].[Notification] ([NotificationID], [ArticleID], [Email], [ContentNotification], [CreatedDay]) VALUES (16, 57, N'nguyenminhhung402@gmail.com', N'admin@gmail.com <b>disliked</b> on your artilce: test tittle', CAST(N'2020-09-27 17:09:43.100' AS DateTime))
INSERT [dbo].[Notification] ([NotificationID], [ArticleID], [Email], [ContentNotification], [CreatedDay]) VALUES (17, 50, N'nguyenminhhung402@gmail.com', N'nguyenminhhung402@gmail.com <b>liked</b> on your artilce: test tittle', CAST(N'2020-09-27 20:20:38.153' AS DateTime))
INSERT [dbo].[Notification] ([NotificationID], [ArticleID], [Email], [ContentNotification], [CreatedDay]) VALUES (18, 50, N'nguyenminhhung402@gmail.com', N'nguyenminhhung402@gmail.com <b>disliked</b> on your artilce: test tittle', CAST(N'2020-09-27 20:20:42.723' AS DateTime))
INSERT [dbo].[Notification] ([NotificationID], [ArticleID], [Email], [ContentNotification], [CreatedDay]) VALUES (19, 49, N'nguyenminhhung402@gmail.com', N'nguyenminhhung402@gmail.com <b>commented</b> on your artilce: test tittle', CAST(N'2020-09-27 20:21:55.123' AS DateTime))
INSERT [dbo].[Notification] ([NotificationID], [ArticleID], [Email], [ContentNotification], [CreatedDay]) VALUES (20, 66, N'nguyenminhhung402@gmail.com', N'nguyenminhhung402@gmail.com <b>commented</b> on your artilce: test', CAST(N'2020-09-27 21:13:12.230' AS DateTime))
INSERT [dbo].[Notification] ([NotificationID], [ArticleID], [Email], [ContentNotification], [CreatedDay]) VALUES (21, 66, N'nguyenminhhung402@gmail.com', N'nguyenminhhung402@gmail.com <b>liked</b> on your artilce: test', CAST(N'2020-09-27 21:17:52.550' AS DateTime))
INSERT [dbo].[Notification] ([NotificationID], [ArticleID], [Email], [ContentNotification], [CreatedDay]) VALUES (22, 66, N'nguyenminhhung402@gmail.com', N'nguyenminhhung402@gmail.com <b>disliked</b> on your artilce: test', CAST(N'2020-09-27 21:17:54.740' AS DateTime))
INSERT [dbo].[Notification] ([NotificationID], [ArticleID], [Email], [ContentNotification], [CreatedDay]) VALUES (23, 47, N'nguyenminhhung402@gmail.com', N'nguyenminhhung402@gmail.com <b>commented</b> on your artilce: test tittle', CAST(N'2020-09-27 21:50:47.800' AS DateTime))
INSERT [dbo].[Notification] ([NotificationID], [ArticleID], [Email], [ContentNotification], [CreatedDay]) VALUES (24, 45, N'nguyenminhhung402@gmail.com', N'lordofdeath613@gmail.com <b>liked</b> on your artilce: test tittle', CAST(N'2020-09-27 22:06:15.960' AS DateTime))
INSERT [dbo].[Notification] ([NotificationID], [ArticleID], [Email], [ContentNotification], [CreatedDay]) VALUES (25, 66, N'nguyenminhhung402@gmail.com', N'nguyenminhhung402@gmail.com <b>liked</b> on your artilce: test', CAST(N'2020-09-27 22:06:42.097' AS DateTime))
INSERT [dbo].[Notification] ([NotificationID], [ArticleID], [Email], [ContentNotification], [CreatedDay]) VALUES (26, 66, N'nguyenminhhung402@gmail.com', N'lordofdeath613@gmail.com <b>liked</b> on your artilce: test', CAST(N'2020-09-27 22:06:58.997' AS DateTime))
INSERT [dbo].[Notification] ([NotificationID], [ArticleID], [Email], [ContentNotification], [CreatedDay]) VALUES (27, 66, N'nguyenminhhung402@gmail.com', N'lordofdeath613@gmail.com <b>unliked</b> on your artilce: test', CAST(N'2020-09-28 23:44:52.523' AS DateTime))
INSERT [dbo].[Notification] ([NotificationID], [ArticleID], [Email], [ContentNotification], [CreatedDay]) VALUES (28, 66, N'nguyenminhhung402@gmail.com', N'admin@gmail.com <b>liked</b> on your artilce: test', CAST(N'2020-09-28 23:47:22.480' AS DateTime))
INSERT [dbo].[Notification] ([NotificationID], [ArticleID], [Email], [ContentNotification], [CreatedDay]) VALUES (29, 66, N'nguyenminhhung402@gmail.com', N'banhthitheo@gmail.com <b>liked</b> on your artilce: test', CAST(N'2020-09-29 08:07:59.757' AS DateTime))
INSERT [dbo].[Notification] ([NotificationID], [ArticleID], [Email], [ContentNotification], [CreatedDay]) VALUES (30, 66, N'nguyenminhhung402@gmail.com', N'banhthitheo@gmail.com <b>disliked</b> on your artilce: test', CAST(N'2020-09-29 08:08:04.230' AS DateTime))
INSERT [dbo].[Notification] ([NotificationID], [ArticleID], [Email], [ContentNotification], [CreatedDay]) VALUES (31, 66, N'nguyenminhhung402@gmail.com', N'banhthitheo@gmail.com <b>commented</b> on your artilce: test', CAST(N'2020-09-29 08:08:13.363' AS DateTime))
SET IDENTITY_INSERT [dbo].[Notification] OFF
INSERT [dbo].[State] ([StateID], [StateName]) VALUES (1, N'New')
INSERT [dbo].[State] ([StateID], [StateName]) VALUES (2, N'Active')
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_State] FOREIGN KEY([StateID])
REFERENCES [dbo].[State] ([StateID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_State]
GO
ALTER TABLE [dbo].[Article]  WITH CHECK ADD FOREIGN KEY([Email])
REFERENCES [dbo].[Account] ([Email])
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([ArticleID])
REFERENCES [dbo].[Article] ([ArticleID])
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([Email])
REFERENCES [dbo].[Account] ([Email])
GO
ALTER TABLE [dbo].[Emotion]  WITH CHECK ADD FOREIGN KEY([ArticleID])
REFERENCES [dbo].[Article] ([ArticleID])
GO
ALTER TABLE [dbo].[Emotion]  WITH CHECK ADD FOREIGN KEY([Email])
REFERENCES [dbo].[Account] ([Email])
GO
ALTER TABLE [dbo].[Emotion]  WITH CHECK ADD  CONSTRAINT [FK_Emotion_EmotionDetail] FOREIGN KEY([TypeID])
REFERENCES [dbo].[EmotionDetail] ([TypeID])
GO
ALTER TABLE [dbo].[Emotion] CHECK CONSTRAINT [FK_Emotion_EmotionDetail]
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD FOREIGN KEY([ArticleID])
REFERENCES [dbo].[Article] ([ArticleID])
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD FOREIGN KEY([Email])
REFERENCES [dbo].[Account] ([Email])
GO
USE [master]
GO
ALTER DATABASE [MiniWorld] SET  READ_WRITE 
GO
