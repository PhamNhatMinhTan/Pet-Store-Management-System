USE [master]
GO
/****** Object:  Database [PetStore]    Script Date: 3/7/2020 6:11:25 PM ******/
CREATE DATABASE [PetStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PetStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\PetStore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PetStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\PetStore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PetStore] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PetStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PetStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PetStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PetStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PetStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PetStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [PetStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PetStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PetStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PetStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PetStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PetStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PetStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PetStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PetStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PetStore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PetStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PetStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PetStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PetStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PetStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PetStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PetStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PetStore] SET RECOVERY FULL 
GO
ALTER DATABASE [PetStore] SET  MULTI_USER 
GO
ALTER DATABASE [PetStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PetStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PetStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PetStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PetStore] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'PetStore', N'ON'
GO
ALTER DATABASE [PetStore] SET QUERY_STORE = OFF
GO
USE [PetStore]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/7/2020 6:11:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[ac_id] [int] IDENTITY(1,1) NOT NULL,
	[ac_userName] [nvarchar](100) NOT NULL,
	[ac_pwd] [nvarchar](64) NOT NULL,
	[ac_status] [nvarchar](15) NULL,
	[r_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ac_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 3/7/2020 6:11:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[b_id] [int] IDENTITY(1,1) NOT NULL,
	[b_purchaseDate] [datetime] NULL,
	[b_status] [nvarchar](15) NULL,
	[u_id] [int] NULL,
	[g_id] [nvarchar](50) NULL,
	[b_address] [nvarchar](150) NULL,
	[b_total] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[b_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BillDetail]    Script Date: 3/7/2020 6:11:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillDetail](
	[bd_id] [int] IDENTITY(1,1) NOT NULL,
	[b_id] [int] NULL,
	[p_id] [nvarchar](50) NULL,
	[pt_id] [nvarchar](50) NULL,
	[pf_id] [nvarchar](50) NULL,
	[pa_id] [nvarchar](50) NULL,
	[pm_id] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[bd_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 3/7/2020 6:11:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[c_id] [int] IDENTITY(1,1) NOT NULL,
	[u_id] [int] NULL,
	[pt_id] [nvarchar](50) NULL,
	[pf_id] [nvarchar](50) NULL,
	[pa_id] [nvarchar](50) NULL,
	[pm_id] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[c_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 3/7/2020 6:11:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[cmt_id] [int] IDENTITY(1,1) NOT NULL,
	[cmt_content] [ntext] NULL,
	[cmt_published] [datetime] NULL,
	[cmt_status] [nvarchar](15) NULL,
	[p_id] [nvarchar](50) NULL,
	[u_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[cmt_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CommentDetail]    Script Date: 3/7/2020 6:11:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommentDetail](
	[cmt_id] [int] NULL,
	[cmtd_id] [int] IDENTITY(1,1) NOT NULL,
	[cmtd_content] [ntext] NULL,
	[cmtd_published] [datetime] NULL,
	[cmtd_status] [nvarchar](15) NULL,
	[u_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[cmtd_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gift]    Script Date: 3/7/2020 6:11:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gift](
	[g_id] [nvarchar](50) NOT NULL,
	[g_name] [nvarchar](150) NULL,
	[g_image] [nvarchar](250) NULL,
	[g_status] [nvarchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[g_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Origin]    Script Date: 3/7/2020 6:11:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Origin](
	[org_id] [int] IDENTITY(1,1) NOT NULL,
	[org_name] [nvarchar](150) NOT NULL,
	[org_status] [nvarchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[org_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pet]    Script Date: 3/7/2020 6:11:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pet](
	[p_id] [nvarchar](50) NOT NULL,
	[p_name] [nvarchar](150) NOT NULL,
	[p_prices] [int] NOT NULL,
	[p_salePrice] [int] NOT NULL,
	[p_image] [nvarchar](250) NULL,
	[p_description] [nvarchar](500) NULL,
	[p_published] [datetime] NULL,
	[p_status] [nvarchar](15) NULL,
	[t_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[p_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PetAccessories]    Script Date: 3/7/2020 6:11:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PetAccessories](
	[pa_id] [nvarchar](50) NOT NULL,
	[pa_name] [nvarchar](150) NOT NULL,
	[pa_prices] [int] NOT NULL,
	[pa_salePrice] [int] NOT NULL,
	[pa_material] [nvarchar](100) NULL,
	[pa_amount] [int] NULL,
	[pa_published] [datetime] NULL,
	[pa_status] [nvarchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[pa_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PetFood]    Script Date: 3/7/2020 6:11:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PetFood](
	[pf_id] [nvarchar](50) NOT NULL,
	[pf_name] [nvarchar](150) NOT NULL,
	[pf_image] [nvarchar](250) NULL,
	[pf_prices] [int] NULL,
	[pf_salePrice] [int] NULL,
	[pf_amount] [int] NULL,
	[pf_status] [nvarchar](15) NULL,
	[t_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[pf_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PetMedicine]    Script Date: 3/7/2020 6:11:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PetMedicine](
	[pm_id] [nvarchar](50) NOT NULL,
	[pm_name] [nvarchar](150) NOT NULL,
	[pm_image] [nvarchar](250) NULL,
	[pm_prices] [int] NULL,
	[pm_salePrice] [int] NULL,
	[pm_amount] [int] NULL,
	[pm_description] [nvarchar](500) NULL,
	[pm_status] [nvarchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[pm_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PetToys]    Script Date: 3/7/2020 6:11:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PetToys](
	[pt_id] [nvarchar](50) NOT NULL,
	[pt_name] [nvarchar](150) NOT NULL,
	[pt_image] [nvarchar](250) NOT NULL,
	[pt_prices] [int] NULL,
	[pt_salePrice] [int] NULL,
	[pt_amount] [int] NULL,
	[pt_description] [nvarchar](500) NULL,
	[pt_published] [datetime] NULL,
	[pt_status] [nvarchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[pt_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 3/7/2020 6:11:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[r_id] [int] NOT NULL,
	[r_name] [nvarchar](150) NOT NULL,
	[r_status] [nvarchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[r_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type]    Script Date: 3/7/2020 6:11:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[t_id] [int] IDENTITY(1,1) NOT NULL,
	[t_name] [nvarchar](150) NOT NULL,
	[t_status] [nvarchar](15) NULL,
	[org_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[t_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 3/7/2020 6:11:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[u_id] [int] IDENTITY(1,1) NOT NULL,
	[u_name] [nvarchar](150) NOT NULL,
	[u_gender] [varchar](15) NULL,
	[u_email] [nvarchar](250) NULL,
	[u_phone] [varchar](15) NULL,
	[u_address] [nvarchar](200) NULL,
	[u_status] [nvarchar](15) NULL,
	[ac_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[u_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD FOREIGN KEY([r_id])
REFERENCES [dbo].[Role] ([r_id])
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD FOREIGN KEY([g_id])
REFERENCES [dbo].[Gift] ([g_id])
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD FOREIGN KEY([u_id])
REFERENCES [dbo].[User] ([u_id])
GO
ALTER TABLE [dbo].[BillDetail]  WITH CHECK ADD FOREIGN KEY([pa_id])
REFERENCES [dbo].[PetAccessories] ([pa_id])
GO
ALTER TABLE [dbo].[BillDetail]  WITH CHECK ADD FOREIGN KEY([pf_id])
REFERENCES [dbo].[PetFood] ([pf_id])
GO
ALTER TABLE [dbo].[BillDetail]  WITH CHECK ADD FOREIGN KEY([pm_id])
REFERENCES [dbo].[PetMedicine] ([pm_id])
GO
ALTER TABLE [dbo].[BillDetail]  WITH CHECK ADD FOREIGN KEY([pt_id])
REFERENCES [dbo].[PetToys] ([pt_id])
GO
ALTER TABLE [dbo].[BillDetail]  WITH CHECK ADD FOREIGN KEY([b_id])
REFERENCES [dbo].[Bill] ([b_id])
GO
ALTER TABLE [dbo].[BillDetail]  WITH CHECK ADD FOREIGN KEY([p_id])
REFERENCES [dbo].[Pet] ([p_id])
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([pa_id])
REFERENCES [dbo].[PetAccessories] ([pa_id])
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([pf_id])
REFERENCES [dbo].[PetFood] ([pf_id])
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([pm_id])
REFERENCES [dbo].[PetMedicine] ([pm_id])
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([pt_id])
REFERENCES [dbo].[PetToys] ([pt_id])
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([u_id])
REFERENCES [dbo].[User] ([u_id])
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([p_id])
REFERENCES [dbo].[Pet] ([p_id])
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([u_id])
REFERENCES [dbo].[User] ([u_id])
GO
ALTER TABLE [dbo].[CommentDetail]  WITH CHECK ADD FOREIGN KEY([cmt_id])
REFERENCES [dbo].[Comment] ([cmt_id])
GO
ALTER TABLE [dbo].[CommentDetail]  WITH CHECK ADD FOREIGN KEY([u_id])
REFERENCES [dbo].[User] ([u_id])
GO
ALTER TABLE [dbo].[Pet]  WITH CHECK ADD FOREIGN KEY([t_id])
REFERENCES [dbo].[Type] ([t_id])
GO
ALTER TABLE [dbo].[PetFood]  WITH CHECK ADD FOREIGN KEY([t_id])
REFERENCES [dbo].[Type] ([t_id])
GO
ALTER TABLE [dbo].[Type]  WITH CHECK ADD FOREIGN KEY([org_id])
REFERENCES [dbo].[Origin] ([org_id])
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([ac_id])
REFERENCES [dbo].[Account] ([ac_id])
GO
USE [master]
GO
ALTER DATABASE [PetStore] SET  READ_WRITE 
GO
