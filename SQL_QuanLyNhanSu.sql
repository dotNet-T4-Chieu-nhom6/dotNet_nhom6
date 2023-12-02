USE [master]
GO
/****** Object:  Database [QuanLyNhanSu]    Script Date: 12/2/2023 11:48:38 PM ******/
CREATE DATABASE [QuanLyNhanSu]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyNhanSu', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\QuanLyNhanSu.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QuanLyNhanSu_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\QuanLyNhanSu_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [QuanLyNhanSu] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyNhanSu].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyNhanSu] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyNhanSu] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyNhanSu] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyNhanSu] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyNhanSu] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyNhanSu] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuanLyNhanSu] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyNhanSu] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyNhanSu] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyNhanSu] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyNhanSu] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyNhanSu] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyNhanSu] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyNhanSu] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyNhanSu] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QuanLyNhanSu] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyNhanSu] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyNhanSu] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyNhanSu] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyNhanSu] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyNhanSu] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyNhanSu] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyNhanSu] SET RECOVERY FULL 
GO
ALTER DATABASE [QuanLyNhanSu] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyNhanSu] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyNhanSu] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyNhanSu] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyNhanSu] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QuanLyNhanSu] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QuanLyNhanSu] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'QuanLyNhanSu', N'ON'
GO
ALTER DATABASE [QuanLyNhanSu] SET QUERY_STORE = ON
GO
ALTER DATABASE [QuanLyNhanSu] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [QuanLyNhanSu]
GO
/****** Object:  Table [dbo].[HopDong]    Script Date: 12/2/2023 11:48:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HopDong](
	[idhd] [varchar](200) NOT NULL,
	[idnv] [int] NULL,
	[loaihd] [nvarchar](100) NULL,
	[chucvu] [nvarchar](100) NULL,
	[tenphongban] [nvarchar](100) NULL,
	[trangthai] [nvarchar](100) NULL,
	[phucap] [money] NULL,
	[luongHD] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[idhd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 12/2/2023 11:48:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[idnv] [int] IDENTITY(1,1) NOT NULL,
	[tennv] [nvarchar](200) NULL,
	[ngaysinh] [datetime] NULL,
	[gioitinh] [nvarchar](100) NULL,
	[diachi] [nvarchar](max) NULL,
	[email] [varchar](100) NULL,
	[didong] [varchar](100) NULL,
	[vanhoa] [nvarchar](100) NULL,
	[chuyenmon] [nvarchar](100) NULL,
	[idphongban] [int] NULL,
	[luong] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[idnv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhongBan]    Script Date: 12/2/2023 11:48:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhongBan](
	[idphongban] [int] IDENTITY(1,1) NOT NULL,
	[tenphongban] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[idphongban] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12/2/2023 11:48:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[idU] [int] IDENTITY(1,1) NOT NULL,
	[nameU] [varchar](100) NULL,
	[passU] [varchar](100) NULL,
	[emailU] [varchar](100) NULL,
	[phanquyen] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[idU] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[HopDong] ([idhd], [idnv], [loaihd], [chucvu], [tenphongban], [trangthai], [phucap], [luongHD]) VALUES (N'786786', NULL, N'kinh doanh', N'Kế toán', NULL, N'đã nghỉ', 200000.0000, 5000000.0000)
INSERT [dbo].[HopDong] ([idhd], [idnv], [loaihd], [chucvu], [tenphongban], [trangthai], [phucap], [luongHD]) VALUES (N'987654', NULL, N'kinh doanh', N'Kế toán', NULL, N'đi làm đầy đủ', 200000.0000, 5000000.0000)
GO
SET IDENTITY_INSERT [dbo].[NhanVien] ON 

INSERT [dbo].[NhanVien] ([idnv], [tennv], [ngaysinh], [gioitinh], [diachi], [email], [didong], [vanhoa], [chuyenmon], [idphongban], [luong]) VALUES (1, N'Võ Thu Thủy', CAST(N'2001-01-15T00:00:00.000' AS DateTime), N'Nữ', N'123 Đường Lê Văn Khương Quận 12', N'thuthuy@gmail.com', N'0777777777', N'nghe nhạc', N'tính toán', NULL, 6000000.0000)
INSERT [dbo].[NhanVien] ([idnv], [tennv], [ngaysinh], [gioitinh], [diachi], [email], [didong], [vanhoa], [chuyenmon], [idphongban], [luong]) VALUES (2, N'Lê Thành Công', CAST(N'2002-02-17T00:00:00.000' AS DateTime), N'Nam', N'456 Quận Gò Vấp', N'thanhcong@gmail.com', N'0666666666', N'đọc sách', N'tính toán', NULL, 8000000.0000)
SET IDENTITY_INSERT [dbo].[NhanVien] OFF
GO
SET IDENTITY_INSERT [dbo].[PhongBan] ON 

INSERT [dbo].[PhongBan] ([idphongban], [tenphongban]) VALUES (1, N'IT')
INSERT [dbo].[PhongBan] ([idphongban], [tenphongban]) VALUES (2, N'phòng nhân sự')
INSERT [dbo].[PhongBan] ([idphongban], [tenphongban]) VALUES (3, N'phòng kế toán')
INSERT [dbo].[PhongBan] ([idphongban], [tenphongban]) VALUES (4, N'phòng IT')
INSERT [dbo].[PhongBan] ([idphongban], [tenphongban]) VALUES (6, N'IT 2003')
INSERT [dbo].[PhongBan] ([idphongban], [tenphongban]) VALUES (18, N'Ahihi')
INSERT [dbo].[PhongBan] ([idphongban], [tenphongban]) VALUES (20, N'UUUUU54646')
INSERT [dbo].[PhongBan] ([idphongban], [tenphongban]) VALUES (23, N'Ahihi1111')
SET IDENTITY_INSERT [dbo].[PhongBan] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([idU], [nameU], [passU], [emailU], [phanquyen]) VALUES (15, N'admin', N'admin123', N'admin@gmail.com', N'admin')
INSERT [dbo].[Users] ([idU], [nameU], [passU], [emailU], [phanquyen]) VALUES (17, N'kh01', N'kh01', N'kh@gmail.com', N'user')
INSERT [dbo].[Users] ([idU], [nameU], [passU], [emailU], [phanquyen]) VALUES (18, N'mn', N'mn01', N'mn@gmail.com', N'manager')
INSERT [dbo].[Users] ([idU], [nameU], [passU], [emailU], [phanquyen]) VALUES (19, N'user102', N'user1002', N'user02@gmail.com', N'user')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[HopDong]  WITH CHECK ADD  CONSTRAINT [FK_HopDong_NhanVien] FOREIGN KEY([idnv])
REFERENCES [dbo].[NhanVien] ([idnv])
GO
ALTER TABLE [dbo].[HopDong] CHECK CONSTRAINT [FK_HopDong_NhanVien]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_NhanVien_PhongBan] FOREIGN KEY([idphongban])
REFERENCES [dbo].[PhongBan] ([idphongban])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [FK_NhanVien_PhongBan]
GO
USE [master]
GO
ALTER DATABASE [QuanLyNhanSu] SET  READ_WRITE 
