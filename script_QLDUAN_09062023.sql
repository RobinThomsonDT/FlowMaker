USE [master]
GO
/****** Object:  Database [QLDUAN]    Script Date: 09/06/2023 16:24:48 ******/
CREATE DATABASE [QLDUAN]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLDUAN', FILENAME = N'E:\DATABASE\QLDUAN.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLDUAN_log', FILENAME = N'E:\DATABASE\QLDUAN_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [QLDUAN] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLDUAN].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLDUAN] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLDUAN] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLDUAN] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLDUAN] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLDUAN] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLDUAN] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLDUAN] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [QLDUAN] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLDUAN] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLDUAN] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLDUAN] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLDUAN] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLDUAN] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLDUAN] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLDUAN] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLDUAN] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QLDUAN] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLDUAN] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLDUAN] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLDUAN] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLDUAN] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLDUAN] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLDUAN] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLDUAN] SET RECOVERY FULL 
GO
ALTER DATABASE [QLDUAN] SET  MULTI_USER 
GO
ALTER DATABASE [QLDUAN] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLDUAN] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLDUAN] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLDUAN] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'QLDUAN', N'ON'
GO
USE [QLDUAN]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 09/06/2023 16:24:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Comment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[CreatedDate] [datetime] NULL,
	[UserID] [varchar](20) NULL,
	[TaskID] [varchar](20) NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Link]    Script Date: 09/06/2023 16:24:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Link](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SourceTaskID] [varchar](20) NULL,
	[TargetTaskID] [varchar](20) NULL,
	[Type] [varchar](1) NULL,
 CONSTRAINT [PK_Link] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Note]    Script Date: 09/06/2023 16:24:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Note](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) NULL,
	[Description] [nvarchar](500) NULL,
	[CreatedDate] [datetime] NULL,
	[UserID] [varchar](20) NULL,
	[Notify] [bit] NULL,
	[NotifyDate] [datetime] NULL,
 CONSTRAINT [PK_Note] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Project]    Script Date: 09/06/2023 16:24:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Project](
	[ID] [varchar](20) NOT NULL,
	[ProjectName] [nvarchar](200) NULL,
	[Quantity] [int] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Description] [nvarchar](500) NULL,
	[Owner] [varchar](20) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Role]    Script Date: 09/06/2023 16:24:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Role](
	[ID] [varchar](20) NOT NULL,
	[Name] [nvarchar](200) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Task]    Script Date: 09/06/2023 16:24:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Task](
	[ID] [varchar](20) NOT NULL,
	[TaskName] [nvarchar](200) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Duration] [int] NULL,
	[Description] [nvarchar](500) NULL,
	[Status] [int] NULL,
	[ProjectID] [varchar](20) NULL,
	[ParentID] [varchar](20) NULL,
	[Progress] [float] NULL,
	[SortOrder] [int] NULL,
	[rowID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Task] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ToDo]    Script Date: 09/06/2023 16:24:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ToDo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) NULL,
	[Date] [date] NULL,
	[HourWork] [int] NULL,
	[Description] [nvarchar](500) NULL,
	[Status] [int] NULL,
	[UserID] [varchar](20) NULL,
	[TaskID] [varchar](20) NULL,
	[FinishTask] [bit] NULL,
 CONSTRAINT [PK_ToDo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 09/06/2023 16:24:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[ID] [varchar](20) NOT NULL,
	[FullName] [nvarchar](200) NULL,
	[Birthday] [date] NULL,
	[Sex] [nvarchar](100) NULL,
	[Address] [nvarchar](200) NULL,
	[Phone] [varchar](20) NULL,
	[Email] [varchar](200) NULL,
	[UserName] [varchar](20) NULL,
	[Password] [varchar](20) NULL,
	[CreatedDate] [datetime] NULL,
	[Description] [nvarchar](200) NULL,
	[RoleID] [varchar](20) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserProject]    Script Date: 09/06/2023 16:24:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserProject](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProjectID] [varchar](20) NULL,
	[UserID] [varchar](20) NULL,
	[JoinDate] [datetime] NULL,
	[isLeader] [bit] NULL,
	[Classification] [nvarchar](200) NULL,
	[ClassificationDate] [datetime] NULL,
 CONSTRAINT [PK_UserProject] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserTask]    Script Date: 09/06/2023 16:24:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserTask](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TaskID] [varchar](20) NULL,
	[UserID] [varchar](20) NULL,
	[JoinDate] [datetime] NULL,
	[isLeader] [bit] NULL,
	[Classification] [nvarchar](200) NULL,
	[ClassificationDate] [datetime] NULL,
 CONSTRAINT [PK_UserTask] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([ID], [Description], [CreatedDate], [UserID], [TaskID]) VALUES (1, N'Good', CAST(0x0000B01900EA5835 AS DateTime), N'NV001', N'p004_t.2')
INSERT [dbo].[Comment] ([ID], [Description], [CreatedDate], [UserID], [TaskID]) VALUES (2, N'Review test 1', CAST(0x0000B01900EA9DF6 AS DateTime), N'NV001', N'p004_t.2')
SET IDENTITY_INSERT [dbo].[Comment] OFF
SET IDENTITY_INSERT [dbo].[Link] ON 

INSERT [dbo].[Link] ([ID], [SourceTaskID], [TargetTaskID], [Type]) VALUES (2, N'P001_T.12', N'P001_T.10', N'0')
SET IDENTITY_INSERT [dbo].[Link] OFF
SET IDENTITY_INSERT [dbo].[Note] ON 

INSERT [dbo].[Note] ([ID], [Title], [Description], [CreatedDate], [UserID], [Notify], [NotifyDate]) VALUES (1, N'Note 01', N'Ghi chú note 01', CAST(0x0000B00600000000 AS DateTime), N'NV001', 0, NULL)
INSERT [dbo].[Note] ([ID], [Title], [Description], [CreatedDate], [UserID], [Notify], [NotifyDate]) VALUES (2, N'Note 002', N'Ghi chú note 002', CAST(0x0000B01B00B4BF66 AS DateTime), N'NV001', 1, CAST(0x0000B01D009450C0 AS DateTime))
SET IDENTITY_INSERT [dbo].[Note] OFF
INSERT [dbo].[Project] ([ID], [ProjectName], [Quantity], [StartDate], [EndDate], [Description], [Owner], [Status]) VALUES (N'P001', N'Dự án phần mềm kế toán', 1, CAST(0x0000AFE100000000 AS DateTime), CAST(0x0000B0D500000000 AS DateTime), N'Dự án trọng điểm', NULL, 0)
INSERT [dbo].[Project] ([ID], [ProjectName], [Quantity], [StartDate], [EndDate], [Description], [Owner], [Status]) VALUES (N'p002', N'Project name 02', 1, CAST(0x0000B00A00000000 AS DateTime), CAST(0x0000B01200000000 AS DateTime), N'Ghi chú cập nhật project 02', NULL, 0)
INSERT [dbo].[Project] ([ID], [ProjectName], [Quantity], [StartDate], [EndDate], [Description], [Owner], [Status]) VALUES (N'P003', N'Project số 003', 1, CAST(0x0000B01300000000 AS DateTime), CAST(0x0000B03200000000 AS DateTime), N'', N'NV001', 1)
INSERT [dbo].[Project] ([ID], [ProjectName], [Quantity], [StartDate], [EndDate], [Description], [Owner], [Status]) VALUES (N'P004', N'Project số 004', 2, CAST(0x0000AFF500000000 AS DateTime), CAST(0x0000B01400000000 AS DateTime), N'', N'NV002', 1)
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'ADMIN', N'Admin')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (N'USER', N'User')
SET IDENTITY_INSERT [dbo].[Task] ON 

INSERT [dbo].[Task] ([ID], [TaskName], [StartDate], [EndDate], [Duration], [Description], [Status], [ProjectID], [ParentID], [Progress], [SortOrder], [rowID]) VALUES (N'P001_T.1', N'P001 - Task 1', CAST(0x0000B00A00000000 AS DateTime), NULL, 1, NULL, NULL, N'P001', NULL, 0, 0, 9)
INSERT [dbo].[Task] ([ID], [TaskName], [StartDate], [EndDate], [Duration], [Description], [Status], [ProjectID], [ParentID], [Progress], [SortOrder], [rowID]) VALUES (N'P001_T.10', N'P001 - Task 2', CAST(0x0000B00E00000000 AS DateTime), NULL, 2, NULL, NULL, N'P001', NULL, 0, 0, 10)
INSERT [dbo].[Task] ([ID], [TaskName], [StartDate], [EndDate], [Duration], [Description], [Status], [ProjectID], [ParentID], [Progress], [SortOrder], [rowID]) VALUES (N'P001_T.11', N'P001 - Task 1.1', CAST(0x0000B00B00000000 AS DateTime), CAST(0x0000B00C00000000 AS DateTime), 1, N'', 0, N'P001', N'P001_T.1', 0, 0, 11)
INSERT [dbo].[Task] ([ID], [TaskName], [StartDate], [EndDate], [Duration], [Description], [Status], [ProjectID], [ParentID], [Progress], [SortOrder], [rowID]) VALUES (N'P001_T.12', N'P001 - Task 1.2', CAST(0x0000B00B00000000 AS DateTime), NULL, 1, NULL, 0, N'P001', N'P001_T.1', 0, 0, 12)
INSERT [dbo].[Task] ([ID], [TaskName], [StartDate], [EndDate], [Duration], [Description], [Status], [ProjectID], [ParentID], [Progress], [SortOrder], [rowID]) VALUES (N'p002_T.13', N'New task', CAST(0x0000B01200000000 AS DateTime), NULL, 1, NULL, 0, N'p002', NULL, 0, 0, 13)
INSERT [dbo].[Task] ([ID], [TaskName], [StartDate], [EndDate], [Duration], [Description], [Status], [ProjectID], [ParentID], [Progress], [SortOrder], [rowID]) VALUES (N'P003_T.14', N'P003.Task1', CAST(0x0000B01200000000 AS DateTime), NULL, 1, NULL, 0, N'P003', NULL, 0, 0, 14)
INSERT [dbo].[Task] ([ID], [TaskName], [StartDate], [EndDate], [Duration], [Description], [Status], [ProjectID], [ParentID], [Progress], [SortOrder], [rowID]) VALUES (N'P004_T.15', N'P004.Task1', CAST(0x0000B01200000000 AS DateTime), NULL, 1, NULL, 0, N'P004', NULL, 0, 0, 15)
INSERT [dbo].[Task] ([ID], [TaskName], [StartDate], [EndDate], [Duration], [Description], [Status], [ProjectID], [ParentID], [Progress], [SortOrder], [rowID]) VALUES (N'p004_t.2', N'P004.Task2', CAST(0x0000B01300000000 AS DateTime), CAST(0x0000B01A00000000 AS DateTime), NULL, N'', 1, N'P004', NULL, NULL, NULL, 16)
SET IDENTITY_INSERT [dbo].[Task] OFF
SET IDENTITY_INSERT [dbo].[ToDo] ON 

INSERT [dbo].[ToDo] ([ID], [Title], [Date], [HourWork], [Description], [Status], [UserID], [TaskID], [FinishTask]) VALUES (4, N'ToDo number 1', CAST(0x73450B00 AS Date), 8, N'Thiết kế cơ sở dữ liệu', NULL, N'NV001', N'P004_T.15', 0)
INSERT [dbo].[ToDo] ([ID], [Title], [Date], [HourWork], [Description], [Status], [UserID], [TaskID], [FinishTask]) VALUES (5, N'ToDo number 2', CAST(0x74450B00 AS Date), 8, N'Xây dựng database', NULL, N'NV001', N'p004_t.2', 0)
INSERT [dbo].[ToDo] ([ID], [Title], [Date], [HourWork], [Description], [Status], [UserID], [TaskID], [FinishTask]) VALUES (6, N'ToDo number 3', CAST(0x76450B00 AS Date), 8, N'Design database', NULL, N'NV001', N'p004_t.2', 0)
SET IDENTITY_INSERT [dbo].[ToDo] OFF
INSERT [dbo].[User] ([ID], [FullName], [Birthday], [Sex], [Address], [Phone], [Email], [UserName], [Password], [CreatedDate], [Description], [RoleID]) VALUES (N'Admin', N'Administrator', NULL, NULL, NULL, NULL, N'admin@gmail.com', N'ADMIN', N'123', NULL, NULL, N'ADMIN')
INSERT [dbo].[User] ([ID], [FullName], [Birthday], [Sex], [Address], [Phone], [Email], [UserName], [Password], [CreatedDate], [Description], [RoleID]) VALUES (N'DFGDF', N'DFGD', NULL, N'Nam', NULL, NULL, N'dfgdfg@gmail.com', N'dfgdf', N'dfgds', CAST(0x0000B00B01069A21 AS DateTime), NULL, N'USER')
INSERT [dbo].[User] ([ID], [FullName], [Birthday], [Sex], [Address], [Phone], [Email], [UserName], [Password], [CreatedDate], [Description], [RoleID]) VALUES (N'NV001', N'Nguyễn Văn A', CAST(0x30170B00 AS Date), N'Nam', N'TP. HCM', N'111111111', N'nv0001@gmail.com', NULL, N'123', CAST(0x0000B00500F9E25B AS DateTime), N'Test ghi chú.', N'USER')
INSERT [dbo].[User] ([ID], [FullName], [Birthday], [Sex], [Address], [Phone], [Email], [UserName], [Password], [CreatedDate], [Description], [RoleID]) VALUES (N'NV002', N'LÊ THỊ B', CAST(0xBD180B00 AS Date), N'Nữ', N'HÀ NỘI', N'222222222', N'nv002@gmail.com', N'NV002', N'123', NULL, NULL, N'USER')
INSERT [dbo].[User] ([ID], [FullName], [Birthday], [Sex], [Address], [Phone], [Email], [UserName], [Password], [CreatedDate], [Description], [RoleID]) VALUES (N'nv004', N'Nhân viên 004', NULL, N'Nữ', N'Long An', N'4444444444', N'nv004@gmail.com', N'nv004', N'123', CAST(0x0000B00A016F1ECB AS DateTime), N'Ghi chú 004.', N'USER')
INSERT [dbo].[User] ([ID], [FullName], [Birthday], [Sex], [Address], [Phone], [Email], [UserName], [Password], [CreatedDate], [Description], [RoleID]) VALUES (N'NV005', N'NHÂN VIÊN 006', CAST(0x972C0B00 AS Date), N'Nữ', N'Đà Nẵng', N'6666666', N'nv006@gmail.com', N'nv005', N'123', CAST(0x0000B00B0108CD19 AS DateTime), NULL, N'USER')
INSERT [dbo].[User] ([ID], [FullName], [Birthday], [Sex], [Address], [Phone], [Email], [UserName], [Password], [CreatedDate], [Description], [RoleID]) VALUES (N'NV007', N'NHÂN VIÊN 006', CAST(0xEC1B0100 AS Date), N'Nam', NULL, NULL, N'nv006@gmail.com', N'nv007', N'123', CAST(0x0000B00B01097C7F AS DateTime), NULL, N'USER')
SET IDENTITY_INSERT [dbo].[UserProject] ON 

INSERT [dbo].[UserProject] ([ID], [ProjectID], [UserID], [JoinDate], [isLeader], [Classification], [ClassificationDate]) VALUES (3, N'p002', N'NV001', CAST(0x0000B00C00B249B6 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[UserProject] ([ID], [ProjectID], [UserID], [JoinDate], [isLeader], [Classification], [ClassificationDate]) VALUES (4, N'P001', N'nv004', CAST(0x0000B00C00CAC527 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[UserProject] ([ID], [ProjectID], [UserID], [JoinDate], [isLeader], [Classification], [ClassificationDate]) VALUES (5, N'P003', N'NV001', CAST(0x0000B013008B67B7 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[UserProject] ([ID], [ProjectID], [UserID], [JoinDate], [isLeader], [Classification], [ClassificationDate]) VALUES (8, N'P004', N'NV001', CAST(0x0000B01300A6C83B AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[UserProject] ([ID], [ProjectID], [UserID], [JoinDate], [isLeader], [Classification], [ClassificationDate]) VALUES (9, N'P004', N'NV002', CAST(0x0000B01300A6C83B AS DateTime), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[UserProject] OFF
SET IDENTITY_INSERT [dbo].[UserTask] ON 

INSERT [dbo].[UserTask] ([ID], [TaskID], [UserID], [JoinDate], [isLeader], [Classification], [ClassificationDate]) VALUES (10, N'P001_T.11', N'NV001', CAST(0x0000B013009B42DE AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[UserTask] ([ID], [TaskID], [UserID], [JoinDate], [isLeader], [Classification], [ClassificationDate]) VALUES (11, N'P001_T.11', N'NV002', CAST(0x0000B013009B42DE AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[UserTask] ([ID], [TaskID], [UserID], [JoinDate], [isLeader], [Classification], [ClassificationDate]) VALUES (12, N'P004_T.15', N'NV001', CAST(0x0000B013009450C0 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[UserTask] ([ID], [TaskID], [UserID], [JoinDate], [isLeader], [Classification], [ClassificationDate]) VALUES (13, N'p004_t.2', N'NV001', CAST(0x0000B01300C393B6 AS DateTime), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[UserTask] OFF
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Task] FOREIGN KEY([TaskID])
REFERENCES [dbo].[Task] ([ID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Task]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_User]
GO
ALTER TABLE [dbo].[Link]  WITH CHECK ADD  CONSTRAINT [FK_Link_Task] FOREIGN KEY([SourceTaskID])
REFERENCES [dbo].[Task] ([ID])
GO
ALTER TABLE [dbo].[Link] CHECK CONSTRAINT [FK_Link_Task]
GO
ALTER TABLE [dbo].[Link]  WITH CHECK ADD  CONSTRAINT [FK_Link_Task1] FOREIGN KEY([TargetTaskID])
REFERENCES [dbo].[Task] ([ID])
GO
ALTER TABLE [dbo].[Link] CHECK CONSTRAINT [FK_Link_Task1]
GO
ALTER TABLE [dbo].[Note]  WITH CHECK ADD  CONSTRAINT [FK_Note_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Note] CHECK CONSTRAINT [FK_Note_User]
GO
ALTER TABLE [dbo].[Project]  WITH CHECK ADD  CONSTRAINT [FK_Project_User] FOREIGN KEY([Owner])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Project] CHECK CONSTRAINT [FK_Project_User]
GO
ALTER TABLE [dbo].[Task]  WITH CHECK ADD  CONSTRAINT [FK_Task_Project] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Project] ([ID])
GO
ALTER TABLE [dbo].[Task] CHECK CONSTRAINT [FK_Task_Project]
GO
ALTER TABLE [dbo].[ToDo]  WITH CHECK ADD  CONSTRAINT [FK_ToDo_Task] FOREIGN KEY([TaskID])
REFERENCES [dbo].[Task] ([ID])
GO
ALTER TABLE [dbo].[ToDo] CHECK CONSTRAINT [FK_ToDo_Task]
GO
ALTER TABLE [dbo].[ToDo]  WITH CHECK ADD  CONSTRAINT [FK_ToDo_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[ToDo] CHECK CONSTRAINT [FK_ToDo_User]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([ID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
ALTER TABLE [dbo].[UserProject]  WITH CHECK ADD  CONSTRAINT [FK_UserProject_Project] FOREIGN KEY([ProjectID])
REFERENCES [dbo].[Project] ([ID])
GO
ALTER TABLE [dbo].[UserProject] CHECK CONSTRAINT [FK_UserProject_Project]
GO
ALTER TABLE [dbo].[UserProject]  WITH CHECK ADD  CONSTRAINT [FK_UserProject_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[UserProject] CHECK CONSTRAINT [FK_UserProject_User]
GO
ALTER TABLE [dbo].[UserTask]  WITH CHECK ADD  CONSTRAINT [FK_UserTask_Task] FOREIGN KEY([TaskID])
REFERENCES [dbo].[Task] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserTask] CHECK CONSTRAINT [FK_UserTask_Task]
GO
ALTER TABLE [dbo].[UserTask]  WITH CHECK ADD  CONSTRAINT [FK_UserTask_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[UserTask] CHECK CONSTRAINT [FK_UserTask_User]
GO
USE [master]
GO
ALTER DATABASE [QLDUAN] SET  READ_WRITE 
GO
