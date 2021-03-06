USE [master]
GO
/****** Object:  Database [Library]    Script Date: 8/21/2021 8:45:50 PM ******/
CREATE DATABASE [Library]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Library_Data', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Library.mdf' , SIZE = 236544KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Library_Log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Library.ldf' , SIZE = 145792KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Library] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Library].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Library] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Library] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Library] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Library] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Library] SET ARITHABORT OFF 
GO
ALTER DATABASE [Library] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Library] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Library] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Library] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Library] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Library] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Library] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Library] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Library] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Library] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Library] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Library] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Library] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Library] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Library] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Library] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Library] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Library] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Library] SET  MULTI_USER 
GO
ALTER DATABASE [Library] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Library] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Library] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Library] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Library] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Library] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Library] SET QUERY_STORE = OFF
GO
USE [Library]
GO
/****** Object:  User [StudentDB]    Script Date: 8/21/2021 8:45:50 PM ******/
CREATE USER [StudentDB] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [db]    Script Date: 8/21/2021 8:45:50 PM ******/
CREATE USER [db] FOR LOGIN [db] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[ChiTietPhieuMuon]    Script Date: 8/21/2021 8:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietPhieuMuon](
	[MaPM] [int] NOT NULL,
	[MaDG] [nvarchar](50) NULL,
	[MaS] [nvarchar](50) NULL,
	[HanTra] [date] NOT NULL,
	[TrangThai] [nvarchar](50) NULL,
	[SoLuong] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocGia]    Script Date: 8/21/2021 8:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocGia](
	[MaDG] [nvarchar](50) NOT NULL,
	[HovaTen] [nvarchar](50) NULL,
	[DonVi] [nvarchar](200) NULL,
 CONSTRAINT [PK_DocGia] PRIMARY KEY CLUSTERED 
(
	[MaDG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Phat]    Script Date: 8/21/2021 8:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phat](
	[MaPhat] [int] IDENTITY(1,1) NOT NULL,
	[MaDG] [nvarchar](50) NULL,
	[MaS] [nvarchar](50) NULL,
	[NgayXuPhat] [date] NULL,
	[Sotien] [nvarchar](50) NULL,
 CONSTRAINT [PK_Phat] PRIMARY KEY CLUSTERED 
(
	[MaPhat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuMuon]    Script Date: 8/21/2021 8:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuMuon](
	[MaPM] [int] IDENTITY(1,1) NOT NULL,
	[MaDG] [nvarchar](50) NULL,
	[MaTT] [nvarchar](50) NULL,
	[NgayMuon] [date] NULL,
 CONSTRAINT [PK_MuonSach] PRIMARY KEY CLUSTERED 
(
	[MaPM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sach]    Script Date: 8/21/2021 8:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sach](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MaS] [nvarchar](50) NOT NULL,
	[TenSach] [nvarchar](200) NULL,
	[NhaXB] [nvarchar](50) NULL,
	[TheLoai] [nvarchar](200) NULL,
	[TacGia] [nvarchar](50) NULL,
	[NamXB] [int] NULL,
	[File] [varbinary](max) NULL,
	[FileName] [nvarchar](200) NULL,
	[GiaTien] [int] NULL,
	[SoLuong] [int] NULL,
 CONSTRAINT [PK_Sach] PRIMARY KEY CLUSTERED 
(
	[MaS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 8/21/2021 8:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TenTaiKhoan] [nvarchar](50) NOT NULL,
	[MatKhau] [nvarchar](50) NULL,
	[PhanQuyen] [nvarchar](50) NULL,
	[MaTT] [nvarchar](50) NULL,
	[Email] [nvarchar](100) NULL,
	[TenNguoiDung] [nvarchar](50) NULL,
 CONSTRAINT [PK_TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThuThu]    Script Date: 8/21/2021 8:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThuThu](
	[MaTT] [nvarchar](50) NOT NULL,
	[HovaTen] [nvarchar](200) NULL,
	[GioiTinh] [nvarchar](50) NULL,
	[NgaySinh] [date] NULL,
	[DiaChi] [nvarchar](200) NULL,
	[Email] [nvarchar](50) NULL,
 CONSTRAINT [PK_ThuThu] PRIMARY KEY CLUSTERED 
(
	[MaTT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TraSach]    Script Date: 8/21/2021 8:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TraSach](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MaDG] [nvarchar](50) NULL,
	[MaS] [nvarchar](50) NULL,
	[SoLuong] [int] NULL,
	[HanTra] [date] NULL,
	[NgayTra] [date] NULL,
 CONSTRAINT [PK_TraSach] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ChiTietPhieuMuon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietPhieuMuon_MuonSach] FOREIGN KEY([MaPM])
REFERENCES [dbo].[PhieuMuon] ([MaPM])
GO
ALTER TABLE [dbo].[ChiTietPhieuMuon] CHECK CONSTRAINT [FK_ChiTietPhieuMuon_MuonSach]
GO
ALTER TABLE [dbo].[ChiTietPhieuMuon]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietPhieuMuon_Sach] FOREIGN KEY([MaS])
REFERENCES [dbo].[Sach] ([MaS])
GO
ALTER TABLE [dbo].[ChiTietPhieuMuon] CHECK CONSTRAINT [FK_ChiTietPhieuMuon_Sach]
GO
ALTER TABLE [dbo].[Phat]  WITH CHECK ADD  CONSTRAINT [FK_Phat_DocGia] FOREIGN KEY([MaDG])
REFERENCES [dbo].[DocGia] ([MaDG])
GO
ALTER TABLE [dbo].[Phat] CHECK CONSTRAINT [FK_Phat_DocGia]
GO
ALTER TABLE [dbo].[PhieuMuon]  WITH CHECK ADD  CONSTRAINT [FK_MuonSach_DocGia] FOREIGN KEY([MaDG])
REFERENCES [dbo].[DocGia] ([MaDG])
GO
ALTER TABLE [dbo].[PhieuMuon] CHECK CONSTRAINT [FK_MuonSach_DocGia]
GO
ALTER TABLE [dbo].[PhieuMuon]  WITH CHECK ADD  CONSTRAINT [FK_MuonSach_ThuThu] FOREIGN KEY([MaTT])
REFERENCES [dbo].[ThuThu] ([MaTT])
GO
ALTER TABLE [dbo].[PhieuMuon] CHECK CONSTRAINT [FK_MuonSach_ThuThu]
GO
ALTER TABLE [dbo].[TraSach]  WITH CHECK ADD  CONSTRAINT [FK_TraSach_DocGia] FOREIGN KEY([MaDG])
REFERENCES [dbo].[DocGia] ([MaDG])
GO
ALTER TABLE [dbo].[TraSach] CHECK CONSTRAINT [FK_TraSach_DocGia]
GO
ALTER TABLE [dbo].[TraSach]  WITH CHECK ADD  CONSTRAINT [FK_TraSach_Sach] FOREIGN KEY([MaS])
REFERENCES [dbo].[Sach] ([MaS])
GO
ALTER TABLE [dbo].[TraSach] CHECK CONSTRAINT [FK_TraSach_Sach]
GO
/****** Object:  StoredProcedure [dbo].[GetCNTT]    Script Date: 8/21/2021 8:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCNTT]
AS
	SELECT MaS, TenSach, TheLoai, NhaXB, NamXB, GiaTien, SoLuong 
	FROM Sach
	WHERE TheLoai LIKE '%' + N'Công nghệ thông tin' + '%'
GO
/****** Object:  StoredProcedure [dbo].[GetGTBG]    Script Date: 8/21/2021 8:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetGTBG]
AS
	SELECT MaS, TenSach, TheLoai, NhaXB, NamXB, GiaTien, SoLuong 
	FROM Sach
	WHERE TheLoai LIKE '%' + N'Giáo trình bài giảng' + '%'
GO
/****** Object:  StoredProcedure [dbo].[GetKTLS]    Script Date: 8/21/2021 8:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetKTLS]
AS
	SELECT MaS, TenSach, TheLoai, NhaXB, NamXB, GiaTien, SoLuong 
	FROM Sach
	WHERE TheLoai LIKE '%' + N'Kỹ thuật lâm sinh' + '%'
GO
/****** Object:  StoredProcedure [dbo].[GetLVNCKH]    Script Date: 8/21/2021 8:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetLVNCKH]
AS
	SELECT MaS, TenSach, TheLoai, NhaXB, NamXB, GiaTien, SoLuong 
	FROM Sach
	WHERE TheLoai LIKE '%' + N'Luận văn, Nghiên cứu khoa học' + '%'
GO
/****** Object:  StoredProcedure [dbo].[GetQHLN]    Script Date: 8/21/2021 8:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetQHLN]
AS
	SELECT MaS, TenSach, TheLoai, NhaXB, NamXB, GiaTien, SoLuong 
	FROM Sach
	WHERE TheLoai LIKE '%' + N'Quy hoạch lâm nghiệp' + '%'
GO
/****** Object:  StoredProcedure [dbo].[GetQLTNR]    Script Date: 8/21/2021 8:45:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetQLTNR]
AS
	SELECT MaS, TenSach, TheLoai, NhaXB, NamXB, GiaTien, SoLuong 
	FROM Sach
	WHERE TheLoai LIKE '%' + N'QL tài nguyên rừng mà môi trường' + '%'
GO
USE [master]
GO
ALTER DATABASE [Library] SET  READ_WRITE 
GO
