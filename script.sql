USE [master]
GO
/****** Object:  Database [EnglishCenterDB]    Script Date: 21/05/2016 10:18:33 ******/
CREATE DATABASE [EnglishCenterDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EnglishCenterDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\EnglishCenterDB.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'EnglishCenterDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\EnglishCenterDB_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [EnglishCenterDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EnglishCenterDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EnglishCenterDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EnglishCenterDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EnglishCenterDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EnglishCenterDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EnglishCenterDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [EnglishCenterDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EnglishCenterDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [EnglishCenterDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EnglishCenterDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EnglishCenterDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EnglishCenterDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EnglishCenterDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EnglishCenterDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EnglishCenterDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EnglishCenterDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EnglishCenterDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [EnglishCenterDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EnglishCenterDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EnglishCenterDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EnglishCenterDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EnglishCenterDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EnglishCenterDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EnglishCenterDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EnglishCenterDB] SET RECOVERY FULL 
GO
ALTER DATABASE [EnglishCenterDB] SET  MULTI_USER 
GO
ALTER DATABASE [EnglishCenterDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EnglishCenterDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EnglishCenterDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EnglishCenterDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'EnglishCenterDB', N'ON'
GO
USE [EnglishCenterDB]
GO
/****** Object:  Table [dbo].[answer_tbl]    Script Date: 21/05/2016 10:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[answer_tbl](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[answer_id] [nchar](50) NULL,
	[answer_order] [int] NULL,
	[question_id] [nchar](50) NULL,
	[answer_content] [nvarchar](max) NULL,
	[answer_title] [nvarchar](50) NULL,
	[resource_id] [nchar](50) NULL,
	[examination_order] [int] NULL,
	[is_correct] [bit] NULL,
	[notes] [nvarchar](max) NULL,
	[delete_flag] [bit] NULL,
 CONSTRAINT [PK_answer_tbl] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[examination_part_tbl]    Script Date: 21/05/2016 10:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[examination_part_tbl](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[examination_id] [nchar](50) NULL,
	[examination_order] [int] NULL,
	[part_id] [nchar](50) NULL,
	[part_order] [int] NULL,
	[part_content] [nvarchar](max) NULL,
	[part_title] [nvarchar](max) NULL,
 CONSTRAINT [PK_examination_part_tbl] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[examination_question_tbl]    Script Date: 21/05/2016 10:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[examination_question_tbl](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[examination_id] [nchar](50) NULL,
	[question_id] [nchar](50) NULL,
	[question_code] [nchar](10) NULL,
	[examination_order] [int] NULL,
 CONSTRAINT [PK_examination_question_tbl] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[examination_tbl]    Script Date: 21/05/2016 10:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[examination_tbl](
	[id] [nchar](50) NOT NULL,
	[name] [nvarchar](max) NULL,
	[num_question] [int] NULL,
	[type] [nchar](10) NULL,
	[course] [nvarchar](max) NULL,
	[course_level] [int] NULL,
	[num_part] [int] NULL,
 CONSTRAINT [PK_examination_tbl] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[examination_topic_tbl]    Script Date: 21/05/2016 10:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[examination_topic_tbl](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[topic_id] [nchar](50) NULL,
	[examination_order] [int] NULL,
	[topic_type] [int] NULL,
	[topic_title] [nvarchar](max) NULL,
	[topic_content] [nvarchar](max) NULL,
	[topic_resource_id] [nchar](50) NULL,
	[topic_order] [int] NULL,
	[part_id] [nchar](50) NULL,
	[examination_id] [nchar](10) NULL,
	[delete_flag] [bit] NULL,
 CONSTRAINT [PK_examination_topic_tbl] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[group_tbl]    Script Date: 21/05/2016 10:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[group_tbl](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[group_code] [nchar](10) NULL,
	[group_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_group_tbl] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[guest_tbl]    Script Date: 21/05/2016 10:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[guest_tbl](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[full_name] [nvarchar](500) NOT NULL,
	[email] [nvarchar](200) NULL,
	[phone_number] [nchar](20) NULL,
	[sent_files] [nvarchar](max) NULL,
	[notes] [nvarchar](max) NULL,
 CONSTRAINT [PK_guest_tbl] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[part_tbl]    Script Date: 21/05/2016 10:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[part_tbl](
	[id] [int] NOT NULL,
	[part_id] [nchar](50) NULL,
	[part_title] [nvarchar](max) NULL,
	[part_content] [nvarchar](max) NULL,
	[part_type] [nvarchar](50) NULL,
	[part_resource] [nvarchar](max) NULL,
	[delete_flag] [bit] NULL,
 CONSTRAINT [PK_part_tbl] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[question_tbl]    Script Date: 21/05/2016 10:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[question_tbl](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[examination_order] [int] NULL,
	[examination_id] [nchar](50) NULL,
	[question_id] [nchar](50) NULL,
	[question_name] [nvarchar](50) NULL,
	[question_content] [nvarchar](max) NULL,
	[examination_part_id] [nchar](50) NULL,
	[question_order] [int] NULL,
	[question_type] [nchar](50) NULL,
	[num_correct_answer] [int] NULL,
	[total_num_answer] [int] NULL,
	[resource_id] [nchar](50) NULL,
	[notes] [nvarchar](max) NULL,
	[question_code] [nchar](10) NULL,
 CONSTRAINT [PK_question_tbl] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[resource_link_tbl]    Script Date: 21/05/2016 10:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[resource_link_tbl](
	[id] [int] NOT NULL,
	[resource_id] [nchar](50) NULL,
	[active] [bit] NULL,
	[url] [nvarchar](250) NULL,
	[location_type] [tinyint] NULL,
	[url_host_name] [nvarchar](150) NULL,
	[resource_type] [nchar](10) NULL,
	[delete_flag] [bit] NULL,
 CONSTRAINT [PK_resource_link_tbl] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[resource_tbl]    Script Date: 21/05/2016 10:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[resource_tbl](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[resource_id] [nchar](50) NULL,
	[name] [nvarchar](50) NULL,
	[type] [nchar](10) NULL,
	[location_type] [tinyint] NULL,
	[examination_order] [int] NULL,
	[delete_flag] [bit] NULL,
 CONSTRAINT [PK_resource_tbl] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[role_detail_tbl]    Script Date: 21/05/2016 10:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role_detail_tbl](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[role_code] [int] NULL,
	[function_id] [int] NULL,
	[function_name] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[role_tbl]    Script Date: 21/05/2016 10:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role_tbl](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[role_code] [int] NULL,
	[role_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_role_tbl] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[staff_tbl]    Script Date: 21/05/2016 10:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[staff_tbl](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[staff_code] [nchar](20) NOT NULL,
	[is_admin] [bit] NULL,
	[group_code] [nchar](10) NULL,
	[first_name] [nvarchar](50) NULL,
	[last_name] [nvarchar](50) NULL,
	[fullname] [nvarchar](50) NULL,
	[nick_name] [nvarchar](50) NULL,
	[birthday] [datetime] NULL,
	[gender] [nchar](10) NULL,
	[country_name] [nvarchar](50) NULL,
	[country_code] [nchar](3) NULL,
	[marital_status] [tinyint] NULL,
	[address1] [nvarchar](500) NULL,
	[address2] [nvarchar](500) NULL,
	[tel1] [nchar](20) NULL,
	[tel2] [nchar](20) NULL,
	[email1] [nchar](50) NULL,
	[email2] [nchar](50) NULL,
	[manager_code] [nchar](20) NULL,
	[join_date] [datetime] NULL,
	[avatar_path] [nvarchar](500) NULL,
	[status] [nchar](10) NULL,
	[account_status] [nchar](10) NULL,
	[user_name] [nchar](50) NOT NULL,
	[password] [nchar](20) NULL,
	[update_date] [datetime] NULL,
	[delete_flag] [bit] NULL,
 CONSTRAINT [PK_staff_tbl] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[topic_tbl]    Script Date: 21/05/2016 10:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[topic_tbl](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[topic_id] [nchar](50) NULL,
	[topic_type] [nchar](50) NULL,
	[topic_title] [nvarchar](max) NULL,
	[topic_content] [nvarchar](max) NULL,
	[topic_resource] [nvarchar](max) NULL,
	[delete_flag] [bit] NULL,
 CONSTRAINT [PK_topic_tbl] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[user_answer_question_detail_tbl]    Script Date: 21/05/2016 10:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_answer_question_detail_tbl](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[answer_question_id] [nchar](50) NULL,
	[answer_id] [nchar](50) NULL,
	[answer_content] [nvarchar](max) NULL,
 CONSTRAINT [PK_user_answer_question_detail_tbl] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[user_answer_question_tbl]    Script Date: 21/05/2016 10:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_answer_question_tbl](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_name] [nvarchar](250) NULL,
	[examination_id] [nchar](50) NULL,
	[part_id] [nchar](50) NULL,
	[question_id] [nchar](50) NULL,
	[answer_question_id] [nchar](50) NULL,
 CONSTRAINT [PK_user_answer_question_tbl] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[user_tbl]    Script Date: 21/05/2016 10:18:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_tbl](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_code] [nchar](20) NULL,
	[user_type] [nchar](10) NULL,
	[first_name] [nvarchar](50) NULL,
	[last_name] [nvarchar](50) NULL,
	[full_name] [nvarchar](50) NULL,
	[nick_name] [nvarchar](50) NULL,
	[birthday] [datetime] NULL,
	[gender] [nchar](10) NULL,
	[country_name] [nvarchar](50) NULL,
	[country_code] [nchar](3) NULL,
	[marital_status] [tinyint] NULL,
	[address1] [nvarchar](500) NULL,
	[address2] [nvarchar](500) NULL,
	[tel1] [nchar](20) NULL,
	[tel2] [nchar](20) NULL,
	[email1] [nchar](50) NULL,
	[email2] [nchar](50) NULL,
	[referral_code] [nchar](20) NULL,
	[instructor_code] [nchar](20) NULL,
	[join_date] [datetime] NULL,
	[avatar_path] [nvarchar](500) NULL,
	[status] [nchar](10) NULL,
	[account_status] [nchar](10) NULL,
	[user_name] [nchar](50) NULL,
	[password] [nchar](20) NULL,
	[active] [bit] NULL,
	[role_code] [nchar](10) NULL,
	[create_date] [nchar](50) NULL,
	[update_date] [nchar](50) NULL,
	[delete_flag] [bit] NULL,
 CONSTRAINT [PK_user_tbl_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[examination_part_tbl] ON 

INSERT [dbo].[examination_part_tbl] ([id], [examination_id], [examination_order], [part_id], [part_order], [part_content], [part_title]) VALUES (1, N'exam_001                                          ', 0, N'part_001                                          ', 1, N'Choose the statement that best describes what you see in the picture.', N'Part I: ')
INSERT [dbo].[examination_part_tbl] ([id], [examination_id], [examination_order], [part_id], [part_order], [part_content], [part_title]) VALUES (2, N'exam_001                                          ', 3, N'part_002                                          ', 2, N'Listen to the questions and choose the best answer.', N'Part II: ')
INSERT [dbo].[examination_part_tbl] ([id], [examination_id], [examination_order], [part_id], [part_order], [part_content], [part_title]) VALUES (3, N'exam_001                                          ', 2, N'part_003                                          ', 3, N'Choose the best answer to each question.', N'Part III: ')
INSERT [dbo].[examination_part_tbl] ([id], [examination_id], [examination_order], [part_id], [part_order], [part_content], [part_title]) VALUES (4, N'exam_001                                          ', 5, N'part_004                                          ', 4, N'Short talks
 \n Choose the best answer to each question.
', N'Part IV: ')
INSERT [dbo].[examination_part_tbl] ([id], [examination_id], [examination_order], [part_id], [part_order], [part_content], [part_title]) VALUES (5, N'exam_001                                          ', 8, N'part_005                                          ', 5, N'Incomplete Sentences ', N'Part V: ')
INSERT [dbo].[examination_part_tbl] ([id], [examination_id], [examination_order], [part_id], [part_order], [part_content], [part_title]) VALUES (6, N'exam_001                                          ', 9, N'part_006                                          ', 6, N'Incomplete Texts ', N'Part VI:')
INSERT [dbo].[examination_part_tbl] ([id], [examination_id], [examination_order], [part_id], [part_order], [part_content], [part_title]) VALUES (7, N'exam_001                                          ', 0, N'part_007                                          ', 7, N'Reading Comprehension ', N'Part VII:')
SET IDENTITY_INSERT [dbo].[examination_part_tbl] OFF
SET IDENTITY_INSERT [dbo].[examination_question_tbl] ON 

INSERT [dbo].[examination_question_tbl] ([id], [examination_id], [question_id], [question_code], [examination_order]) VALUES (1, N'exam_001                                          ', N'q_001                                             ', NULL, 1)
INSERT [dbo].[examination_question_tbl] ([id], [examination_id], [question_id], [question_code], [examination_order]) VALUES (2, N'exam_001                                          ', N'q_002                                             ', NULL, 2)
INSERT [dbo].[examination_question_tbl] ([id], [examination_id], [question_id], [question_code], [examination_order]) VALUES (3, N'exam_001                                          ', N'q_003                                             ', NULL, 3)
INSERT [dbo].[examination_question_tbl] ([id], [examination_id], [question_id], [question_code], [examination_order]) VALUES (4, N'exam_001                                          ', N'q_004                                             ', NULL, 4)
INSERT [dbo].[examination_question_tbl] ([id], [examination_id], [question_id], [question_code], [examination_order]) VALUES (5, N'exam_001                                          ', N'q_005                                             ', NULL, 5)
INSERT [dbo].[examination_question_tbl] ([id], [examination_id], [question_id], [question_code], [examination_order]) VALUES (6, N'exam_001                                          ', N'q_006                                             ', NULL, 6)
SET IDENTITY_INSERT [dbo].[examination_question_tbl] OFF
INSERT [dbo].[examination_tbl] ([id], [name], [num_question], [type], [course], [course_level], [num_part]) VALUES (N'exam_001                                          ', N'Test 1', 64, N'1         ', N'1', 1, 7)
SET IDENTITY_INSERT [dbo].[question_tbl] ON 

INSERT [dbo].[question_tbl] ([id], [examination_order], [examination_id], [question_id], [question_name], [question_content], [examination_part_id], [question_order], [question_type], [num_correct_answer], [total_num_answer], [resource_id], [notes], [question_code]) VALUES (1, 1, N'exam_001                                          ', N'q_001                                             ', N'1.', NULL, N'part_001                                          ', NULL, N'1                                                 ', 1, 4, N'rs_001                                            ', NULL, NULL)
INSERT [dbo].[question_tbl] ([id], [examination_order], [examination_id], [question_id], [question_name], [question_content], [examination_part_id], [question_order], [question_type], [num_correct_answer], [total_num_answer], [resource_id], [notes], [question_code]) VALUES (2, 2, N'exam_001                                          ', N'q_002                                             ', N'2.', NULL, N'part_001                                          ', NULL, N'1                                                 ', 1, 4, N'rs_002                                            ', NULL, NULL)
INSERT [dbo].[question_tbl] ([id], [examination_order], [examination_id], [question_id], [question_name], [question_content], [examination_part_id], [question_order], [question_type], [num_correct_answer], [total_num_answer], [resource_id], [notes], [question_code]) VALUES (3, 3, N'exam_001                                          ', N'q_003                                             ', N'3.', NULL, N'part_001                                          ', NULL, N'1                                                 ', 1, 4, N'rs_003                                            ', NULL, NULL)
INSERT [dbo].[question_tbl] ([id], [examination_order], [examination_id], [question_id], [question_name], [question_content], [examination_part_id], [question_order], [question_type], [num_correct_answer], [total_num_answer], [resource_id], [notes], [question_code]) VALUES (4, 4, N'exam_001                                          ', N'q_004                                             ', N'4.', NULL, N'part_001                                          ', NULL, N'1                                                 ', 1, 4, N'rs_004                                            ', NULL, NULL)
INSERT [dbo].[question_tbl] ([id], [examination_order], [examination_id], [question_id], [question_name], [question_content], [examination_part_id], [question_order], [question_type], [num_correct_answer], [total_num_answer], [resource_id], [notes], [question_code]) VALUES (5, 5, N'exam_001                                          ', N'q_005                                             ', N'5.', NULL, N'part_001                                          ', NULL, N'1                                                 ', 1, 4, N'rs_005                                            ', NULL, NULL)
INSERT [dbo].[question_tbl] ([id], [examination_order], [examination_id], [question_id], [question_name], [question_content], [examination_part_id], [question_order], [question_type], [num_correct_answer], [total_num_answer], [resource_id], [notes], [question_code]) VALUES (6, 6, N'exam_001                                          ', N'q_006                                             ', N'6.', NULL, N'part_001                                          ', NULL, N'1                                                 ', 1, 4, N'rs_006                                            ', NULL, NULL)
SET IDENTITY_INSERT [dbo].[question_tbl] OFF
SET IDENTITY_INSERT [dbo].[user_tbl] ON 

INSERT [dbo].[user_tbl] ([id], [user_code], [user_type], [first_name], [last_name], [full_name], [nick_name], [birthday], [gender], [country_name], [country_code], [marital_status], [address1], [address2], [tel1], [tel2], [email1], [email2], [referral_code], [instructor_code], [join_date], [avatar_path], [status], [account_status], [user_name], [password], [active], [role_code], [create_date], [update_date], [delete_flag]) VALUES (2, NULL, NULL, N'nghiep', N'tran', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'tranduynghiep@gmail.com                           ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'tranduynghiep@gmail.com                           ', N'12345               ', NULL, NULL, N'20160515:212850                                   ', N'20160515:212850                                   ', NULL)
INSERT [dbo].[user_tbl] ([id], [user_code], [user_type], [first_name], [last_name], [full_name], [nick_name], [birthday], [gender], [country_name], [country_code], [marital_status], [address1], [address2], [tel1], [tel2], [email1], [email2], [referral_code], [instructor_code], [join_date], [avatar_path], [status], [account_status], [user_name], [password], [active], [role_code], [create_date], [update_date], [delete_flag]) VALUES (4, NULL, NULL, N'nghiep2', N'tran', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'tranduynghiep2@gmail.com                          ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'tranduynghiep2@gmail.com                          ', N'12345               ', NULL, NULL, N'20160515:214805                                   ', N'20160515:214805                                   ', NULL)
INSERT [dbo].[user_tbl] ([id], [user_code], [user_type], [first_name], [last_name], [full_name], [nick_name], [birthday], [gender], [country_name], [country_code], [marital_status], [address1], [address2], [tel1], [tel2], [email1], [email2], [referral_code], [instructor_code], [join_date], [avatar_path], [status], [account_status], [user_name], [password], [active], [role_code], [create_date], [update_date], [delete_flag]) VALUES (5, NULL, NULL, N'33', N'eee', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'tranduynghiep3@gmail.com                          ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'tranduynghiep3@gmail.com                          ', N'12345               ', NULL, NULL, N'20160515:220559                                   ', N'20160515:220559                                   ', NULL)
INSERT [dbo].[user_tbl] ([id], [user_code], [user_type], [first_name], [last_name], [full_name], [nick_name], [birthday], [gender], [country_name], [country_code], [marital_status], [address1], [address2], [tel1], [tel2], [email1], [email2], [referral_code], [instructor_code], [join_date], [avatar_path], [status], [account_status], [user_name], [password], [active], [role_code], [create_date], [update_date], [delete_flag]) VALUES (7, NULL, NULL, N'33', N'erere', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'tranduynghiep4@gmail.com                          ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'tranduynghiep4@gmail.com                          ', N'12345               ', NULL, NULL, N'20160515:221333                                   ', N'20160515:221333                                   ', NULL)
INSERT [dbo].[user_tbl] ([id], [user_code], [user_type], [first_name], [last_name], [full_name], [nick_name], [birthday], [gender], [country_name], [country_code], [marital_status], [address1], [address2], [tel1], [tel2], [email1], [email2], [referral_code], [instructor_code], [join_date], [avatar_path], [status], [account_status], [user_name], [password], [active], [role_code], [create_date], [update_date], [delete_flag]) VALUES (8, NULL, NULL, N'3r3w5', N'erere', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'tranduynghiep5@gmail.com                          ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'tranduynghiep5@gmail.com                          ', N'12345               ', NULL, NULL, N'20160515:221818                                   ', N'20160515:221818                                   ', NULL)
INSERT [dbo].[user_tbl] ([id], [user_code], [user_type], [first_name], [last_name], [full_name], [nick_name], [birthday], [gender], [country_name], [country_code], [marital_status], [address1], [address2], [tel1], [tel2], [email1], [email2], [referral_code], [instructor_code], [join_date], [avatar_path], [status], [account_status], [user_name], [password], [active], [role_code], [create_date], [update_date], [delete_flag]) VALUES (9, NULL, NULL, N'3r3w5', N'eee', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'tranduynghiep6@gmail.com                          ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'tranduynghiep6@gmail.com                          ', N'12345               ', NULL, NULL, N'20160515:233230                                   ', N'20160515:233230                                   ', NULL)
INSERT [dbo].[user_tbl] ([id], [user_code], [user_type], [first_name], [last_name], [full_name], [nick_name], [birthday], [gender], [country_name], [country_code], [marital_status], [address1], [address2], [tel1], [tel2], [email1], [email2], [referral_code], [instructor_code], [join_date], [avatar_path], [status], [account_status], [user_name], [password], [active], [role_code], [create_date], [update_date], [delete_flag]) VALUES (10, NULL, NULL, N'3r3w5', N'erere', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'tranduynghiep7@gmail.com                          ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'tranduynghiep7@gmail.com                          ', N'12345               ', NULL, NULL, N'20160515:233443                                   ', N'20160515:233443                                   ', NULL)
INSERT [dbo].[user_tbl] ([id], [user_code], [user_type], [first_name], [last_name], [full_name], [nick_name], [birthday], [gender], [country_name], [country_code], [marital_status], [address1], [address2], [tel1], [tel2], [email1], [email2], [referral_code], [instructor_code], [join_date], [avatar_path], [status], [account_status], [user_name], [password], [active], [role_code], [create_date], [update_date], [delete_flag]) VALUES (11, NULL, NULL, N'3r3w5', N'erere', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'tranduynghiep8@gmail.com                          ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'tranduynghiep8@gmail.com                          ', N'12345               ', NULL, NULL, N'20160515:233714                                   ', N'20160515:233714                                   ', NULL)
INSERT [dbo].[user_tbl] ([id], [user_code], [user_type], [first_name], [last_name], [full_name], [nick_name], [birthday], [gender], [country_name], [country_code], [marital_status], [address1], [address2], [tel1], [tel2], [email1], [email2], [referral_code], [instructor_code], [join_date], [avatar_path], [status], [account_status], [user_name], [password], [active], [role_code], [create_date], [update_date], [delete_flag]) VALUES (12, NULL, NULL, N'3r3w5', N'erere', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'tranduynghiep9@gmail.com                          ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'tranduynghiep9@gmail.com                          ', N'12345               ', NULL, NULL, N'20160515:233745                                   ', N'20160515:233745                                   ', NULL)
INSERT [dbo].[user_tbl] ([id], [user_code], [user_type], [first_name], [last_name], [full_name], [nick_name], [birthday], [gender], [country_name], [country_code], [marital_status], [address1], [address2], [tel1], [tel2], [email1], [email2], [referral_code], [instructor_code], [join_date], [avatar_path], [status], [account_status], [user_name], [password], [active], [role_code], [create_date], [update_date], [delete_flag]) VALUES (13, NULL, NULL, N'rtrtr', N'NGUYEN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'tranduynghiep10@gmail.com                         ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'tranduynghiep10@gmail.com                         ', N'12345               ', NULL, NULL, N'20160515:234205                                   ', N'20160515:234205                                   ', NULL)
SET IDENTITY_INSERT [dbo].[user_tbl] OFF
USE [master]
GO
ALTER DATABASE [EnglishCenterDB] SET  READ_WRITE 
GO
