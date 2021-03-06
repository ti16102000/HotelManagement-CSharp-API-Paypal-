USE [master]
GO
/****** Object:  Database [HotelAPIManagement]    Script Date: 22-Apr-20 12:42:46 AM ******/
CREATE DATABASE [HotelAPIManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HotelAPIManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\HotelAPIManagement.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'HotelAPIManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\HotelAPIManagement_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [HotelAPIManagement] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HotelAPIManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HotelAPIManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HotelAPIManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HotelAPIManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HotelAPIManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HotelAPIManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [HotelAPIManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HotelAPIManagement] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [HotelAPIManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HotelAPIManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HotelAPIManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HotelAPIManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HotelAPIManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HotelAPIManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HotelAPIManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HotelAPIManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HotelAPIManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HotelAPIManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HotelAPIManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HotelAPIManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HotelAPIManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HotelAPIManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HotelAPIManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HotelAPIManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HotelAPIManagement] SET RECOVERY FULL 
GO
ALTER DATABASE [HotelAPIManagement] SET  MULTI_USER 
GO
ALTER DATABASE [HotelAPIManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HotelAPIManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HotelAPIManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HotelAPIManagement] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [HotelAPIManagement]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 22-Apr-20 12:42:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Booking](
	[IDBooking] [int] IDENTITY(1,1) NOT NULL,
	[IDCus] [int] NOT NULL,
	[IDCateRoom] [int] NOT NULL,
	[NumberRoom] [int] NOT NULL,
	[DateIn] [date] NOT NULL,
	[DateOut] [date] NOT NULL,
	[DurationStay] [int] NOT NULL,
	[DayCreateBooking] [datetime] NOT NULL,
	[NewBooking] [bit] NOT NULL,
	[TokenBooking] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Booking] PRIMARY KEY CLUSTERED 
(
	[IDBooking] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CategoryRoom]    Script Date: 22-Apr-20 12:42:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryRoom](
	[IDCateRoom] [int] IDENTITY(1,1) NOT NULL,
	[NameCateRoom] [nvarchar](50) NOT NULL,
	[PriceCateRoom] [int] NOT NULL,
 CONSTRAINT [PK_CategoryRoom] PRIMARY KEY CLUSTERED 
(
	[IDCateRoom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CategoryService]    Script Date: 22-Apr-20 12:42:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryService](
	[IDCateSer] [int] IDENTITY(1,1) NOT NULL,
	[NameCateSer] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CategoryService] PRIMARY KEY CLUSTERED 
(
	[IDCateSer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customer]    Script Date: 22-Apr-20 12:42:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[IDCus] [int] IDENTITY(1,1) NOT NULL,
	[NameCus] [nvarchar](50) NOT NULL,
	[PhoneCus] [nvarchar](20) NOT NULL,
	[EmailCus] [nvarchar](50) NOT NULL,
	[AddressCus] [nvarchar](50) NOT NULL,
	[DayCreateCus] [datetime] NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[IDCus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HistoryBooking]    Script Date: 22-Apr-20 12:42:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistoryBooking](
	[IDHisBook] [int] IDENTITY(1,1) NOT NULL,
	[IDBook] [int] NOT NULL,
	[NameHisBook] [nvarchar](300) NOT NULL,
	[DayCreateHisBook] [datetime] NOT NULL,
 CONSTRAINT [PK_HistoryBooking] PRIMARY KEY CLUSTERED 
(
	[IDHisBook] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 22-Apr-20 12:42:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[IDOrdD] [int] IDENTITY(1,1) NOT NULL,
	[IDOrd] [int] NOT NULL,
	[NameService] [nvarchar](50) NOT NULL,
	[Quantity] [int] NOT NULL,
	[PriceOrdD] [int] NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[DayCreateOrdD] [datetime] NOT NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[IDOrdD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderService]    Script Date: 22-Apr-20 12:42:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderService](
	[IDOrd] [int] IDENTITY(1,1) NOT NULL,
	[IDBooking] [int] NOT NULL,
	[Total] [decimal](18, 2) NOT NULL,
	[Payment] [bit] NULL,
 CONSTRAINT [PK_OrderService] PRIMARY KEY CLUSTERED 
(
	[IDOrd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Room]    Script Date: 22-Apr-20 12:42:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[IDRoom] [int] IDENTITY(1,1) NOT NULL,
	[NameRoom] [nvarchar](50) NOT NULL,
	[IDCateRoom] [int] NOT NULL,
	[Empty] [bit] NOT NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[IDRoom] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RoomBooking]    Script Date: 22-Apr-20 12:42:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomBooking](
	[IDRoomBook] [int] IDENTITY(1,1) NOT NULL,
	[IDBook] [int] NOT NULL,
	[IDRoom] [int] NOT NULL,
 CONSTRAINT [PK_RoomBooking] PRIMARY KEY CLUSTERED 
(
	[IDRoomBook] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Service]    Script Date: 22-Apr-20 12:42:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[IDService] [int] IDENTITY(1,1) NOT NULL,
	[NameService] [nvarchar](50) NOT NULL,
	[PriceService] [int] NOT NULL,
	[IDCateSer] [int] NOT NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[IDService] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_CategoryRoom] FOREIGN KEY([IDCateRoom])
REFERENCES [dbo].[CategoryRoom] ([IDCateRoom])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_CategoryRoom]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_Customer] FOREIGN KEY([IDCus])
REFERENCES [dbo].[Customer] ([IDCus])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_Customer]
GO
ALTER TABLE [dbo].[HistoryBooking]  WITH CHECK ADD  CONSTRAINT [FK_HistoryBooking_Booking] FOREIGN KEY([IDBook])
REFERENCES [dbo].[Booking] ([IDBooking])
GO
ALTER TABLE [dbo].[HistoryBooking] CHECK CONSTRAINT [FK_HistoryBooking_Booking]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_OrderService] FOREIGN KEY([IDOrd])
REFERENCES [dbo].[OrderService] ([IDOrd])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_OrderService]
GO
ALTER TABLE [dbo].[OrderService]  WITH CHECK ADD  CONSTRAINT [FK_OrderService_Booking] FOREIGN KEY([IDBooking])
REFERENCES [dbo].[Booking] ([IDBooking])
GO
ALTER TABLE [dbo].[OrderService] CHECK CONSTRAINT [FK_OrderService_Booking]
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [FK_Room_CategoryRoom] FOREIGN KEY([IDCateRoom])
REFERENCES [dbo].[CategoryRoom] ([IDCateRoom])
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [FK_Room_CategoryRoom]
GO
ALTER TABLE [dbo].[RoomBooking]  WITH CHECK ADD  CONSTRAINT [FK_RoomBooking_Booking] FOREIGN KEY([IDBook])
REFERENCES [dbo].[Booking] ([IDBooking])
GO
ALTER TABLE [dbo].[RoomBooking] CHECK CONSTRAINT [FK_RoomBooking_Booking]
GO
ALTER TABLE [dbo].[RoomBooking]  WITH CHECK ADD  CONSTRAINT [FK_RoomBooking_Room] FOREIGN KEY([IDRoom])
REFERENCES [dbo].[Room] ([IDRoom])
GO
ALTER TABLE [dbo].[RoomBooking] CHECK CONSTRAINT [FK_RoomBooking_Room]
GO
ALTER TABLE [dbo].[Service]  WITH CHECK ADD  CONSTRAINT [FK_Service_CategoryService] FOREIGN KEY([IDCateSer])
REFERENCES [dbo].[CategoryService] ([IDCateSer])
GO
ALTER TABLE [dbo].[Service] CHECK CONSTRAINT [FK_Service_CategoryService]
GO
USE [master]
GO
ALTER DATABASE [HotelAPIManagement] SET  READ_WRITE 
GO
