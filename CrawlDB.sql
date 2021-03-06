USE [master]
GO
/****** Object:  Database [Crawl]    Script Date: 6/7/2017 2:21:46 PM ******/
CREATE DATABASE [Crawl]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Crawl', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Crawl.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Crawl_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Crawl_log.ldf' , SIZE = 1344KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Crawl] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Crawl].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Crawl] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Crawl] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Crawl] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Crawl] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Crawl] SET ARITHABORT OFF 
GO
ALTER DATABASE [Crawl] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Crawl] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Crawl] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Crawl] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Crawl] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Crawl] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Crawl] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Crawl] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Crawl] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Crawl] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Crawl] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Crawl] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Crawl] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Crawl] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Crawl] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Crawl] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Crawl] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Crawl] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Crawl] SET  MULTI_USER 
GO
ALTER DATABASE [Crawl] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Crawl] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Crawl] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Crawl] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Crawl] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Crawl]
GO
/****** Object:  Table [dbo].[AlbumDetail]    Script Date: 6/7/2017 2:21:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlbumDetail](
	[idAlbum] [int] NOT NULL,
	[idSong] [int] IDENTITY(1,1) NOT NULL,
	[song] [ntext] NULL,
	[singer] [ntext] NULL,
	[link] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[idAlbum] ASC,
	[idSong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ListAlbum]    Script Date: 6/7/2017 2:21:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ListAlbum](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [ntext] NULL,
	[link] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[AlbumDetail] ON 

INSERT [dbo].[AlbumDetail] ([idAlbum], [idSong], [song], [singer], [link]) VALUES (16, 348, N'Rave After Rave', N'W&W', N'http://aredir.nixcdn.com/460164213c0ea982a3d1de793f04e76e/59379fe6/NhacCuaTui889/RaveAfterRave-WW-3824753.mp3')
INSERT [dbo].[AlbumDetail] ([idAlbum], [idSong], [song], [singer], [link]) VALUES (16, 349, N'New World (Radio Version)', N'Code Black, Chris Madin', N'http://aredir.nixcdn.com/5c70d4d48d3c70f629221c4ea2b66b5b/59379fe6/NhacCuaTui889/NewWorldRadioVersion-CodeBlackChrisMadin-3825905.mp3')
INSERT [dbo].[AlbumDetail] ([idAlbum], [idSong], [song], [singer], [link]) VALUES (16, 350, N'Fire In Our Hearts (Joey Dale Remix Edit)', N'Swanky Tunes, C.Todd Nielsen', N'http://aredir.nixcdn.com/64a2f22e571af72fe060cb7171788753/59379fe6/NhacCuaTui889/FireInOurHeartsJoeyDaleRemixEdit-SwankyTunesC.ToddNielsen-3818966.mp3')
INSERT [dbo].[AlbumDetail] ([idAlbum], [idSong], [song], [singer], [link]) VALUES (16, 351, N'Forbidden Voices (Original Mix)', N'Martin Garrix', N'http://aredir.nixcdn.com/64643c441c72bb06d950c62215985a90/59379fe6/NhacCuaTui893/ForbiddenVoicesOriginalMix-MartinGarrix-3874163.mp3')
INSERT [dbo].[AlbumDetail] ([idAlbum], [idSong], [song], [singer], [link]) VALUES (16, 352, N'Wizard', N'Martin Garrix, Jay Hardway', N'http://aredir.nixcdn.com/4b955f185744d0815b8ff809ac9f9d6e/59379fe6/NhacCuaTui849/Wizard-MartinGarrixJayHardway-2937264.mp3')
INSERT [dbo].[AlbumDetail] ([idAlbum], [idSong], [song], [singer], [link]) VALUES (16, 353, N'The One (Extended Mix)', N'W&W', N'http://aredir.nixcdn.com/f5ad49e4dd616b6d3898ea0ff2cba820/59379fe6/NhacCuaTui900/TheOneExtendedMix-WW-4024331.mp3')
INSERT [dbo].[AlbumDetail] ([idAlbum], [idSong], [song], [singer], [link]) VALUES (16, 354, N'Are You With Me (Radio Edit)', N'Lost Frequencies', N'http://aredir.nixcdn.com/ebd04d9be08965efd6cda24602ca6710/59379fe6/NhacCuaTui883/AreYouWithMeRadioEdit-LostFrequencies-3745590.mp3')
INSERT [dbo].[AlbumDetail] ([idAlbum], [idSong], [song], [singer], [link]) VALUES (16, 355, N'Let Me Feel (Radio Edit)', N'Nicky Romero, Vicetone, When We Are Wild', N'http://aredir.nixcdn.com/02cda20316ce8101eae7b9b05ece9a32/59379fe6/NhacCuaTui886/LetMeFeelRadioEdit-NickyRomeroVicetoneWhenWeAreWild-3783388.mp3')
INSERT [dbo].[AlbumDetail] ([idAlbum], [idSong], [song], [singer], [link]) VALUES (16, 356, N'Don''t You Worry Child', N'Swedish House Mafia', N'http://aredir.nixcdn.com/0097c2650ce8bbf1f9da25cf360405da/59379fe6/Unv_Audio14/DonTYouWorryChild-SwedishHouseMafia-3039576.mp3')
INSERT [dbo].[AlbumDetail] ([idAlbum], [idSong], [song], [singer], [link]) VALUES (16, 357, N'Bad (feat. Vassy) [Radio Edit]', N'Vassy', N'http://aredir.nixcdn.com/7cda64d6ab15910f36642bf6f27af050/59379fe6/Warner_Audio11/BadfeatVassyRadioEdit-DavidGuettaShowtekVassy-4837966.mp3')
INSERT [dbo].[AlbumDetail] ([idAlbum], [idSong], [song], [singer], [link]) VALUES (16, 358, N'Blast Off', N'David Guetta, Kaz James', N'http://aredir.nixcdn.com/3d01dabd7c38126a23040f1e7efecb30/59379fe6/NhacCuaTui889/BlastOff-DavidGuettaKazJames-3824408.mp3')
INSERT [dbo].[AlbumDetail] ([idAlbum], [idSong], [song], [singer], [link]) VALUES (16, 359, N'I''m On Fire (Radio Edit)', N'Vicetone', N'http://aredir.nixcdn.com/d2a4aa1382879262ec92082b246c73aa/59379fe6/NhacCuaTui910/ImOnFireRadioEdit-Vicetone-4170659.mp3')
INSERT [dbo].[AlbumDetail] ([idAlbum], [idSong], [song], [singer], [link]) VALUES (16, 360, N'United We Are', N'Hardwell, Amba Shepherd', N'http://aredir.nixcdn.com/807f18e77055964b2e93987bb19890e3/59379fe6/NhacCuaTui884/UnitedWeAre-HardwellAmbaShepherd-3758623.mp3')
INSERT [dbo].[AlbumDetail] ([idAlbum], [idSong], [song], [singer], [link]) VALUES (16, 361, N'Let the Love ', N'Starkillers, Dmitry Ko, Amba Shepherd', N'http://aredir.nixcdn.com/a1040c1dedd960ae930e2d8cc85bf051/59379fe6/NhacCuaTui827/LettheLove-StarkillersDmitryKoAmbaShepherd-2418442.mp3')
INSERT [dbo].[AlbumDetail] ([idAlbum], [idSong], [song], [singer], [link]) VALUES (16, 362, N'Break Through The Silence', N'Martin Garrix, Matisse & Sadko', N'http://aredir.nixcdn.com/28f16e63ab79119a76f02d54ef5f8378/59379fe6/NhacCuaTui902/BreakThroughTheSilence-MartinGarrixMatisseSadko-4057200.mp3')
INSERT [dbo].[AlbumDetail] ([idAlbum], [idSong], [song], [singer], [link]) VALUES (17, 363, N'Cỏ Ba Lá', N'3 Chú Bộ Đội', N'http://aredir.nixcdn.com/1c94de699e1aabfe1c2563077f7453bc/59379fe6/NhacCuaTui942/Co3La-3ChuBoDoi-5015945.mp3')
INSERT [dbo].[AlbumDetail] ([idAlbum], [idSong], [song], [singer], [link]) VALUES (17, 364, N'Cỏ Ba Lá Beat', N'3 Chú Bộ Đội', N'http://aredir.nixcdn.com/aa3fa1c8173bbc3956852d863319e73e/59379fe6/NhacCuaTui942/Co3LaBeat-3ChuBoDoi-5015960.mp3')
SET IDENTITY_INSERT [dbo].[AlbumDetail] OFF
SET IDENTITY_INSERT [dbo].[ListAlbum] ON 

INSERT [dbo].[ListAlbum] ([id], [name], [link]) VALUES (16, N'Push Your Hands Up', N'http://www.nhaccuatui.com/playlist/push-your-hands-up-va.7pw4UrL1bJVc.html')
INSERT [dbo].[ListAlbum] ([id], [name], [link]) VALUES (17, N'Cỏ 3 Lá (Single)', N'http://www.nhaccuatui.com/playlist/co-3-la-single-3-chu-bo-doi.cZzPfwNfjlth.html')
SET IDENTITY_INSERT [dbo].[ListAlbum] OFF
ALTER TABLE [dbo].[AlbumDetail]  WITH CHECK ADD FOREIGN KEY([idAlbum])
REFERENCES [dbo].[ListAlbum] ([id])
GO
USE [master]
GO
ALTER DATABASE [Crawl] SET  READ_WRITE 
GO
