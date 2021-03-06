create database EnglishCenterDB
go
USE [EnglishCenterDB]
GO
/****** Object:  Table [dbo].[answer_tbl]    Script Date: 6/26/2016 1:00:38 PM ******/
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
	[is_correct] [bit] NULL,
	[notes] [nvarchar](max) NULL,
	[delete_flag] [bit] NULL,
 CONSTRAINT [PK_answer_tbl] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[examination_part_tbl]    Script Date: 6/26/2016 1:00:38 PM ******/
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
/****** Object:  Table [dbo].[examination_question_tbl]    Script Date: 6/26/2016 1:00:38 PM ******/
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
/****** Object:  Table [dbo].[examination_tbl]    Script Date: 6/26/2016 1:00:38 PM ******/
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
/****** Object:  Table [dbo].[examination_topic_tbl]    Script Date: 6/26/2016 1:00:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[examination_topic_tbl](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[topic_id] [nchar](50) NULL,
	[examination_order] [int] NULL,
	[topic_resource_id] [nchar](50) NULL,
	[part_id] [nchar](50) NULL,
	[examination_id] [nchar](10) NULL,
	[delete_flag] [bit] NULL,
 CONSTRAINT [PK_examination_topic_tbl] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[group_tbl]    Script Date: 6/26/2016 1:00:38 PM ******/
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
/****** Object:  Table [dbo].[guest_tbl]    Script Date: 6/26/2016 1:00:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[guest_tbl](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[full_name] [nvarchar](500) NOT NULL,
	[email] [nvarchar](200) NOT NULL,
	[phone_number] [nchar](20) NULL,
	[notes] [nvarchar](max) NULL,
	[type] [smallint] NULL,
	[examination_id] [int] NULL,
	[correct_answer_num] [smallint] NULL,
 CONSTRAINT [PK_guest_tbl] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[part_tbl]    Script Date: 6/26/2016 1:00:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[part_tbl](
	[id] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object:  Table [dbo].[question_tbl]    Script Date: 6/26/2016 1:00:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[question_tbl](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[examination_id] [nchar](50) NULL,
	[question_id] [nchar](50) NULL,
	[question_title] [nvarchar](50) NULL,
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
/****** Object:  Table [dbo].[resource_link_tbl]    Script Date: 6/26/2016 1:00:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[resource_link_tbl](
	[id] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object:  Table [dbo].[resource_tbl]    Script Date: 6/26/2016 1:00:38 PM ******/
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
	[delete_flag] [bit] NULL,
 CONSTRAINT [PK_resource_tbl] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[role_detail_tbl]    Script Date: 6/26/2016 1:00:38 PM ******/
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
/****** Object:  Table [dbo].[role_tbl]    Script Date: 6/26/2016 1:00:38 PM ******/
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
/****** Object:  Table [dbo].[staff_tbl]    Script Date: 6/26/2016 1:00:38 PM ******/
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
/****** Object:  Table [dbo].[topic_tbl]    Script Date: 6/26/2016 1:00:38 PM ******/
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
/****** Object:  Table [dbo].[user_answer_question_detail_tbl]    Script Date: 6/26/2016 1:00:38 PM ******/
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
/****** Object:  Table [dbo].[user_answer_question_tbl]    Script Date: 6/26/2016 1:00:38 PM ******/
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
 CONSTRAINT [PK_user_answer_question_tbl] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[user_tbl]    Script Date: 6/26/2016 1:00:38 PM ******/
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
SET IDENTITY_INSERT [dbo].[answer_tbl] ON 

INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (1, N'an_001                                            ', NULL, N'q_001                                             ', NULL, N'A', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (2, N'an_002                                            ', NULL, N'q_001                                             ', NULL, N'B', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (3, N'an_003                                            ', NULL, N'q_001                                             ', NULL, N'C', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (4, N'an_004                                            ', NULL, N'q_001                                             ', NULL, N'D', NULL, 1, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (5, N'an_005                                            ', NULL, N'q_002                                             ', NULL, N'A', NULL, 1, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (6, N'an_006                                            ', NULL, N'q_002                                             ', NULL, N'B', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (7, N'an_007                                            ', NULL, N'q_002                                             ', NULL, N'C', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (8, N'an_008                                            ', NULL, N'q_002                                             ', NULL, N'D', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (9, N'an_009                                            ', NULL, N'q_003                                             ', NULL, N'A', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (10, N'an_010                                            ', NULL, N'q_003                                             ', NULL, N'B', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (11, N'an_011                                            ', NULL, N'q_003                                             ', NULL, N'C', NULL, 1, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (12, N'an_012                                            ', NULL, N'q_003                                             ', NULL, N'D', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (13, N'an_013                                            ', NULL, N'q_004                                             ', NULL, N'A', NULL, 1, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (14, N'an_014                                            ', NULL, N'q_004                                             ', NULL, N'B', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (15, N'an_015                                            ', NULL, N'q_004                                             ', NULL, N'C', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (16, N'an_016                                            ', NULL, N'q_004                                             ', NULL, N'D', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (17, N'an_017                                            ', NULL, N'q_005                                             ', NULL, N'A', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (18, N'an_018                                            ', NULL, N'q_005                                             ', NULL, N'B', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (19, N'an_019                                            ', NULL, N'q_005                                             ', NULL, N'C', NULL, 1, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (20, N'an_020                                            ', NULL, N'q_005                                             ', NULL, N'D', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (21, N'an_021                                            ', NULL, N'q_006                                             ', NULL, N'A', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (22, N'an_022                                            ', NULL, N'q_006                                             ', NULL, N'B', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (23, N'an_023                                            ', NULL, N'q_006                                             ', NULL, N'C', NULL, 1, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (24, N'an_024                                            ', NULL, N'q_007                                             ', NULL, N'A', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (25, N'an_025                                            ', NULL, N'q_007                                             ', NULL, N'B', NULL, 1, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (26, N'an_026                                            ', NULL, N'q_007                                             ', NULL, N'C', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (27, N'an_027                                            ', NULL, N'q_008                                             ', NULL, N'A', NULL, 1, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (28, N'an_028                                            ', NULL, N'q_008                                             ', NULL, N'B', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (29, N'an_029                                            ', NULL, N'q_008                                             ', NULL, N'C', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (30, N'an_030                                            ', NULL, N'q_009                                             ', NULL, N'A', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (31, N'an_031                                            ', NULL, N'q_009                                             ', NULL, N'B', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (32, N'an_032                                            ', NULL, N'q_009                                             ', NULL, N'C', NULL, 1, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (33, N'an_033                                            ', NULL, N'q_010                                             ', N'She didn’t like her boss', N'A', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (34, N'an_034                                            ', NULL, N'q_010                                             ', N'The pay was too low', N'B', NULL, 1, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (35, N'an_035                                            ', NULL, N'q_010                                             ', N'She got offered a better job', N'C', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (36, N'an_036                                            ', NULL, N'q_010                                             ', N'. She never got a raise', N'D', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (37, N'an_037                                            ', NULL, N'q_011                                             ', N'Three weeks ago', N'A', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (38, N'an_038                                            ', NULL, N'q_011                                             ', N'One week ago', N'B', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (39, N'an_039                                            ', NULL, N'q_011                                             ', N'Four weeks ago', N'C', NULL, 1, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (40, N'an_040                                            ', NULL, N'q_011                                             ', N'Two weeks ago', N'D', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (41, N'an_041                                            ', NULL, N'q_012                                             ', N'The hours are longer, but the pay is more', N'A', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (42, N'an_042                                            ', NULL, N'q_012                                             ', N'The hours are shorter, but the pay is less', N'B', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (43, N'an_043                                            ', NULL, N'q_012                                             ', N'The hours and pay are the same, but she likes it more', N'C', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (44, N'an_044                                            ', NULL, N'q_012                                             ', N'The hours are shorter, and the pay is more', N'D', NULL, 1, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (45, N'an_045                                            ', NULL, N'q_013                                             ', N'Buy lunch for jean', N'A', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (46, N'an_046                                            ', NULL, N'q_013                                             ', N'Have breakfast with Jean', N'B', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (47, N'an_047                                            ', NULL, N'q_013                                             ', N'Have lunch', N'C', NULL, 1, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (48, N'an_048                                            ', NULL, N'q_013                                             ', N'Buy dinner for jean', N'D', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (49, N'an_049                                            ', NULL, N'q_014                                             ', N'She has a business meeting to go to', N'A', NULL, 1, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (50, N'an_050                                            ', NULL, N'q_014                                             ', N'She is not hungry', N'B', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (51, N'an_051                                            ', NULL, N'q_014                                             ', N'She has no money', N'C', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (52, N'an_052                                            ', NULL, N'q_014                                             ', N'Steve is eating a business lunch', N'D', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (53, N'an_053                                            ', NULL, N'q_015                                             ', N'He is annoyed', N'A', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (54, N'an_054                                            ', NULL, N'q_015                                             ', N'He knows some good restaurants nearby', N'B', NULL, 1, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (55, N'an_055                                            ', NULL, N'q_015                                             ', N'He will take her tomorrow', N'C', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (56, N'an_056                                            ', NULL, N'q_015                                             ', N'He has a busy day', N'D', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (57, N'an_057                                            ', NULL, N'q_016                                             ', N'9:00 am – 5:00 pm', N'A', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (58, N'an_058                                            ', NULL, N'q_016                                             ', N'5:00 pm – 01:00 am', N'B', NULL, 1, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (59, N'an_059                                            ', NULL, N'q_016                                             ', N'11:00 pm – 7:00 am', N'C', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (60, N'an_060                                            ', NULL, N'q_016                                             ', N'4:30 am – 6:00 pm', N'D', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (61, N'an_061                                            ', NULL, N'q_017                                             ', N'During the day', N'A', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (62, N'an_062                                            ', NULL, N'q_017                                             ', N'During the night', N'B', NULL, 1, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (63, N'an_063                                            ', NULL, N'q_017                                             ', N'On the weekends', N'C', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (64, N'an_064                                            ', NULL, N'q_017                                             ', N'Only during holidays', N'D', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (65, N'an_065                                            ', NULL, N'q_018                                             ', N'You work eight to four', N'A', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (66, N'an_066                                            ', NULL, N'q_018                                             ', N'You can choose your own hours', N'B', NULL, 1, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (67, N'an_067                                            ', NULL, N'q_018                                             ', N'You work at night', N'C', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (68, N'an_068                                            ', NULL, N'q_018                                             ', N'You work only during the day', N'D', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (69, N'an_069                                            ', NULL, N'q_019                                             ', N'Six', N'A', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (70, N'an_070                                            ', NULL, N'q_019                                             ', N'Eight', N'B', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (71, N'an_071                                            ', NULL, N'q_019                                             ', N'Ten', N'C', NULL, 1, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (72, N'an_072                                            ', NULL, N'q_019                                             ', N'Twelve', N'D', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (73, N'an_073                                            ', NULL, N'q_020                                             ', N'Medical insurance', N'A', NULL, 1, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (74, N'an_074                                            ', NULL, N'q_020                                             ', N'Home insurance', N'B', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (75, N'an_075                                            ', NULL, N'q_020                                             ', N'Life insurance', N'C', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (76, N'an_076                                            ', NULL, N'q_020                                             ', N'A company car', N'D', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (77, N'an_077                                            ', NULL, N'q_021                                             ', N'By taking the bus', N'A', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (78, N'an_078                                            ', NULL, N'q_021                                             ', N'By walking to work', N'B', NULL, 1, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (79, N'an_079                                            ', NULL, N'q_021                                             ', N'By parking close to the office', N'C', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (80, N'an_080                                            ', NULL, N'q_021                                             ', N'By riding whit a co-worker', N'D', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (81, N'an_081                                            ', NULL, N'q_022                                             ', N'noisy', N'A', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (82, N'an_082                                            ', NULL, N'q_022                                             ', N'sounded', N'B', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (83, N'an_083                                            ', NULL, N'q_022                                             ', N'loud', N'C', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (84, N'an_084                                            ', NULL, N'q_022                                             ', N'noise', N'D', NULL, 1, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (85, N'an_085                                            ', NULL, N'q_023                                             ', N'Know not', N'A', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (86, N'an_086                                            ', NULL, N'q_023                                             ', N'Not know', N'B', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (87, N'an_087                                            ', NULL, N'q_023                                             ', N'No knowing', N'C', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (88, N'an_088                                            ', NULL, N'q_023                                             ', N'Not knowing', N'D', NULL, 1, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (89, N'an_089                                            ', NULL, N'q_024                                             ', N'does he', N'A', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (90, N'an_090                                            ', NULL, N'q_024                                             ', N'doesn’t he', N'B', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (91, N'an_091                                            ', NULL, N'q_024                                             ', N'has he', N'C', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (92, N'an_092                                            ', NULL, N'q_024                                             ', N'hasn’t he', N'D', NULL, 1, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (93, N'an_093                                            ', NULL, N'q_025                                             ', N'did not', N'A', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (94, N'an_094                                            ', NULL, N'q_025                                             ', N'does not have', N'B', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (95, N'an_095                                            ', NULL, N'q_025                                             ', N'did not have', N'C', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (96, N'an_096                                            ', NULL, N'q_025                                             ', N'has not', N'D', NULL, 1, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (97, N'an_097                                            ', NULL, N'q_026                                             ', N'not enjoyed', N'A', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (98, N'an_098                                            ', NULL, N'q_026                                             ', N'enjoyed not', N'B', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (99, N'an_099                                            ', NULL, N'q_026                                             ', N'didn’t enjoy', N'C', NULL, 1, NULL, NULL)
GO
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (100, N'an_100                                            ', NULL, N'q_026                                             ', N'didn’t enjoyed', N'D', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (101, N'an_101                                            ', NULL, N'q_027                                             ', N'succeed', N'A', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (102, N'an_102                                            ', NULL, N'q_027                                             ', N'pass', N'B', NULL, 1, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (103, N'an_103                                            ', NULL, N'q_027                                             ', N'success', N'C', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (104, N'an_104                                            ', NULL, N'q_027                                             ', N'graduate', N'D', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (105, N'an_105                                            ', NULL, N'q_028                                             ', N'no', N'A', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (106, N'an_106                                            ', NULL, N'q_028                                             ', N'not', N'B', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (107, N'an_107                                            ', NULL, N'q_028                                             ', N'no to', N'C', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (108, N'an_108                                            ', NULL, N'q_028                                             ', N'not to', N'D', NULL, 1, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (109, N'an_109                                            ', NULL, N'q_029                                             ', N'not have', N'A', NULL, 1, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (110, N'an_110                                            ', NULL, N'q_029                                             ', N'have to', N'B', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (111, N'an_111                                            ', NULL, N'q_029                                             ', N'haven’t', N'C', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (112, N'an_112                                            ', NULL, N'q_029                                             ', N'has not', N'D', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (113, N'an_113                                            ', NULL, N'q_030                                             ', N'quiet', N'A', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (114, N'an_114                                            ', NULL, N'q_030                                             ', N'with quiet', N'B', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (115, N'an_115                                            ', NULL, N'q_030                                             ', N'quietly', N'C', NULL, 1, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (116, N'an_116                                            ', NULL, N'q_030                                             ', N'in quiet', N'D', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (117, N'an_117                                            ', NULL, N'q_031                                             ', N'speaks', N'A', NULL, 1, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (118, N'an_118                                            ', NULL, N'q_031                                             ', N'tells', N'B', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (119, N'an_119                                            ', NULL, N'q_031                                             ', N'told', N'C', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (120, N'an_120                                            ', NULL, N'q_031                                             ', N'asks', N'D', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (121, N'an_121                                            ', NULL, N'q_032                                             ', N'neither saw birds', N'A', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (122, N'an_122                                            ', NULL, N'q_032                                             ', N'saw birds neither', N'B', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (123, N'an_123                                            ', NULL, N'q_032                                             ', N'saw neither birds', N'C', NULL, 1, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (124, N'an_124                                            ', NULL, N'q_032                                             ', N'neither did birds', N'D', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (125, N'an_125                                            ', NULL, N'q_033                                             ', N'is no', N'A', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (126, N'an_126                                            ', NULL, N'q_033                                             ', N'is not', N'B', NULL, 1, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (127, N'an_127                                            ', NULL, N'q_033                                             ', N'no is', N'C', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (128, N'an_128                                            ', NULL, N'q_033                                             ', N'not is', N'D', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (129, N'an_129                                            ', NULL, N'q_034                                             ', N'miss', N'A', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (130, N'an_130                                            ', NULL, N'q_034                                             ', N'missed', N'B', NULL, 1, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (131, N'an_131                                            ', NULL, N'q_034                                             ', N'did miss', N'C', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (132, N'an_132                                            ', NULL, N'q_034                                             ', N'missing', N'D', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (133, N'an_133                                            ', NULL, N'q_035                                             ', N'to swim', N'A', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (134, N'an_134                                            ', NULL, N'q_035                                             ', N'swimming', N'B', NULL, 1, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (135, N'an_135                                            ', NULL, N'q_035                                             ', N'swim', N'C', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (136, N'an_136                                            ', NULL, N'q_035                                             ', N'likes swimming', N'D', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (137, N'an_137                                            ', NULL, N'q_036                                             ', N'trip', N'A', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (138, N'an_138                                            ', NULL, N'q_036                                             ', N'journey', N'B', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (139, N'an_139                                            ', NULL, N'q_036                                             ', N'visit', N'C', NULL, 1, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (140, N'an_140                                            ', NULL, N'q_036                                             ', N'turn up', N'D', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (141, N'an_141                                            ', NULL, N'q_037                                             ', N'all', N'A', NULL, 1, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (142, N'an_142                                            ', NULL, N'q_037                                             ', N'every', N'B', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (143, N'an_143                                            ', NULL, N'q_037                                             ', N'each', N'C', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (144, N'an_144                                            ', NULL, N'q_037                                             ', N'much', N'D', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (145, N'an_145                                            ', NULL, N'q_038                                             ', N'to', N'A', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (146, N'an_146                                            ', NULL, N'q_038                                             ', N'with', N'B', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (147, N'an_147                                            ', NULL, N'q_038                                             ', N'in', N'C', NULL, 1, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (148, N'an_148                                            ', NULL, N'q_038                                             ', N'for', N'D', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (149, N'an_149                                            ', NULL, N'q_039                                             ', N'set', N'A', NULL, 1, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (150, N'an_150                                            ', NULL, N'q_039                                             ', N'put', N'B', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (151, N'an_151                                            ', NULL, N'q_039                                             ', N'held', N'C', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (152, N'an_152                                            ', NULL, N'q_039                                             ', N'designed', N'D', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (153, N'an_153                                            ', NULL, N'q_040                                             ', N'application', N'A', NULL, 1, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (154, N'an_154                                            ', NULL, N'q_040                                             ', N'applying', N'B', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (155, N'an_155                                            ', NULL, N'q_040                                             ', N'apply', N'C', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (156, N'an_156                                            ', NULL, N'q_040                                             ', N'applicable', N'D', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (157, N'an_157                                            ', NULL, N'q_041                                             ', N'entering', N'A', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (158, N'an_158                                            ', NULL, N'q_041                                             ', N'coming', N'B', NULL, 1, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (159, N'an_159                                            ', NULL, N'q_041                                             ', N'going', N'C', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (160, N'an_160                                            ', NULL, N'q_041                                             ', N'visiting', N'D', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (161, N'an_161                                            ', NULL, N'q_042                                             ', N'pleasure', N'A', NULL, 1, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (162, N'an_162                                            ', NULL, N'q_042                                             ', N'regret', N'B', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (163, N'an_163                                            ', NULL, N'q_042                                             ', N'sorrow', N'C', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (164, N'an_164                                            ', NULL, N'q_042                                             ', N'happy', N'D', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (165, N'an_165                                            ', NULL, N'q_043                                             ', N'interesting', N'A', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (166, N'an_166                                            ', NULL, N'q_043                                             ', N'interest', N'B', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (167, N'an_167                                            ', NULL, N'q_043                                             ', N'interested', N'C', NULL, 1, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (168, N'an_168                                            ', NULL, N'q_043                                             ', N'interests', N'D', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (169, N'an_169                                            ', NULL, N'q_044                                             ', N'listened', N'A', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (170, N'an_170                                            ', NULL, N'q_044                                             ', N'heard', N'B', NULL, 1, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (171, N'an_171                                            ', NULL, N'q_044                                             ', N'listen', N'C', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (172, N'an_172                                            ', NULL, N'q_044                                             ', N'hear', N'D', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (173, N'an_173                                            ', NULL, N'q_045                                             ', N'still', N'A', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (174, N'an_174                                            ', NULL, N'q_045                                             ', N'yet', N'B', NULL, 1, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (175, N'an_175                                            ', NULL, N'q_045                                             ', N'until', N'C', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (176, N'an_176                                            ', NULL, N'q_045                                             ', N'after', N'D', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (177, N'an_177                                            ', NULL, N'q_046                                             ', N'every', N'A', NULL, 1, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (178, N'an_178                                            ', NULL, N'q_046                                             ', N'each', N'B', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (179, N'an_179                                            ', NULL, N'q_046                                             ', N'most', N'C', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (180, N'an_180                                            ', NULL, N'q_046                                             ', N'all', N'D', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (181, N'an_181                                            ', NULL, N'q_047                                             ', N'commences', N'A', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (182, N'an_182                                            ', NULL, N'q_047                                             ', N'finishes', N'B', NULL, 1, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (183, N'an_183                                            ', NULL, N'q_047                                             ', N'opens', N'C', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (184, N'an_184                                            ', NULL, N'q_047                                             ', N'exceeds', N'D', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (185, N'an_185                                            ', NULL, N'q_048                                             ', N'cooperate', N'A', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (186, N'an_186                                            ', NULL, N'q_048                                             ', N'cooperating', N'B', NULL, 1, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (187, N'an_187                                            ', NULL, N'q_048                                             ', N'cooperates', N'C', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (188, N'an_188                                            ', NULL, N'q_048                                             ', N'cooperation', N'D', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (189, N'an_189                                            ', NULL, N'q_049                                             ', N'The Valued Customer', N'A', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (190, N'an_190                                            ', NULL, N'q_049                                             ', N'The London Coffee Shop', N'B', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (191, N'an_191                                            ', NULL, N'q_049                                             ', N'The Orange Cat', N'C', NULL, 1, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (192, N'an_192                                            ', NULL, N'q_049                                             ', N'The Open Letter', N'D', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (193, N'an_193                                            ', NULL, N'q_050                                             ', N'The end of this month', N'A', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (194, N'an_194                                            ', NULL, N'q_050                                             ', N'The end of next month', N'B', NULL, 1, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (195, N'an_195                                            ', NULL, N'q_050                                             ', N'The beginning of this month', N'C', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (196, N'an_196                                            ', NULL, N'q_050                                             ', N'The end of the year', N'D', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (197, N'an_197                                            ', NULL, N'q_051                                             ', N'Coffee', N'A', NULL, 1, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (198, N'an_198                                            ', NULL, N'q_051                                             ', N'Coffee coupons', N'B', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (199, N'an_199                                            ', NULL, N'q_051                                             ', N'Coffee beans', N'C', NULL, 0, NULL, NULL)
GO
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (200, N'an_200                                            ', NULL, N'q_051                                             ', N'Low prices', N'D', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (201, N'an_201                                            ', NULL, N'q_052                                             ', N'The break-room', N'A', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (202, N'an_202                                            ', NULL, N'q_052                                             ', N'Restrooms', N'B', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (203, N'an_203                                            ', NULL, N'q_052                                             ', N'The parking area', N'C', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (204, N'an_204                                            ', NULL, N'q_052                                             ', N'A and B', N'D', NULL, 1, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (205, N'an_205                                            ', NULL, N'q_053                                             ', N'Five minutes for each hour of work.', N'A', NULL, 1, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (206, N'an_206                                            ', NULL, N'q_053                                             ', N'Five minutes for every two hours of work.', N'B', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (207, N'an_207                                            ', NULL, N'q_053                                             ', N'Ten minutes for each hour of work.', N'C', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (208, N'an_208                                            ', NULL, N'q_053                                             ', N'It is not stated in the notice.', N'D', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (209, N'an_209                                            ', NULL, N'q_054                                             ', N'A co-worker', N'A', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (210, N'an_210                                            ', NULL, N'q_054                                             ', N'The company owner', N'B', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (211, N'an_211                                            ', NULL, N'q_054                                             ', N'The fire department', N'C', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (212, N'an_212                                            ', NULL, N'q_054                                             ', N'A department supervisor', N'D', NULL, 1, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (213, N'an_213                                            ', NULL, N'q_055                                             ', N'All smokers will be monitored.', N'A', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (214, N'an_214                                            ', NULL, N'q_055                                             ', N'Bonuses will be given to people who stop smoking.', N'B', NULL, 1, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (215, N'an_215                                            ', NULL, N'q_055                                             ', N'People will be discriminated against.', N'C', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (216, N'an_216                                            ', NULL, N'q_055                                             ', N'Department supervisors will contact all workers.', N'D', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (217, N'an_217                                            ', NULL, N'q_056                                             ', N'Having good punctuation when writing', N'A', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (218, N'an_218                                            ', NULL, N'q_056                                             ', N'Being where you should', N'B', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (219, N'an_219                                            ', NULL, N'q_056                                             ', N'Being successful', N'C', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (220, N'an_220                                            ', NULL, N'q_056                                             ', N'Being where you should, when you should', N'D', NULL, 1, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (221, N'an_221                                            ', NULL, N'q_057                                             ', N'They are late, don’t ask questions, and never learn new things.', N'A', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (222, N'an_222                                            ', NULL, N'q_057                                             ', N'They are late, don’t ask questions, and try to learn new things.', N'B', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (223, N'an_223                                            ', NULL, N'q_057                                             ', N'They are late, ask questions, and try to learn new things.', N'C', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (224, N'an_224                                            ', NULL, N'q_057                                             ', N'They aren’t late, ask questions, and try to learn new things.', N'D', NULL, 1, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (225, N'an_225                                            ', NULL, N'q_058                                             ', N'That you should study about business in school', N'A', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (226, N'an_226                                            ', NULL, N'q_058                                             ', N'That you should not get involved in office gossip', N'B', NULL, 1, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (227, N'an_227                                            ', NULL, N'q_058                                             ', N'That you should prepare to own your own business', N'C', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (228, N'an_228                                            ', NULL, N'q_058                                             ', N'That you should talk a lot about other people', N'D', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (229, N'an_229                                            ', NULL, N'q_059                                             ', N'Being late, not asking anything, gossiping, and not learning', N'A', NULL, 1, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (230, N'an_230                                            ', NULL, N'q_059                                             ', N'Being late, asking anything, talking about others, and not learning', N'B', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (231, N'an_231                                            ', NULL, N'q_059                                             ', N'Being punctual, not asking anything, gossiping, and not learning', N'C', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (232, N'an_232                                            ', NULL, N'q_059                                             ', N'Being late, not asking anything, not learning, and not gossiping', N'D', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (233, N'an_233                                            ', NULL, N'q_060                                             ', N'Home', N'A', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (234, N'an_234                                            ', NULL, N'q_060                                             ', N'Work', N'B', NULL, 1, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (235, N'an_235                                            ', NULL, N'q_060                                             ', N'A store', N'C', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (236, N'an_236                                            ', NULL, N'q_060                                             ', N'A person', N'D', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (237, N'an_237                                            ', NULL, N'q_061                                             ', N'Pencils', N'A', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (238, N'an_238                                            ', NULL, N'q_061                                             ', N'A ashtray', N'B', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (239, N'an_239                                            ', NULL, N'q_061                                             ', N'A computer monitor', N'C', NULL, 1, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (240, N'an_240                                            ', NULL, N'q_061                                             ', N'A ruler', N'D', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (241, N'an_241                                            ', NULL, N'q_062                                             ', N'Pens and pencils', N'A', NULL, 1, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (242, N'an_242                                            ', NULL, N'q_062                                             ', N'Desktop items', N'B', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (243, N'an_243                                            ', NULL, N'q_062                                             ', N'Computer accessories', N'C', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (244, N'an_244                                            ', NULL, N'q_062                                             ', N'Computer programs', N'D', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (245, N'an_245                                            ', NULL, N'q_063                                             ', N'25-35', N'A', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (246, N'an_246                                            ', NULL, N'q_063                                             ', N'2 years', N'B', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (247, N'an_247                                            ', NULL, N'q_063                                             ', N'100', N'C', NULL, 1, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (248, N'an_248                                            ', NULL, N'q_063                                             ', N'80 percent', N'D', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (249, N'an_249                                            ', NULL, N'q_064                                             ', N'About $10', N'A', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (250, N'an_250                                            ', NULL, N'q_064                                             ', N'Less than $5', N'B', NULL, 1, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (251, N'an_251                                            ', NULL, N'q_064                                             ', N'It depends', N'C', NULL, 0, NULL, NULL)
INSERT [dbo].[answer_tbl] ([id], [answer_id], [answer_order], [question_id], [answer_content], [answer_title], [resource_id], [is_correct], [notes], [delete_flag]) VALUES (252, N'an_252                                            ', NULL, N'q_064                                             ', N'Very expensive', N'D', NULL, 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[answer_tbl] OFF
SET IDENTITY_INSERT [dbo].[examination_part_tbl] ON 

INSERT [dbo].[examination_part_tbl] ([id], [examination_id], [examination_order], [part_id], [part_order], [part_content], [part_title]) VALUES (1, N'exam_001                                          ', 0, N'part_001                                          ', NULL, NULL, NULL)
INSERT [dbo].[examination_part_tbl] ([id], [examination_id], [examination_order], [part_id], [part_order], [part_content], [part_title]) VALUES (2, N'exam_001                                          ', 6, N'part_002                                          ', NULL, NULL, NULL)
INSERT [dbo].[examination_part_tbl] ([id], [examination_id], [examination_order], [part_id], [part_order], [part_content], [part_title]) VALUES (3, N'exam_001                                          ', 11, N'part_003                                          ', NULL, NULL, NULL)
INSERT [dbo].[examination_part_tbl] ([id], [examination_id], [examination_order], [part_id], [part_order], [part_content], [part_title]) VALUES (4, N'exam_001                                          ', 18, N'part_004                                          ', NULL, NULL, NULL)
INSERT [dbo].[examination_part_tbl] ([id], [examination_id], [examination_order], [part_id], [part_order], [part_content], [part_title]) VALUES (5, N'exam_001                                          ', 25, N'part_005                                          ', NULL, NULL, NULL)
INSERT [dbo].[examination_part_tbl] ([id], [examination_id], [examination_order], [part_id], [part_order], [part_content], [part_title]) VALUES (6, N'exam_001                                          ', 41, N'part_006                                          ', NULL, NULL, NULL)
INSERT [dbo].[examination_part_tbl] ([id], [examination_id], [examination_order], [part_id], [part_order], [part_content], [part_title]) VALUES (7, N'exam_001                                          ', 57, N'part_007                                          ', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[examination_part_tbl] OFF
SET IDENTITY_INSERT [dbo].[examination_question_tbl] ON 

INSERT [dbo].[examination_question_tbl] ([id], [examination_id], [question_id], [question_code], [examination_order]) VALUES (1, N'exam_001                                          ', N'q_001                                             ', NULL, 1)
INSERT [dbo].[examination_question_tbl] ([id], [examination_id], [question_id], [question_code], [examination_order]) VALUES (2, N'exam_001                                          ', N'q_002                                             ', NULL, 2)
INSERT [dbo].[examination_question_tbl] ([id], [examination_id], [question_id], [question_code], [examination_order]) VALUES (3, N'exam_001                                          ', N'q_003                                             ', NULL, 3)
INSERT [dbo].[examination_question_tbl] ([id], [examination_id], [question_id], [question_code], [examination_order]) VALUES (4, N'exam_001                                          ', N'q_004                                             ', NULL, 4)
INSERT [dbo].[examination_question_tbl] ([id], [examination_id], [question_id], [question_code], [examination_order]) VALUES (5, N'exam_001                                          ', N'q_005                                             ', NULL, 5)
INSERT [dbo].[examination_question_tbl] ([id], [examination_id], [question_id], [question_code], [examination_order]) VALUES (6, N'exam_001                                          ', N'q_006                                             ', NULL, 7)
INSERT [dbo].[examination_question_tbl] ([id], [examination_id], [question_id], [question_code], [examination_order]) VALUES (7, N'exam_001                                          ', N'q_007                                             ', NULL, 8)
INSERT [dbo].[examination_question_tbl] ([id], [examination_id], [question_id], [question_code], [examination_order]) VALUES (8, N'exam_001                                          ', N'q_008                                             ', NULL, 9)
INSERT [dbo].[examination_question_tbl] ([id], [examination_id], [question_id], [question_code], [examination_order]) VALUES (9, N'exam_001                                          ', N'q_009                                             ', NULL, 10)
INSERT [dbo].[examination_question_tbl] ([id], [examination_id], [question_id], [question_code], [examination_order]) VALUES (12, N'exam_001                                          ', N'q_010                                             ', NULL, 12)
INSERT [dbo].[examination_question_tbl] ([id], [examination_id], [question_id], [question_code], [examination_order]) VALUES (13, N'exam_001                                          ', N'q_011                                             ', NULL, 13)
INSERT [dbo].[examination_question_tbl] ([id], [examination_id], [question_id], [question_code], [examination_order]) VALUES (14, N'exam_001                                          ', N'q_012                                             ', NULL, 14)
INSERT [dbo].[examination_question_tbl] ([id], [examination_id], [question_id], [question_code], [examination_order]) VALUES (15, N'exam_001                                          ', N'q_013                                             ', NULL, 15)
INSERT [dbo].[examination_question_tbl] ([id], [examination_id], [question_id], [question_code], [examination_order]) VALUES (16, N'exam_001                                          ', N'q_014                                             ', NULL, 16)
INSERT [dbo].[examination_question_tbl] ([id], [examination_id], [question_id], [question_code], [examination_order]) VALUES (17, N'exam_001                                          ', N'q_015                                             ', NULL, 17)
INSERT [dbo].[examination_question_tbl] ([id], [examination_id], [question_id], [question_code], [examination_order]) VALUES (18, N'exam_001                                          ', N'q_016                                             ', NULL, 19)
INSERT [dbo].[examination_question_tbl] ([id], [examination_id], [question_id], [question_code], [examination_order]) VALUES (19, N'exam_001                                          ', N'q_017                                             ', NULL, 20)
INSERT [dbo].[examination_question_tbl] ([id], [examination_id], [question_id], [question_code], [examination_order]) VALUES (20, N'exam_001                                          ', N'q_018                                             ', NULL, 21)
INSERT [dbo].[examination_question_tbl] ([id], [examination_id], [question_id], [question_code], [examination_order]) VALUES (21, N'exam_001                                          ', N'q_019                                             ', NULL, 22)
INSERT [dbo].[examination_question_tbl] ([id], [examination_id], [question_id], [question_code], [examination_order]) VALUES (22, N'exam_001                                          ', N'q_020                                             ', NULL, 23)
INSERT [dbo].[examination_question_tbl] ([id], [examination_id], [question_id], [question_code], [examination_order]) VALUES (23, N'exam_001                                          ', N'q_021                                             ', NULL, 24)
INSERT [dbo].[examination_question_tbl] ([id], [examination_id], [question_id], [question_code], [examination_order]) VALUES (24, N'exam_001                                          ', N'q_022                                             ', NULL, 26)
INSERT [dbo].[examination_question_tbl] ([id], [examination_id], [question_id], [question_code], [examination_order]) VALUES (25, N'exam_001                                          ', N'q_023                                             ', NULL, 27)
INSERT [dbo].[examination_question_tbl] ([id], [examination_id], [question_id], [question_code], [examination_order]) VALUES (26, N'exam_001                                          ', N'q_024                                             ', NULL, 28)
INSERT [dbo].[examination_question_tbl] ([id], [examination_id], [question_id], [question_code], [examination_order]) VALUES (27, N'exam_001                                          ', N'q_025                                             ', NULL, 29)
INSERT [dbo].[examination_question_tbl] ([id], [examination_id], [question_id], [question_code], [examination_order]) VALUES (28, N'exam_001                                          ', N'q_026                                             ', NULL, 30)
INSERT [dbo].[examination_question_tbl] ([id], [examination_id], [question_id], [question_code], [examination_order]) VALUES (29, N'exam_001                                          ', N'q_027                                             ', NULL, 31)
INSERT [dbo].[examination_question_tbl] ([id], [examination_id], [question_id], [question_code], [examination_order]) VALUES (30, N'exam_001                                          ', N'q_028                                             ', NULL, 32)
INSERT [dbo].[examination_question_tbl] ([id], [examination_id], [question_id], [question_code], [examination_order]) VALUES (31, N'exam_001                                          ', N'q_029                                             ', NULL, 33)
INSERT [dbo].[examination_question_tbl] ([id], [examination_id], [question_id], [question_code], [examination_order]) VALUES (32, N'exam_001                                          ', N'q_030                                             ', NULL, 34)
INSERT [dbo].[examination_question_tbl] ([id], [examination_id], [question_id], [question_code], [examination_order]) VALUES (33, N'exam_001                                          ', N'q_031                                             ', NULL, 35)
INSERT [dbo].[examination_question_tbl] ([id], [examination_id], [question_id], [question_code], [examination_order]) VALUES (34, N'exam_001                                          ', N'q_032                                             ', NULL, 36)
INSERT [dbo].[examination_question_tbl] ([id], [examination_id], [question_id], [question_code], [examination_order]) VALUES (35, N'exam_001                                          ', N'q_033                                             ', NULL, 37)
INSERT [dbo].[examination_question_tbl] ([id], [examination_id], [question_id], [question_code], [examination_order]) VALUES (36, N'exam_001                                          ', N'q_034                                             ', NULL, 38)
INSERT [dbo].[examination_question_tbl] ([id], [examination_id], [question_id], [question_code], [examination_order]) VALUES (37, N'exam_001                                          ', N'q_035                                             ', NULL, 39)
INSERT [dbo].[examination_question_tbl] ([id], [examination_id], [question_id], [question_code], [examination_order]) VALUES (38, N'exam_001                                          ', N'q_036                                             ', NULL, 40)
INSERT [dbo].[examination_question_tbl] ([id], [examination_id], [question_id], [question_code], [examination_order]) VALUES (39, N'exam_001                                          ', N'q_037                                             ', NULL, 43)
INSERT [dbo].[examination_question_tbl] ([id], [examination_id], [question_id], [question_code], [examination_order]) VALUES (40, N'exam_001                                          ', N'q_038                                             ', NULL, 44)
INSERT [dbo].[examination_question_tbl] ([id], [examination_id], [question_id], [question_code], [examination_order]) VALUES (41, N'exam_001                                          ', N'q_039                                             ', NULL, 45)
INSERT [dbo].[examination_question_tbl] ([id], [examination_id], [question_id], [question_code], [examination_order]) VALUES (42, N'exam_001                                          ', N'q_040                                             ', NULL, 46)
INSERT [dbo].[examination_question_tbl] ([id], [examination_id], [question_id], [question_code], [examination_order]) VALUES (43, N'exam_001                                          ', N'q_041                                             ', NULL, 48)
INSERT [dbo].[examination_question_tbl] ([id], [examination_id], [question_id], [question_code], [examination_order]) VALUES (44, N'exam_001                                          ', N'q_042                                             ', NULL, 49)
INSERT [dbo].[examination_question_tbl] ([id], [examination_id], [question_id], [question_code], [examination_order]) VALUES (45, N'exam_001                                          ', N'q_043                                             ', NULL, 50)
INSERT [dbo].[examination_question_tbl] ([id], [examination_id], [question_id], [question_code], [examination_order]) VALUES (46, N'exam_001                                          ', N'q_044                                             ', NULL, 51)
INSERT [dbo].[examination_question_tbl] ([id], [examination_id], [question_id], [question_code], [examination_order]) VALUES (47, N'exam_001                                          ', N'q_045                                             ', NULL, 53)
INSERT [dbo].[examination_question_tbl] ([id], [examination_id], [question_id], [question_code], [examination_order]) VALUES (48, N'exam_001                                          ', N'q_046                                             ', NULL, 54)
INSERT [dbo].[examination_question_tbl] ([id], [examination_id], [question_id], [question_code], [examination_order]) VALUES (49, N'exam_001                                          ', N'q_047                                             ', NULL, 55)
INSERT [dbo].[examination_question_tbl] ([id], [examination_id], [question_id], [question_code], [examination_order]) VALUES (50, N'exam_001                                          ', N'q_048                                             ', NULL, 56)
INSERT [dbo].[examination_question_tbl] ([id], [examination_id], [question_id], [question_code], [examination_order]) VALUES (51, N'exam_001                                          ', N'q_049                                             ', NULL, 59)
INSERT [dbo].[examination_question_tbl] ([id], [examination_id], [question_id], [question_code], [examination_order]) VALUES (52, N'exam_001                                          ', N'q_050                                             ', NULL, 60)
INSERT [dbo].[examination_question_tbl] ([id], [examination_id], [question_id], [question_code], [examination_order]) VALUES (53, N'exam_001                                          ', N'q_051                                             ', NULL, 61)
INSERT [dbo].[examination_question_tbl] ([id], [examination_id], [question_id], [question_code], [examination_order]) VALUES (54, N'exam_001                                          ', N'q_052                                             ', NULL, 63)
INSERT [dbo].[examination_question_tbl] ([id], [examination_id], [question_id], [question_code], [examination_order]) VALUES (55, N'exam_001                                          ', N'q_053                                             ', NULL, 64)
INSERT [dbo].[examination_question_tbl] ([id], [examination_id], [question_id], [question_code], [examination_order]) VALUES (56, N'exam_001                                          ', N'q_054                                             ', NULL, 65)
INSERT [dbo].[examination_question_tbl] ([id], [examination_id], [question_id], [question_code], [examination_order]) VALUES (57, N'exam_001                                          ', N'q_055                                             ', NULL, 66)
INSERT [dbo].[examination_question_tbl] ([id], [examination_id], [question_id], [question_code], [examination_order]) VALUES (58, N'exam_001                                          ', N'q_056                                             ', NULL, 68)
INSERT [dbo].[examination_question_tbl] ([id], [examination_id], [question_id], [question_code], [examination_order]) VALUES (59, N'exam_001                                          ', N'q_057                                             ', NULL, 69)
INSERT [dbo].[examination_question_tbl] ([id], [examination_id], [question_id], [question_code], [examination_order]) VALUES (60, N'exam_001                                          ', N'q_058                                             ', NULL, 70)
INSERT [dbo].[examination_question_tbl] ([id], [examination_id], [question_id], [question_code], [examination_order]) VALUES (61, N'exam_001                                          ', N'q_059                                             ', NULL, 71)
INSERT [dbo].[examination_question_tbl] ([id], [examination_id], [question_id], [question_code], [examination_order]) VALUES (62, N'exam_001                                          ', N'q_060                                             ', NULL, 73)
INSERT [dbo].[examination_question_tbl] ([id], [examination_id], [question_id], [question_code], [examination_order]) VALUES (63, N'exam_001                                          ', N'q_061                                             ', NULL, 74)
INSERT [dbo].[examination_question_tbl] ([id], [examination_id], [question_id], [question_code], [examination_order]) VALUES (64, N'exam_001                                          ', N'q_062                                             ', NULL, 75)
INSERT [dbo].[examination_question_tbl] ([id], [examination_id], [question_id], [question_code], [examination_order]) VALUES (65, N'exam_001                                          ', N'q_063                                             ', NULL, 76)
INSERT [dbo].[examination_question_tbl] ([id], [examination_id], [question_id], [question_code], [examination_order]) VALUES (66, N'exam_001                                          ', N'q_064                                             ', NULL, 77)
SET IDENTITY_INSERT [dbo].[examination_question_tbl] OFF
INSERT [dbo].[examination_tbl] ([id], [name], [num_question], [type], [course], [course_level], [num_part]) VALUES (N'exam_001                                          ', NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[examination_topic_tbl] ON 

INSERT [dbo].[examination_topic_tbl] ([id], [topic_id], [examination_order], [topic_resource_id], [part_id], [examination_id], [delete_flag]) VALUES (1, N'tp_001                                            ', 42, NULL, N'part_006                                          ', N'exam_001  ', NULL)
INSERT [dbo].[examination_topic_tbl] ([id], [topic_id], [examination_order], [topic_resource_id], [part_id], [examination_id], [delete_flag]) VALUES (2, N'tp_002                                            ', 47, NULL, N'part_006                                          ', N'exam_001  ', NULL)
INSERT [dbo].[examination_topic_tbl] ([id], [topic_id], [examination_order], [topic_resource_id], [part_id], [examination_id], [delete_flag]) VALUES (3, N'tp_003                                            ', 52, NULL, N'part_006                                          ', N'exam_001  ', NULL)
INSERT [dbo].[examination_topic_tbl] ([id], [topic_id], [examination_order], [topic_resource_id], [part_id], [examination_id], [delete_flag]) VALUES (4, N'tp_004                                            ', 58, NULL, N'part_007                                          ', N'exam_001  ', NULL)
INSERT [dbo].[examination_topic_tbl] ([id], [topic_id], [examination_order], [topic_resource_id], [part_id], [examination_id], [delete_flag]) VALUES (5, N'tp_005                                            ', 62, NULL, N'part_007                                          ', N'exam_001  ', NULL)
INSERT [dbo].[examination_topic_tbl] ([id], [topic_id], [examination_order], [topic_resource_id], [part_id], [examination_id], [delete_flag]) VALUES (6, N'tp_006                                            ', 67, NULL, N'part_007                                          ', N'exam_001  ', NULL)
INSERT [dbo].[examination_topic_tbl] ([id], [topic_id], [examination_order], [topic_resource_id], [part_id], [examination_id], [delete_flag]) VALUES (7, N'tp_007                                            ', 72, NULL, N'part_007                                          ', N'exam_001  ', NULL)
SET IDENTITY_INSERT [dbo].[examination_topic_tbl] OFF
SET IDENTITY_INSERT [dbo].[guest_tbl] ON 

INSERT [dbo].[guest_tbl] ([id], [full_name], [email], [phone_number], [notes], [type], [examination_id], [correct_answer_num]) VALUES (1, N'thanh', N'tmthanh92@yahoo.com.vn', N'1212444535          ', N'testttttttt', 3, 0, 0)
INSERT [dbo].[guest_tbl] ([id], [full_name], [email], [phone_number], [notes], [type], [examination_id], [correct_answer_num]) VALUES (2, N'thanh', N'tmthanh92@yahoo.com.vn', N'1212444535          ', N'testttttttt', 3, NULL, NULL)
INSERT [dbo].[guest_tbl] ([id], [full_name], [email], [phone_number], [notes], [type], [examination_id], [correct_answer_num]) VALUES (3, N'thanh', N'tmthanh92@yahoo.com.vn', N'1212444535          ', N'testttttttt', 3, -1, -1)
INSERT [dbo].[guest_tbl] ([id], [full_name], [email], [phone_number], [notes], [type], [examination_id], [correct_answer_num]) VALUES (1002, N'sdhknsdf,', N'rtymhf@gmail.com', N'3426536             ', NULL, 1, -1, -1)
INSERT [dbo].[guest_tbl] ([id], [full_name], [email], [phone_number], [notes], [type], [examination_id], [correct_answer_num]) VALUES (1003, N'gghfghgfhg', N'yt@gmail.comm', N'134354              ', NULL, 1, 1, 0)
INSERT [dbo].[guest_tbl] ([id], [full_name], [email], [phone_number], [notes], [type], [examination_id], [correct_answer_num]) VALUES (1004, N'gdsfgy', N'tmthanh@gmail.comm', N'1234355             ', NULL, 2, 1, 3)
INSERT [dbo].[guest_tbl] ([id], [full_name], [email], [phone_number], [notes], [type], [examination_id], [correct_answer_num]) VALUES (1005, N'ewrr@gmail.com', N'ewrr@gmail.com', N'1232465             ', NULL, 1, 1, 0)
INSERT [dbo].[guest_tbl] ([id], [full_name], [email], [phone_number], [notes], [type], [examination_id], [correct_answer_num]) VALUES (1006, N'wetert', N'tasgh@gmail.com', N'12334               ', NULL, 2, 1, 0)
INSERT [dbo].[guest_tbl] ([id], [full_name], [email], [phone_number], [notes], [type], [examination_id], [correct_answer_num]) VALUES (1007, N'tdh6', N'thgdskfgh@gmail.com', N'21334               ', NULL, 1, 1, 0)
INSERT [dbo].[guest_tbl] ([id], [full_name], [email], [phone_number], [notes], [type], [examination_id], [correct_answer_num]) VALUES (1008, N'sdf', N'fghdfkjg@gmail.com', N'12423               ', NULL, 3, 1, 0)
SET IDENTITY_INSERT [dbo].[guest_tbl] OFF
SET IDENTITY_INSERT [dbo].[part_tbl] ON 

INSERT [dbo].[part_tbl] ([id], [part_id], [part_title], [part_content], [part_type], [part_resource], [delete_flag]) VALUES (1, N'part_001                                          ', N'Part I', N'Choose the statement that best describes what you see in the picture.', NULL, NULL, NULL)
INSERT [dbo].[part_tbl] ([id], [part_id], [part_title], [part_content], [part_type], [part_resource], [delete_flag]) VALUES (3, N'part_002                                          ', N'Part II', N'Listen to the questions and choose the best answer.', NULL, NULL, NULL)
INSERT [dbo].[part_tbl] ([id], [part_id], [part_title], [part_content], [part_type], [part_resource], [delete_flag]) VALUES (4, N'part_003                                          ', N'Part III', N'Choose the best answer to each question.', NULL, NULL, NULL)
INSERT [dbo].[part_tbl] ([id], [part_id], [part_title], [part_content], [part_type], [part_resource], [delete_flag]) VALUES (5, N'part_004                                          ', N'Part IV', N'Short talks
 \n Choose the best answer to each question.
', NULL, NULL, NULL)
INSERT [dbo].[part_tbl] ([id], [part_id], [part_title], [part_content], [part_type], [part_resource], [delete_flag]) VALUES (6, N'part_005                                          ', N'Part V', N'Incomplete Sentences ', NULL, NULL, NULL)
INSERT [dbo].[part_tbl] ([id], [part_id], [part_title], [part_content], [part_type], [part_resource], [delete_flag]) VALUES (7, N'part_006                                          ', N'Part VI', N'Incomplete Texts ', NULL, NULL, NULL)
INSERT [dbo].[part_tbl] ([id], [part_id], [part_title], [part_content], [part_type], [part_resource], [delete_flag]) VALUES (8, N'part_007                                          ', N'Part VII', N'Reading Comprehension ', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[part_tbl] OFF
SET IDENTITY_INSERT [dbo].[question_tbl] ON 

INSERT [dbo].[question_tbl] ([id], [examination_id], [question_id], [question_title], [question_content], [examination_part_id], [question_order], [question_type], [num_correct_answer], [total_num_answer], [resource_id], [notes], [question_code]) VALUES (1, N'exam_001                                          ', N'q_001                                             ', N'1', NULL, NULL, NULL, N'type1                                             ', 1, 4, N'rs_001                                            ', NULL, NULL)
INSERT [dbo].[question_tbl] ([id], [examination_id], [question_id], [question_title], [question_content], [examination_part_id], [question_order], [question_type], [num_correct_answer], [total_num_answer], [resource_id], [notes], [question_code]) VALUES (2, N'exam_001                                          ', N'q_002                                             ', N'2', NULL, NULL, NULL, N'type1                                             ', 1, 4, N'rs_002                                            ', NULL, NULL)
INSERT [dbo].[question_tbl] ([id], [examination_id], [question_id], [question_title], [question_content], [examination_part_id], [question_order], [question_type], [num_correct_answer], [total_num_answer], [resource_id], [notes], [question_code]) VALUES (3, N'exam_001                                          ', N'q_003                                             ', N'3', NULL, NULL, NULL, N'type1                                             ', 1, 4, N'rs_003                                            ', NULL, NULL)
INSERT [dbo].[question_tbl] ([id], [examination_id], [question_id], [question_title], [question_content], [examination_part_id], [question_order], [question_type], [num_correct_answer], [total_num_answer], [resource_id], [notes], [question_code]) VALUES (4, N'exam_001                                          ', N'q_004                                             ', N'4', NULL, NULL, NULL, N'type1                                             ', 1, 4, N'rs_004                                            ', NULL, NULL)
INSERT [dbo].[question_tbl] ([id], [examination_id], [question_id], [question_title], [question_content], [examination_part_id], [question_order], [question_type], [num_correct_answer], [total_num_answer], [resource_id], [notes], [question_code]) VALUES (5, N'exam_001                                          ', N'q_005                                             ', N'5', NULL, NULL, NULL, N'type1                                             ', 1, 4, N'rs_005                                            ', NULL, NULL)
INSERT [dbo].[question_tbl] ([id], [examination_id], [question_id], [question_title], [question_content], [examination_part_id], [question_order], [question_type], [num_correct_answer], [total_num_answer], [resource_id], [notes], [question_code]) VALUES (6, N'exam_001                                          ', N'q_006                                             ', N'6', NULL, NULL, NULL, N'type1                                             ', 1, 3, N'                                                  ', NULL, NULL)
INSERT [dbo].[question_tbl] ([id], [examination_id], [question_id], [question_title], [question_content], [examination_part_id], [question_order], [question_type], [num_correct_answer], [total_num_answer], [resource_id], [notes], [question_code]) VALUES (7, N'exam_001                                          ', N'q_007                                             ', N'7', NULL, NULL, NULL, N'type1                                             ', 1, 3, N'                                                  ', NULL, NULL)
INSERT [dbo].[question_tbl] ([id], [examination_id], [question_id], [question_title], [question_content], [examination_part_id], [question_order], [question_type], [num_correct_answer], [total_num_answer], [resource_id], [notes], [question_code]) VALUES (8, N'exam_001                                          ', N'q_008                                             ', N'8', NULL, NULL, NULL, N'type1                                             ', 1, 3, N'                                                  ', NULL, NULL)
INSERT [dbo].[question_tbl] ([id], [examination_id], [question_id], [question_title], [question_content], [examination_part_id], [question_order], [question_type], [num_correct_answer], [total_num_answer], [resource_id], [notes], [question_code]) VALUES (9, N'exam_001                                          ', N'q_009                                             ', N'9', NULL, NULL, NULL, N'type1                                             ', 1, 3, N'                                                  ', NULL, NULL)
INSERT [dbo].[question_tbl] ([id], [examination_id], [question_id], [question_title], [question_content], [examination_part_id], [question_order], [question_type], [num_correct_answer], [total_num_answer], [resource_id], [notes], [question_code]) VALUES (10, N'exam_001                                          ', N'q_010                                             ', N'10', N'Why did Lisa quit her old job?', NULL, NULL, N'type1                                             ', 1, 4, N'                                                  ', NULL, NULL)
INSERT [dbo].[question_tbl] ([id], [examination_id], [question_id], [question_title], [question_content], [examination_part_id], [question_order], [question_type], [num_correct_answer], [total_num_answer], [resource_id], [notes], [question_code]) VALUES (11, N'exam_001                                          ', N'q_011                                             ', N'11', N'When did she apply for a job?', NULL, NULL, N'type1                                             ', 1, 4, NULL, NULL, NULL)
INSERT [dbo].[question_tbl] ([id], [examination_id], [question_id], [question_title], [question_content], [examination_part_id], [question_order], [question_type], [num_correct_answer], [total_num_answer], [resource_id], [notes], [question_code]) VALUES (12, N'exam_001                                          ', N'q_012                                             ', N'12', N'What is true about Lisa’s new job?', NULL, NULL, N'type1                                             ', 1, 4, NULL, NULL, NULL)
INSERT [dbo].[question_tbl] ([id], [examination_id], [question_id], [question_title], [question_content], [examination_part_id], [question_order], [question_type], [num_correct_answer], [total_num_answer], [resource_id], [notes], [question_code]) VALUES (13, N'exam_001                                          ', N'q_013                                             ', N'13', N'What does the man want to do?', NULL, NULL, N'type1                                             ', 1, 4, NULL, NULL, NULL)
INSERT [dbo].[question_tbl] ([id], [examination_id], [question_id], [question_title], [question_content], [examination_part_id], [question_order], [question_type], [num_correct_answer], [total_num_answer], [resource_id], [notes], [question_code]) VALUES (14, N'exam_001                                          ', N'q_014                                             ', N'14', N'Why can’t Jean go with Steve?', NULL, NULL, N'type1                                             ', 1, 4, NULL, NULL, NULL)
INSERT [dbo].[question_tbl] ([id], [examination_id], [question_id], [question_title], [question_content], [examination_part_id], [question_order], [question_type], [num_correct_answer], [total_num_answer], [resource_id], [notes], [question_code]) VALUES (15, N'exam_001                                          ', N'q_015                                             ', N'15', N'What is true about Steve?', NULL, NULL, N'type1                                             ', 1, 4, NULL, NULL, NULL)
INSERT [dbo].[question_tbl] ([id], [examination_id], [question_id], [question_title], [question_content], [examination_part_id], [question_order], [question_type], [num_correct_answer], [total_num_answer], [resource_id], [notes], [question_code]) VALUES (16, N'exam_001                                          ', N'q_016                                             ', N'16', N'Swing shift jobs are during what ties of the day?', NULL, NULL, N'type1                                             ', 1, 4, N'                                                  ', NULL, NULL)
INSERT [dbo].[question_tbl] ([id], [examination_id], [question_id], [question_title], [question_content], [examination_part_id], [question_order], [question_type], [num_correct_answer], [total_num_answer], [resource_id], [notes], [question_code]) VALUES (17, N'exam_001                                          ', N'q_017                                             ', N'17', N'When do people on graveyard shifts usually work?', NULL, NULL, N'type1                                             ', 1, 4, NULL, NULL, NULL)
INSERT [dbo].[question_tbl] ([id], [examination_id], [question_id], [question_title], [question_content], [examination_part_id], [question_order], [question_type], [num_correct_answer], [total_num_answer], [resource_id], [notes], [question_code]) VALUES (18, N'exam_001                                          ', N'q_018                                             ', N'18', N'What is flex-time?', NULL, NULL, N'type1                                             ', 1, 4, NULL, NULL, NULL)
INSERT [dbo].[question_tbl] ([id], [examination_id], [question_id], [question_title], [question_content], [examination_part_id], [question_order], [question_type], [num_correct_answer], [total_num_answer], [resource_id], [notes], [question_code]) VALUES (19, N'exam_001                                          ', N'q_019                                             ', N'19', N'How many hours a day did the person work in his old?', NULL, NULL, N'type1                                             ', 1, 4, NULL, NULL, NULL)
INSERT [dbo].[question_tbl] ([id], [examination_id], [question_id], [question_title], [question_content], [examination_part_id], [question_order], [question_type], [num_correct_answer], [total_num_answer], [resource_id], [notes], [question_code]) VALUES (20, N'exam_001                                          ', N'q_020                                             ', N'20', N'What kinds of benefits does his new job have?', NULL, NULL, N'type1                                             ', 1, 4, NULL, NULL, NULL)
INSERT [dbo].[question_tbl] ([id], [examination_id], [question_id], [question_title], [question_content], [examination_part_id], [question_order], [question_type], [num_correct_answer], [total_num_answer], [resource_id], [notes], [question_code]) VALUES (21, N'exam_001                                          ', N'q_021                                             ', N'21', N'How does the man save money on gasoline?', NULL, NULL, N'type1                                             ', 1, 4, NULL, NULL, NULL)
INSERT [dbo].[question_tbl] ([id], [examination_id], [question_id], [question_title], [question_content], [examination_part_id], [question_order], [question_type], [num_correct_answer], [total_num_answer], [resource_id], [notes], [question_code]) VALUES (22, N'exam_001                                          ', N'q_022                                             ', N'22', N'Johnny continued to make ……………., though he was told not to.', NULL, NULL, N'type1                                             ', 1, 4, N'                                                  ', NULL, NULL)
INSERT [dbo].[question_tbl] ([id], [examination_id], [question_id], [question_title], [question_content], [examination_part_id], [question_order], [question_type], [num_correct_answer], [total_num_answer], [resource_id], [notes], [question_code]) VALUES (23, N'exam_001                                          ', N'q_023                                             ', N'23', N'…………….what to do, he just waited until his father arrived.', NULL, NULL, N'type1                                             ', 1, 4, NULL, NULL, NULL)
INSERT [dbo].[question_tbl] ([id], [examination_id], [question_id], [question_title], [question_content], [examination_part_id], [question_order], [question_type], [num_correct_answer], [total_num_answer], [resource_id], [notes], [question_code]) VALUES (24, N'exam_001                                          ', N'q_024                                             ', N'24', N'He has traveled to Africa before, …………..?', NULL, NULL, N'type1                                             ', 1, 4, NULL, NULL, NULL)
INSERT [dbo].[question_tbl] ([id], [examination_id], [question_id], [question_title], [question_content], [examination_part_id], [question_order], [question_type], [num_correct_answer], [total_num_answer], [resource_id], [notes], [question_code]) VALUES (25, N'exam_001                                          ', N'q_025                                             ', N'25', N'Mike …………..repaired the car.', NULL, NULL, N'type1                                             ', 1, 4, NULL, NULL, NULL)
INSERT [dbo].[question_tbl] ([id], [examination_id], [question_id], [question_title], [question_content], [examination_part_id], [question_order], [question_type], [num_correct_answer], [total_num_answer], [resource_id], [notes], [question_code]) VALUES (26, N'exam_001                                          ', N'q_026                                             ', N'26', N'I’m afraid we……………the day very much.', NULL, NULL, N'type1                                             ', 1, 4, NULL, NULL, NULL)
INSERT [dbo].[question_tbl] ([id], [examination_id], [question_id], [question_title], [question_content], [examination_part_id], [question_order], [question_type], [num_correct_answer], [total_num_answer], [resource_id], [notes], [question_code]) VALUES (27, N'exam_001                                          ', N'q_027                                             ', N'27', N'“Didn’t you ………….the exam?” “No, I did not.”', NULL, NULL, N'type1                                             ', 1, 4, N'                                                  ', NULL, NULL)
INSERT [dbo].[question_tbl] ([id], [examination_id], [question_id], [question_title], [question_content], [examination_part_id], [question_order], [question_type], [num_correct_answer], [total_num_answer], [resource_id], [notes], [question_code]) VALUES (28, N'exam_001                                          ', N'q_028                                             ', N'28', N'I would like you……………go out with him at night.', NULL, NULL, N'type1                                             ', 1, 4, NULL, NULL, NULL)
INSERT [dbo].[question_tbl] ([id], [examination_id], [question_id], [question_title], [question_content], [examination_part_id], [question_order], [question_type], [num_correct_answer], [total_num_answer], [resource_id], [notes], [question_code]) VALUES (29, N'exam_001                                          ', N'q_029                                             ', N'29', N'He may ……………been there before.', NULL, NULL, N'type1                                             ', 1, 4, NULL, NULL, NULL)
INSERT [dbo].[question_tbl] ([id], [examination_id], [question_id], [question_title], [question_content], [examination_part_id], [question_order], [question_type], [num_correct_answer], [total_num_answer], [resource_id], [notes], [question_code]) VALUES (30, N'exam_001                                          ', N'q_030                                             ', N'30', N'My grandfather moves slowly and speaks…………..', NULL, NULL, N'type1                                             ', 1, 4, NULL, NULL, NULL)
INSERT [dbo].[question_tbl] ([id], [examination_id], [question_id], [question_title], [question_content], [examination_part_id], [question_order], [question_type], [num_correct_answer], [total_num_answer], [resource_id], [notes], [question_code]) VALUES (31, N'exam_001                                          ', N'q_031                                             ', N'31', N'Mr. Lee…………….better than he writes.', NULL, NULL, N'type1                                             ', 1, 4, NULL, NULL, NULL)
INSERT [dbo].[question_tbl] ([id], [examination_id], [question_id], [question_title], [question_content], [examination_part_id], [question_order], [question_type], [num_correct_answer], [total_num_answer], [resource_id], [notes], [question_code]) VALUES (32, N'exam_001                                          ', N'q_032                                             ', N'32', N'Roger …………….nor flowers when he was in prison.', NULL, NULL, N'type1                                             ', 1, 4, N'                                                  ', NULL, NULL)
INSERT [dbo].[question_tbl] ([id], [examination_id], [question_id], [question_title], [question_content], [examination_part_id], [question_order], [question_type], [num_correct_answer], [total_num_answer], [resource_id], [notes], [question_code]) VALUES (33, N'exam_001                                          ', N'q_033                                             ', N'33', N'Venus ……………the closest planet to the sun; Mercury is.', NULL, NULL, N'type1                                             ', 1, 4, NULL, NULL, NULL)
INSERT [dbo].[question_tbl] ([id], [examination_id], [question_id], [question_title], [question_content], [examination_part_id], [question_order], [question_type], [num_correct_answer], [total_num_answer], [resource_id], [notes], [question_code]) VALUES (34, N'exam_001                                          ', N'q_034                                             ', N'34', N'On my trip to Italy, I lost a suitcase, broke my glasses, and ……………my flight home.', NULL, NULL, N'type1                                             ', 1, 4, NULL, NULL, NULL)
INSERT [dbo].[question_tbl] ([id], [examination_id], [question_id], [question_title], [question_content], [examination_part_id], [question_order], [question_type], [num_correct_answer], [total_num_answer], [resource_id], [notes], [question_code]) VALUES (35, N'exam_001                                          ', N'q_035                                             ', N'35', N'The children enjoy playing in the sand and ………….in the ocean.', NULL, NULL, N'type1                                             ', 1, 4, NULL, NULL, NULL)
INSERT [dbo].[question_tbl] ([id], [examination_id], [question_id], [question_title], [question_content], [examination_part_id], [question_order], [question_type], [num_correct_answer], [total_num_answer], [resource_id], [notes], [question_code]) VALUES (36, N'exam_001                                          ', N'q_036                                             ', N'36', N'Let’s ……………..the art gallery first, and then have some lunch.', NULL, NULL, N'type1                                             ', 1, 4, NULL, NULL, NULL)
INSERT [dbo].[question_tbl] ([id], [examination_id], [question_id], [question_title], [question_content], [examination_part_id], [question_order], [question_type], [num_correct_answer], [total_num_answer], [resource_id], [notes], [question_code]) VALUES (37, N'exam_001                                          ', N'q_037                                             ', N'37', N'', NULL, NULL, N'type1                                             ', 1, 4, NULL, NULL, NULL)
INSERT [dbo].[question_tbl] ([id], [examination_id], [question_id], [question_title], [question_content], [examination_part_id], [question_order], [question_type], [num_correct_answer], [total_num_answer], [resource_id], [notes], [question_code]) VALUES (38, N'exam_001                                          ', N'q_038                                             ', N'38', N'', NULL, NULL, N'type1                                             ', 1, 4, NULL, NULL, NULL)
INSERT [dbo].[question_tbl] ([id], [examination_id], [question_id], [question_title], [question_content], [examination_part_id], [question_order], [question_type], [num_correct_answer], [total_num_answer], [resource_id], [notes], [question_code]) VALUES (39, N'exam_001                                          ', N'q_039                                             ', N'39', N'', NULL, NULL, N'type1                                             ', 1, 4, NULL, NULL, NULL)
INSERT [dbo].[question_tbl] ([id], [examination_id], [question_id], [question_title], [question_content], [examination_part_id], [question_order], [question_type], [num_correct_answer], [total_num_answer], [resource_id], [notes], [question_code]) VALUES (40, N'exam_001                                          ', N'q_040                                             ', N'40', N'', NULL, NULL, N'type1                                             ', 1, 4, NULL, NULL, NULL)
INSERT [dbo].[question_tbl] ([id], [examination_id], [question_id], [question_title], [question_content], [examination_part_id], [question_order], [question_type], [num_correct_answer], [total_num_answer], [resource_id], [notes], [question_code]) VALUES (41, N'exam_001                                          ', N'q_041                                             ', N'41', N'', NULL, NULL, N'type1                                             ', 1, 4, NULL, NULL, NULL)
INSERT [dbo].[question_tbl] ([id], [examination_id], [question_id], [question_title], [question_content], [examination_part_id], [question_order], [question_type], [num_correct_answer], [total_num_answer], [resource_id], [notes], [question_code]) VALUES (42, N'exam_001                                          ', N'q_042                                             ', N'42', N'', NULL, NULL, N'type1                                             ', 1, 4, NULL, NULL, NULL)
INSERT [dbo].[question_tbl] ([id], [examination_id], [question_id], [question_title], [question_content], [examination_part_id], [question_order], [question_type], [num_correct_answer], [total_num_answer], [resource_id], [notes], [question_code]) VALUES (43, N'exam_001                                          ', N'q_043                                             ', N'43', N'', NULL, NULL, N'type1                                             ', 1, 4, NULL, NULL, NULL)
INSERT [dbo].[question_tbl] ([id], [examination_id], [question_id], [question_title], [question_content], [examination_part_id], [question_order], [question_type], [num_correct_answer], [total_num_answer], [resource_id], [notes], [question_code]) VALUES (44, N'exam_001                                          ', N'q_044                                             ', N'44', N'', NULL, NULL, N'type1                                             ', 1, 4, NULL, NULL, NULL)
INSERT [dbo].[question_tbl] ([id], [examination_id], [question_id], [question_title], [question_content], [examination_part_id], [question_order], [question_type], [num_correct_answer], [total_num_answer], [resource_id], [notes], [question_code]) VALUES (45, N'exam_001                                          ', N'q_045                                             ', N'45', N'', NULL, NULL, N'type1                                             ', 1, 4, NULL, NULL, NULL)
INSERT [dbo].[question_tbl] ([id], [examination_id], [question_id], [question_title], [question_content], [examination_part_id], [question_order], [question_type], [num_correct_answer], [total_num_answer], [resource_id], [notes], [question_code]) VALUES (46, N'exam_001                                          ', N'q_046                                             ', N'46', N'', NULL, NULL, N'type1                                             ', 1, 4, NULL, NULL, NULL)
INSERT [dbo].[question_tbl] ([id], [examination_id], [question_id], [question_title], [question_content], [examination_part_id], [question_order], [question_type], [num_correct_answer], [total_num_answer], [resource_id], [notes], [question_code]) VALUES (47, N'exam_001                                          ', N'q_047                                             ', N'47', N'', NULL, NULL, N'type1                                             ', 1, 4, NULL, NULL, NULL)
INSERT [dbo].[question_tbl] ([id], [examination_id], [question_id], [question_title], [question_content], [examination_part_id], [question_order], [question_type], [num_correct_answer], [total_num_answer], [resource_id], [notes], [question_code]) VALUES (48, N'exam_001                                          ', N'q_048                                             ', N'48', N'', NULL, NULL, N'type1                                             ', 1, 4, NULL, NULL, NULL)
INSERT [dbo].[question_tbl] ([id], [examination_id], [question_id], [question_title], [question_content], [examination_part_id], [question_order], [question_type], [num_correct_answer], [total_num_answer], [resource_id], [notes], [question_code]) VALUES (49, N'exam_001                                          ', N'q_049                                             ', N'49', N'What is the name of the coffee shop?', NULL, NULL, N'type1                                             ', 1, 4, NULL, NULL, NULL)
INSERT [dbo].[question_tbl] ([id], [examination_id], [question_id], [question_title], [question_content], [examination_part_id], [question_order], [question_type], [num_correct_answer], [total_num_answer], [resource_id], [notes], [question_code]) VALUES (50, N'exam_001                                          ', N'q_050                                             ', N'50', N'Coupons will continue to be accepted until when?', NULL, NULL, N'type1                                             ', 1, 4, NULL, NULL, NULL)
INSERT [dbo].[question_tbl] ([id], [examination_id], [question_id], [question_title], [question_content], [examination_part_id], [question_order], [question_type], [num_correct_answer], [total_num_answer], [resource_id], [notes], [question_code]) VALUES (51, N'exam_001                                          ', N'q_051                                             ', N'51', N'What does the coffee shop plan to stop using?', NULL, NULL, N'type1                                             ', 1, 4, NULL, NULL, NULL)
INSERT [dbo].[question_tbl] ([id], [examination_id], [question_id], [question_title], [question_content], [examination_part_id], [question_order], [question_type], [num_correct_answer], [total_num_answer], [resource_id], [notes], [question_code]) VALUES (52, N'exam_001                                          ', N'q_052                                             ', N'52', N'According to this notice, smoking is not allowed in which of the following?', NULL, NULL, N'type1                                             ', 1, 4, NULL, NULL, NULL)
INSERT [dbo].[question_tbl] ([id], [examination_id], [question_id], [question_title], [question_content], [examination_part_id], [question_order], [question_type], [num_correct_answer], [total_num_answer], [resource_id], [notes], [question_code]) VALUES (53, N'exam_001                                          ', N'q_053                                             ', N'53', N'What is the allowed length of time for smoke breaks?', NULL, NULL, N'type1                                             ', 1, 4, NULL, NULL, NULL)
INSERT [dbo].[question_tbl] ([id], [examination_id], [question_id], [question_title], [question_content], [examination_part_id], [question_order], [question_type], [num_correct_answer], [total_num_answer], [resource_id], [notes], [question_code]) VALUES (54, N'exam_001                                          ', N'q_054                                             ', N'54', N'If workers feel that the smoking policy is unfair, whom should they contact?', NULL, NULL, N'type1                                             ', 1, 4, NULL, NULL, NULL)
INSERT [dbo].[question_tbl] ([id], [examination_id], [question_id], [question_title], [question_content], [examination_part_id], [question_order], [question_type], [num_correct_answer], [total_num_answer], [resource_id], [notes], [question_code]) VALUES (55, N'exam_001                                          ', N'q_055                                             ', N'55', N'What will happen next month?', NULL, NULL, N'type1                                             ', 1, 4, NULL, NULL, NULL)
INSERT [dbo].[question_tbl] ([id], [examination_id], [question_id], [question_title], [question_content], [examination_part_id], [question_order], [question_type], [num_correct_answer], [total_num_answer], [resource_id], [notes], [question_code]) VALUES (56, N'exam_001                                          ', N'q_056                                             ', N'56', N'According to the article, what does punctuality mean?', NULL, NULL, N'type1                                             ', 1, 4, NULL, NULL, NULL)
INSERT [dbo].[question_tbl] ([id], [examination_id], [question_id], [question_title], [question_content], [examination_part_id], [question_order], [question_type], [num_correct_answer], [total_num_answer], [resource_id], [notes], [question_code]) VALUES (57, N'exam_001                                          ', N'q_057                                             ', N'57', N'According to this article, what is true about successful people?', NULL, NULL, N'type1                                             ', 1, 4, NULL, NULL, NULL)
INSERT [dbo].[question_tbl] ([id], [examination_id], [question_id], [question_title], [question_content], [examination_part_id], [question_order], [question_type], [num_correct_answer], [total_num_answer], [resource_id], [notes], [question_code]) VALUES (58, N'exam_001                                          ', N'q_058                                             ', N'58', N'What does MYOB mean?', NULL, NULL, N'type1                                             ', 1, 4, NULL, NULL, NULL)
INSERT [dbo].[question_tbl] ([id], [examination_id], [question_id], [question_title], [question_content], [examination_part_id], [question_order], [question_type], [num_correct_answer], [total_num_answer], [resource_id], [notes], [question_code]) VALUES (59, N'exam_001                                          ', N'q_059                                             ', N'59', N'What are the steps of failure?', NULL, NULL, N'type1                                             ', 1, 4, NULL, NULL, NULL)
INSERT [dbo].[question_tbl] ([id], [examination_id], [question_id], [question_title], [question_content], [examination_part_id], [question_order], [question_type], [num_correct_answer], [total_num_answer], [resource_id], [notes], [question_code]) VALUES (60, N'exam_001                                          ', N'q_060                                             ', N'60', N'Which type of category id the theft related to ?', NULL, NULL, N'type1                                             ', 1, 4, NULL, NULL, NULL)
INSERT [dbo].[question_tbl] ([id], [examination_id], [question_id], [question_title], [question_content], [examination_part_id], [question_order], [question_type], [num_correct_answer], [total_num_answer], [resource_id], [notes], [question_code]) VALUES (61, N'exam_001                                          ', N'q_061                                             ', N'61', N'According to the information above, taking which item would most likely be considered theft?', NULL, NULL, N'type1                                             ', 1, 4, NULL, NULL, NULL)
INSERT [dbo].[question_tbl] ([id], [examination_id], [question_id], [question_title], [question_content], [examination_part_id], [question_order], [question_type], [num_correct_answer], [total_num_answer], [resource_id], [notes], [question_code]) VALUES (62, N'exam_001                                          ', N'q_062                                             ', N'62', N'According to the chart, which item are employees likely to take home from work most often?', NULL, NULL, N'type1                                             ', 1, 4, NULL, NULL, NULL)
INSERT [dbo].[question_tbl] ([id], [examination_id], [question_id], [question_title], [question_content], [examination_part_id], [question_order], [question_type], [num_correct_answer], [total_num_answer], [resource_id], [notes], [question_code]) VALUES (63, N'exam_001                                          ', N'q_063                                             ', N'63', N'How many people took part in the survey?', NULL, NULL, N'type1                                             ', 1, 4, NULL, NULL, NULL)
INSERT [dbo].[question_tbl] ([id], [examination_id], [question_id], [question_title], [question_content], [examination_part_id], [question_order], [question_type], [num_correct_answer], [total_num_answer], [resource_id], [notes], [question_code]) VALUES (64, N'exam_001                                          ', N'q_064                                             ', N'64', N'How expensive were the items most worker took home?', NULL, NULL, N'type1                                             ', 1, 4, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[question_tbl] OFF
SET IDENTITY_INSERT [dbo].[resource_link_tbl] ON 

INSERT [dbo].[resource_link_tbl] ([id], [resource_id], [active], [url], [location_type], [url_host_name], [resource_type], [delete_flag]) VALUES (1, N'rs_001                                            ', NULL, N'images/free_test/part1_1.png', NULL, NULL, N'image     ', NULL)
INSERT [dbo].[resource_link_tbl] ([id], [resource_id], [active], [url], [location_type], [url_host_name], [resource_type], [delete_flag]) VALUES (2, N'rs_002                                            ', NULL, N'images/free_test/part1_2.png', NULL, NULL, N'image     ', NULL)
INSERT [dbo].[resource_link_tbl] ([id], [resource_id], [active], [url], [location_type], [url_host_name], [resource_type], [delete_flag]) VALUES (3, N'rs_003                                            ', NULL, N'images/free_test/part1_3.jpg', NULL, NULL, N'image     ', NULL)
INSERT [dbo].[resource_link_tbl] ([id], [resource_id], [active], [url], [location_type], [url_host_name], [resource_type], [delete_flag]) VALUES (4, N'rs_004                                            ', NULL, N'images/free_test/part1_4.jpg', NULL, NULL, N'image     ', NULL)
INSERT [dbo].[resource_link_tbl] ([id], [resource_id], [active], [url], [location_type], [url_host_name], [resource_type], [delete_flag]) VALUES (5, N'rs_005                                            ', NULL, N'images/free_test/part1_5.jpg', NULL, NULL, N'image     ', NULL)
SET IDENTITY_INSERT [dbo].[resource_link_tbl] OFF
SET IDENTITY_INSERT [dbo].[resource_tbl] ON 

INSERT [dbo].[resource_tbl] ([id], [resource_id], [name], [type], [location_type], [delete_flag]) VALUES (1, N'rs_001                                            ', NULL, N'image     ', NULL, NULL)
INSERT [dbo].[resource_tbl] ([id], [resource_id], [name], [type], [location_type], [delete_flag]) VALUES (2, N'rs_002                                            ', NULL, N'image     ', NULL, NULL)
INSERT [dbo].[resource_tbl] ([id], [resource_id], [name], [type], [location_type], [delete_flag]) VALUES (3, N'rs_003                                            ', NULL, N'image     ', NULL, NULL)
INSERT [dbo].[resource_tbl] ([id], [resource_id], [name], [type], [location_type], [delete_flag]) VALUES (4, N'rs_004                                            ', NULL, N'image     ', NULL, NULL)
INSERT [dbo].[resource_tbl] ([id], [resource_id], [name], [type], [location_type], [delete_flag]) VALUES (5, N'rs_005                                            ', NULL, N'image     ', NULL, NULL)
SET IDENTITY_INSERT [dbo].[resource_tbl] OFF
SET IDENTITY_INSERT [dbo].[topic_tbl] ON 

INSERT [dbo].[topic_tbl] ([id], [topic_id], [topic_type], [topic_title], [topic_content], [topic_resource], [delete_flag]) VALUES (1, N'tp_001                                            ', NULL, N'Questions 37-40 refer to the following memo ', N'It will soon be time to file your tax returns. We will not be issuing financial statements automatically to…(1)…….employees as we have done in the past. If you need a statement of your income for the past year, please apply…(2)…….writing to the Accounting office as soon as possible. Please give the accounting office the following information: 
•	Full name
•	Social security number
•	Employee number
•	Company department
•	Home address
We will mail all statements to your home address. If you wish to receive your statement at a different address, please be sure to inform us. Because we anticipate a large response to this memo, we have …(3)……… a deadline of March 15th . You must send your …(4)……..by this date, or we cannot guarantee your statement. 
', NULL, NULL)
INSERT [dbo].[topic_tbl] ([id], [topic_id], [topic_type], [topic_title], [topic_content], [topic_resource], [delete_flag]) VALUES (2, N'tp_002                                            ', NULL, N'Questions 41-44 refer to the following letter ', N'Uxbridge Bank
22 High Street
Uxbridge
January 18th
 

Mr. John Edwards, 

14 Taylor’s Lane 

Uxbridge 

Dear John Edwards, 

Thank you for …(5)…….to Uxbridge Bank last week for an interview. It was a pleasure to meet you and talk with you. I and my colleagues were very impressed with your knowledge and experience. If therefore gives me great …(6)…….to be able to offer you a position. We would like you to start on Thursday February 2nd , for a two day training period. Your full duties would begin on Monday February 6th . If you are …(7)……….in this position, please telephone me on 012-220-772 before 2 p.m. on January 24th . If I have not …(8)……..from you by then, I will assume you are no longer interested. 

I look forward to hearing from you. 

Sincerely, 

Martha Green 

Personnel Manager 
', NULL, NULL)
INSERT [dbo].[topic_tbl] ([id], [topic_id], [topic_type], [topic_title], [topic_content], [topic_resource], [delete_flag]) VALUES (3, N'tp_003                                            ', NULL, N'Questions 45-48 refer to the following memo ', N'To : Molly Green and Alistair Debrett 

From : Health and Safety Department 

Re : First Aid Training 

It has come to our attention that you have not …(9)…..completed a basic first aid training course. All employees must have first aid training …(10)……two years.  

You must attend a training course on March 27th. The course will start at 9 a.m. and will finish at 6 p.m. We will inform your department. You will be paid one hour of overtime because it ……(11)…..later than your regular work hours. If you do not attend the course you will lose one day’s salary. If you really cannot attend on March 27th, you must inform us immediately or it will be too late to change the date. Thank you for your …(12)…….
', NULL, NULL)
INSERT [dbo].[topic_tbl] ([id], [topic_id], [topic_type], [topic_title], [topic_content], [topic_resource], [delete_flag]) VALUES (4, N'tp_004                                            ', NULL, N'Questions 49-51 refer to the following letter ', N'The Orange Cat Coffee Shop
Dear customers, 

Beginning next month, we will no longer be accepting Orange Cat Coffee Coupons. The recent increasing price of coffee beans has made it difficult to keep both the everyday low prices that our customers have come to expect and high quality of our drinks. We have decided not to raise prices. Instead, we will do away with the coupon system. We will continue to accept coupons until the end of the month. 

Thank you for your choosing The Orange Cat. 

Sincerely, 

The Management 
', NULL, NULL)
INSERT [dbo].[topic_tbl] ([id], [topic_id], [topic_type], [topic_title], [topic_content], [topic_resource], [delete_flag]) VALUES (5, N'tp_005                                            ', NULL, N'Questions 52-55 refer to the following notice', N'Notice to All Employees
As part of our “Good Heath” policy, we wish to inform our employees of the new no-smoking policy in the office. In order to create a clean working environment, smoking is no longer allowed in the office break-room or in the restrooms. All offices, of course, remain no smoking areas. The only area in which smoking will be allowed is the new smoking lobby near the parking area. Although this out doors, it is a covered area. Therefore it is possible to use it in all weather conditions. Also, we are not allowing smoke breaks longer than five minutes for every one hour period. This means that smoker may take a five-minute break each hour of work or a ten-minute break every two hours of work. 

We will not be monitoring worker, but we do expect you to stick  to this timing. For a cooperative office atmosphere, we need workers to feel that everyone is working equal hours. As this is the official policy for a company, no exceptions will be allowed. From next month, we will be introducing a bonus system for all employees who give up smoking for more than three months. More information will be given at a later date. If you feel that this policy is somehow unfair or that you are being discriminated against, we encourage you to contact your department’s supervisor. 

Thank you. 
', NULL, NULL)
INSERT [dbo].[topic_tbl] ([id], [topic_id], [topic_type], [topic_title], [topic_content], [topic_resource], [delete_flag]) VALUES (6, N'tp_006                                            ', NULL, N'Questions 56-59 refer to the following article ', N'How Not To Succeed in Your Job
Many magazines have articles on how to be a success, but here at Business Monthly, the Magazine for Busy Businesspeople, we thought it would be helpful it our readers knew how to fail. 

Step One : Don’t come to work on time. If you want to fail at work, then don’t be on time. Punctuality or being where you should when you should, is a common trait or successful people. If you don’t want to succeed, be late for all of your appointments. 

Step Two : Don’t ask questions. Successful people often try to learn what they don’t already know. They ask questions if they are unsure of a situation or a procedure. If you want to fail, make sure you keep your questions to yourself. 

Step Three : never learn new things. In order to get ahead in your career, it is necessary to keep yourself updated on current information in your field. Information changes quickly; if you want to be left behind, then don’t keep up with the changes. 

Step Four : Don’t mind your own business. MYOB, or Mind Your Own Business, means not getting involved in office gossip. If you talk about others behind their backs, then you can expect that others are talking about you as well. So if you want to fail, stick your nose where it does not belong. 
', NULL, NULL)
INSERT [dbo].[topic_tbl] ([id], [topic_id], [topic_type], [topic_title], [topic_content], [topic_resource], [delete_flag]) VALUES (7, N'tp_007                                            ', NULL, N'Questions 60-64 refer to the following graph and article. ', N'Theft at Work : Results of a Survey of 100 Office Workers (Workers aged 25-35)
Source : Survey and Polling Institute of New York
  
Theft at Work 

According to a recent survey, a majority of workers don’t consider taking paper and pens home from work to be stealing. The Survey and Polling Institute of New York interviewed one hundred office workers aged 25-35. All of the workers had been at there current place of employment for at least 2 years. All workers were working full time. “ I don’t steal. I’m not a theft”, says one man who has been working for his company for five years. “ Sometimes I take office supplies home…but that is different from stealing”. He said that he usually gave paper and pens to his children for school homework. “ I work hard for this company, and I think the office supplies are a perk of the job. Anyway, I often use the pens to do extra work at home, too. 

Do I really need do buy pens just to do company work at home? I don’t think so”. According to the chart above, only 8 percent of people think that taking pens and pencils from work is stealing. This means that 92 percent don’t think of it as theft. In the same group, only 20 percent said that taking desktop items like staplers and memo holders was stealing. 80 percent did not consider it wrong. However, 90 percent said that taking computer accessories like a mouse or a keyboard was wrong. They said that taking cheap items was OK. This 90 percent or workers said they often took items that cost less than $5, but anything that cost more than $10 was too expensive. 10 percent didn’t see a problem with it. 
', NULL, NULL)
SET IDENTITY_INSERT [dbo].[topic_tbl] OFF
SET IDENTITY_INSERT [dbo].[user_tbl] ON 

INSERT [dbo].[user_tbl] ([id], [user_code], [user_type], [first_name], [last_name], [full_name], [nick_name], [birthday], [gender], [country_name], [country_code], [marital_status], [address1], [address2], [tel1], [tel2], [email1], [email2], [referral_code], [instructor_code], [join_date], [avatar_path], [status], [account_status], [user_name], [password], [active], [role_code], [create_date], [update_date], [delete_flag]) VALUES (1, NULL, NULL, N'Thanh', N'Nguyen', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'nhatthanh510@gmail.com                            ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'nhatthanh510@gmail.com                            ', N'1234                ', NULL, NULL, N'20160529:125308                                   ', N'20160529:125308                                   ', NULL)
INSERT [dbo].[user_tbl] ([id], [user_code], [user_type], [first_name], [last_name], [full_name], [nick_name], [birthday], [gender], [country_name], [country_code], [marital_status], [address1], [address2], [tel1], [tel2], [email1], [email2], [referral_code], [instructor_code], [join_date], [avatar_path], [status], [account_status], [user_name], [password], [active], [role_code], [create_date], [update_date], [delete_flag]) VALUES (2, NULL, NULL, N'Thanh', N'Tran', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'tmthanh92@gmail.com                               ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'tmthanh92@gmail.com                               ', N'8237980             ', NULL, NULL, N'20160612:200542                                   ', N'20160612:200542                                   ', 0)
SET IDENTITY_INSERT [dbo].[user_tbl] OFF
