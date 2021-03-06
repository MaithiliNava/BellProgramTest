USE [master]
GO
/****** Object:  Database [BellFieldService]    Script Date: 2020-10-30 11:25:16 PM ******/
CREATE DATABASE [BellFieldService]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BellFieldService', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BellFieldService.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BellFieldService_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BellFieldService_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BellFieldService] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BellFieldService].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BellFieldService] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BellFieldService] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BellFieldService] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BellFieldService] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BellFieldService] SET ARITHABORT OFF 
GO
ALTER DATABASE [BellFieldService] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BellFieldService] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BellFieldService] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BellFieldService] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BellFieldService] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BellFieldService] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BellFieldService] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BellFieldService] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BellFieldService] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BellFieldService] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BellFieldService] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BellFieldService] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BellFieldService] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BellFieldService] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BellFieldService] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BellFieldService] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BellFieldService] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BellFieldService] SET RECOVERY FULL 
GO
ALTER DATABASE [BellFieldService] SET  MULTI_USER 
GO
ALTER DATABASE [BellFieldService] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BellFieldService] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BellFieldService] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BellFieldService] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BellFieldService] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BellFieldService', N'ON'
GO
ALTER DATABASE [BellFieldService] SET QUERY_STORE = OFF
GO
USE [BellFieldService]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 2020-10-30 11:25:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DeptId] [int] IDENTITY(1,1) NOT NULL,
	[DeptName] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DeptId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 2020-10-30 11:25:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeId] [int] NOT NULL,
	[DeptId] [int] NOT NULL,
	[EmpName] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Projects]    Script Date: 2020-10-30 11:25:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projects](
	[ProjectId] [int] IDENTITY(1,1) NOT NULL,
	[ProjectName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Projects] PRIMARY KEY CLUSTERED 
(
	[ProjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 2020-10-30 11:25:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticket](
	[TicketId] [int] IDENTITY(1,1) NOT NULL,
	[ProjectId] [int] NOT NULL,
	[DeptId] [int] NOT NULL,
	[EmpIoyeeId] [int] NOT NULL,
	[Description] [varchar](max) NOT NULL,
	[Received] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_Ticket] PRIMARY KEY CLUSTERED 
(
	[TicketId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([DeptId], [DeptName]) VALUES (1, N'Branch of Extranet Implementation
')
INSERT [dbo].[Department] ([DeptId], [DeptName]) VALUES (2, N'Branch of Intranet Computer Maintenance and E-Commerce PC Programming
')
INSERT [dbo].[Department] ([DeptId], [DeptName]) VALUES (3, N'Bureau of Business-Oriented PC Backup and Wireless Telecommunications Control
')
INSERT [dbo].[Department] ([DeptId], [DeptName]) VALUES (4, N'Database Programming Branch
')
INSERT [dbo].[Department] ([DeptId], [DeptName]) VALUES (5, N'Division of Application Security
')
INSERT [dbo].[Department] ([DeptId], [DeptName]) VALUES (6, N'Division of Telecommunications Extranet Development
')
INSERT [dbo].[Department] ([DeptId], [DeptName]) VALUES (7, N'Extranet Multimedia Connectivity and Security Division
')
INSERT [dbo].[Department] ([DeptId], [DeptName]) VALUES (8, N'Hardware Backup Department
')
INSERT [dbo].[Department] ([DeptId], [DeptName]) VALUES (9, N'Mainframe PC Development and Practical Source Code Acquisition Team
')
INSERT [dbo].[Department] ([DeptId], [DeptName]) VALUES (10, N'Multimedia Troubleshooting and Maintenance Team
')
INSERT [dbo].[Department] ([DeptId], [DeptName]) VALUES (11, N'Network Maintenance and Multimedia Implementation Committee
')
INSERT [dbo].[Department] ([DeptId], [DeptName]) VALUES (12, N'Office of Statistical Data Connectivity
')
INSERT [dbo].[Department] ([DeptId], [DeptName]) VALUES (13, N'PC Maintenance Department
')
INSERT [dbo].[Department] ([DeptId], [DeptName]) VALUES (14, N'Software Technology and Networking Department
')
INSERT [dbo].[Department] ([DeptId], [DeptName]) VALUES (15, N'Wireless Extranet Backup Team
')
SET IDENTITY_INSERT [dbo].[Department] OFF
INSERT [dbo].[Employee] ([EmployeeId], [DeptId], [EmpName]) VALUES (1, 1, N'Kelvin Lahr')
INSERT [dbo].[Employee] ([EmployeeId], [DeptId], [EmpName]) VALUES (2, 1, N'Idella Dallman')
INSERT [dbo].[Employee] ([EmployeeId], [DeptId], [EmpName]) VALUES (3, 2, N'Mellie Lombard')
INSERT [dbo].[Employee] ([EmployeeId], [DeptId], [EmpName]) VALUES (4, 2, N'Shawna Hood')
INSERT [dbo].[Employee] ([EmployeeId], [DeptId], [EmpName]) VALUES (5, 2, N'Kenneth Bowie')
INSERT [dbo].[Employee] ([EmployeeId], [DeptId], [EmpName]) VALUES (6, 3, N'Greta Quigg')
INSERT [dbo].[Employee] ([EmployeeId], [DeptId], [EmpName]) VALUES (7, 4, N'Dalila Vickrey')
INSERT [dbo].[Employee] ([EmployeeId], [DeptId], [EmpName]) VALUES (8, 4, N'Marcelo Paris')
INSERT [dbo].[Employee] ([EmployeeId], [DeptId], [EmpName]) VALUES (9, 4, N'Tomoko Gale')
INSERT [dbo].[Employee] ([EmployeeId], [DeptId], [EmpName]) VALUES (10, 5, N'Rosalia Ayoub')
INSERT [dbo].[Employee] ([EmployeeId], [DeptId], [EmpName]) VALUES (11, 5, N'Olympia Vien')
INSERT [dbo].[Employee] ([EmployeeId], [DeptId], [EmpName]) VALUES (12, 6, N'Roma Marcell')
INSERT [dbo].[Employee] ([EmployeeId], [DeptId], [EmpName]) VALUES (13, 6, N'Janelle Newberg')
INSERT [dbo].[Employee] ([EmployeeId], [DeptId], [EmpName]) VALUES (14, 6, N'Linh Leitzel')
INSERT [dbo].[Employee] ([EmployeeId], [DeptId], [EmpName]) VALUES (15, 6, N'Alissa Perlman')
INSERT [dbo].[Employee] ([EmployeeId], [DeptId], [EmpName]) VALUES (16, 7, N'Hugo Wess')
INSERT [dbo].[Employee] ([EmployeeId], [DeptId], [EmpName]) VALUES (17, 7, N'Leola Thornburg')
INSERT [dbo].[Employee] ([EmployeeId], [DeptId], [EmpName]) VALUES (18, 7, N'Delorse Searle')
INSERT [dbo].[Employee] ([EmployeeId], [DeptId], [EmpName]) VALUES (19, 7, N'Thresa Levins')
INSERT [dbo].[Employee] ([EmployeeId], [DeptId], [EmpName]) VALUES (20, 8, N'Farah Eldridge')
INSERT [dbo].[Employee] ([EmployeeId], [DeptId], [EmpName]) VALUES (21, 8, N'Lana Montes')
INSERT [dbo].[Employee] ([EmployeeId], [DeptId], [EmpName]) VALUES (22, 8, N'Claudine Valderrama')
INSERT [dbo].[Employee] ([EmployeeId], [DeptId], [EmpName]) VALUES (23, 8, N'Altha Rudisill')
INSERT [dbo].[Employee] ([EmployeeId], [DeptId], [EmpName]) VALUES (24, 8, N'Colton Kranz')
INSERT [dbo].[Employee] ([EmployeeId], [DeptId], [EmpName]) VALUES (25, 9, N'Luciano Riddell')
INSERT [dbo].[Employee] ([EmployeeId], [DeptId], [EmpName]) VALUES (26, 10, N'Ione Tomlin')
INSERT [dbo].[Employee] ([EmployeeId], [DeptId], [EmpName]) VALUES (27, 10, N'Hilario Masterson')
INSERT [dbo].[Employee] ([EmployeeId], [DeptId], [EmpName]) VALUES (28, 10, N'Sage Bow')
INSERT [dbo].[Employee] ([EmployeeId], [DeptId], [EmpName]) VALUES (29, 10, N'Kasie Barclay')
INSERT [dbo].[Employee] ([EmployeeId], [DeptId], [EmpName]) VALUES (30, 11, N'Wilfredo Stumpf')
INSERT [dbo].[Employee] ([EmployeeId], [DeptId], [EmpName]) VALUES (31, 11, N'Boyce Perales')
INSERT [dbo].[Employee] ([EmployeeId], [DeptId], [EmpName]) VALUES (32, 11, N'Latoyia Kremer')
INSERT [dbo].[Employee] ([EmployeeId], [DeptId], [EmpName]) VALUES (33, 11, N'Katheryn Lepak')
INSERT [dbo].[Employee] ([EmployeeId], [DeptId], [EmpName]) VALUES (34, 12, N'Keren Gillespi')
INSERT [dbo].[Employee] ([EmployeeId], [DeptId], [EmpName]) VALUES (35, 12, N'Alexandra Brendle')
INSERT [dbo].[Employee] ([EmployeeId], [DeptId], [EmpName]) VALUES (36, 13, N'Olene Pyron')
INSERT [dbo].[Employee] ([EmployeeId], [DeptId], [EmpName]) VALUES (37, 14, N'Diego Hasbrouck')
INSERT [dbo].[Employee] ([EmployeeId], [DeptId], [EmpName]) VALUES (38, 15, N'Reita Abshire')
INSERT [dbo].[Employee] ([EmployeeId], [DeptId], [EmpName]) VALUES (39, 15, N'Janice Skipper')
INSERT [dbo].[Employee] ([EmployeeId], [DeptId], [EmpName]) VALUES (40, 15, N'Tawna Blackmore')
SET IDENTITY_INSERT [dbo].[Projects] ON 

INSERT [dbo].[Projects] ([ProjectId], [ProjectName]) VALUES (1, N'Project A')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName]) VALUES (2, N'Project B')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName]) VALUES (3, N'Project C')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName]) VALUES (4, N'Project D')
INSERT [dbo].[Projects] ([ProjectId], [ProjectName]) VALUES (5, N'Project E')
SET IDENTITY_INSERT [dbo].[Projects] OFF
SET IDENTITY_INSERT [dbo].[Ticket] ON 

INSERT [dbo].[Ticket] ([TicketId], [ProjectId], [DeptId], [EmpIoyeeId], [Description], [Received]) VALUES (17, 2, 7, 18, N'testing....', CAST(N'2020-10-29T12:41:00' AS SmallDateTime))
INSERT [dbo].[Ticket] ([TicketId], [ProjectId], [DeptId], [EmpIoyeeId], [Description], [Received]) VALUES (18, 1, 7, 18, N'eqerwetreeytryu', CAST(N'2020-10-29T12:47:00' AS SmallDateTime))
INSERT [dbo].[Ticket] ([TicketId], [ProjectId], [DeptId], [EmpIoyeeId], [Description], [Received]) VALUES (20, 1, 2, 3, N'very bad Intranet', CAST(N'2020-10-29T17:48:00' AS SmallDateTime))
INSERT [dbo].[Ticket] ([TicketId], [ProjectId], [DeptId], [EmpIoyeeId], [Description], [Received]) VALUES (21, 4, 5, 11, N'Security risk', CAST(N'2020-10-30T12:00:00' AS SmallDateTime))
INSERT [dbo].[Ticket] ([TicketId], [ProjectId], [DeptId], [EmpIoyeeId], [Description], [Received]) VALUES (22, 5, 8, 20, N'Backup issue long time', CAST(N'2020-10-30T12:01:00' AS SmallDateTime))
INSERT [dbo].[Ticket] ([TicketId], [ProjectId], [DeptId], [EmpIoyeeId], [Description], [Received]) VALUES (23, 1, 2, 4, N'Intranet issue......................', CAST(N'2020-10-30T14:35:00' AS SmallDateTime))
INSERT [dbo].[Ticket] ([TicketId], [ProjectId], [DeptId], [EmpIoyeeId], [Description], [Received]) VALUES (24, 4, 4, 7, N'Backed up not done', CAST(N'2020-10-30T14:42:00' AS SmallDateTime))
INSERT [dbo].[Ticket] ([TicketId], [ProjectId], [DeptId], [EmpIoyeeId], [Description], [Received]) VALUES (25, 4, 6, 12, N'Testing telecommunication extranet', CAST(N'2020-10-30T15:01:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[Ticket] OFF
ALTER TABLE [dbo].[Ticket] ADD  CONSTRAINT [DF_Ticket_Received]  DEFAULT (getdate()) FOR [Received]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Department] FOREIGN KEY([DeptId])
REFERENCES [dbo].[Department] ([DeptId])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Department]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_Department] FOREIGN KEY([DeptId])
REFERENCES [dbo].[Department] ([DeptId])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_Department]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_Employee] FOREIGN KEY([EmpIoyeeId])
REFERENCES [dbo].[Employee] ([EmployeeId])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_Employee]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_Projects] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Projects] ([ProjectId])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_Projects]
GO
USE [master]
GO
ALTER DATABASE [BellFieldService] SET  READ_WRITE 
GO
