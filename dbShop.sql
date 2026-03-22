USE [master]
GO
/****** Object:  Database [OnlineShopDB]    Script Date: 3/23/2026 1:16:00 AM ******/
CREATE DATABASE [OnlineShopDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OnlineShopDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\OnlineShopDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OnlineShopDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\OnlineShopDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [OnlineShopDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OnlineShopDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OnlineShopDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OnlineShopDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OnlineShopDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OnlineShopDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OnlineShopDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [OnlineShopDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OnlineShopDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OnlineShopDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OnlineShopDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OnlineShopDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OnlineShopDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OnlineShopDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OnlineShopDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OnlineShopDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OnlineShopDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [OnlineShopDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OnlineShopDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OnlineShopDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OnlineShopDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OnlineShopDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OnlineShopDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OnlineShopDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OnlineShopDB] SET RECOVERY FULL 
GO
ALTER DATABASE [OnlineShopDB] SET  MULTI_USER 
GO
ALTER DATABASE [OnlineShopDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OnlineShopDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OnlineShopDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OnlineShopDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OnlineShopDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [OnlineShopDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'OnlineShopDB', N'ON'
GO
ALTER DATABASE [OnlineShopDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [OnlineShopDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [OnlineShopDB]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 3/23/2026 1:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[description] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 3/23/2026 1:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[phone] [nvarchar](20) NULL,
	[address] [nvarchar](255) NULL,
	[email] [nvarchar](100) NULL,
	[is_active] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 3/23/2026 1:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[product_id] [int] NULL,
	[quantity] [int] NULL,
	[price] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 3/23/2026 1:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[customer_id] [int] NULL,
	[order_date] [date] NULL,
	[total_price] [float] NULL,
	[status] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 3/23/2026 1:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[price] [float] NULL,
	[quantity] [int] NULL,
	[category_id] [int] NULL,
	[supplier_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 3/23/2026 1:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[phone] [nvarchar](20) NULL,
	[address] [nvarchar](255) NULL,
	[email] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/23/2026 1:16:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NULL,
	[password] [varchar](32) NULL,
	[email] [nvarchar](100) NULL,
	[role] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([id], [name], [description]) VALUES (1, N'Phone', N'Mobile phones')
INSERT [dbo].[Categories] ([id], [name], [description]) VALUES (2, N'Laptop', N'Computers')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([id], [name], [phone], [address], [email], [is_active]) VALUES (1, N'John', N'0901', N'HCM', N'john@gmail.com', 1)
INSERT [dbo].[Customers] ([id], [name], [phone], [address], [email], [is_active]) VALUES (2, N'Anna', N'0902', N'HN', N'anna@gmail.com', 1)
INSERT [dbo].[Customers] ([id], [name], [phone], [address], [email], [is_active]) VALUES (3, N'Nhật Cường', N'012345678', N'Hậu Giang', N'cuong@gmail.com', 1)
INSERT [dbo].[Customers] ([id], [name], [phone], [address], [email], [is_active]) VALUES (4, N'Trung Kiên', N'012345777', N'An Giang', N'kien@gmail.com', 1)
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [quantity], [price]) VALUES (1, 1, 1, 1, 1200)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [quantity], [price]) VALUES (2, 1, 3, 1, 1000)
INSERT [dbo].[OrderDetails] ([id], [order_id], [product_id], [quantity], [price]) VALUES (3, 2, 2, 1, 1000)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([id], [customer_id], [order_date], [total_price], [status]) VALUES (1, 1, CAST(N'2026-03-01' AS Date), 2200, N'Completed')
INSERT [dbo].[Orders] ([id], [customer_id], [order_date], [total_price], [status]) VALUES (2, 2, CAST(N'2026-03-02' AS Date), 1000, N'Pending')
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([id], [name], [price], [quantity], [category_id], [supplier_id]) VALUES (1, N'iPhone 15', 1200, 10, 1, 1)
INSERT [dbo].[Products] ([id], [name], [price], [quantity], [category_id], [supplier_id]) VALUES (2, N'Samsung S23', 1000, 15, 1, 2)
INSERT [dbo].[Products] ([id], [name], [price], [quantity], [category_id], [supplier_id]) VALUES (3, N'MacBook Air', 1500, 5, 2, 1)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Suppliers] ON 

INSERT [dbo].[Suppliers] ([id], [name], [phone], [address], [email]) VALUES (1, N'Apple', N'0901', N'USA', N'apple@gmail.com')
INSERT [dbo].[Suppliers] ([id], [name], [phone], [address], [email]) VALUES (2, N'Samsung', N'0902', N'Korea', N'ss@gmail.com')
INSERT [dbo].[Suppliers] ([id], [name], [phone], [address], [email]) VALUES (3, N'Tiến Thương', N'0907648667', N'Cần Thơ', N'thuongn@gmail.com')
SET IDENTITY_INSERT [dbo].[Suppliers] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id], [username], [password], [email], [role]) VALUES (1, N'thuong', N'698d51a19d8a121ce581499d7b701668', N'thuongnt.ce191329@gmail.com', N'Admin')
INSERT [dbo].[Users] ([id], [username], [password], [email], [role]) VALUES (2, N'tankhanh', N'202cb962ac59075b964b07152d234b70', N'thecloud747@gmail.com', N'Staff')
INSERT [dbo].[Users] ([id], [username], [password], [email], [role]) VALUES (3, N'kieutrinh', N'202CB962AC59075B964B07152D234B70', N'trinhltk.ce190422@gmail.com', N'Staff')
INSERT [dbo].[Users] ([id], [username], [password], [email], [role]) VALUES (5, N'mytruyen', N'202cb962ac59075b964b07152d234b70', N'truyen@gmail.com', N'Staff')
INSERT [dbo].[Users] ([id], [username], [password], [email], [role]) VALUES (6, N'anhngoc', N'202cb962ac59075b964b07152d234b70', N'ngoc@gmail.com', N'Staff')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__F3DBC5727CC1711B]    Script Date: 3/23/2026 1:16:01 AM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Customers] ADD  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[Customers] ([id])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[Categories] ([id])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([supplier_id])
REFERENCES [dbo].[Suppliers] ([id])
GO
USE [master]
GO
ALTER DATABASE [OnlineShopDB] SET  READ_WRITE 
GO
