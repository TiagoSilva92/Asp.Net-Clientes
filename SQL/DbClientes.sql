USE [master]
GO
/****** Object:  Database [DBClientes]    Script Date: 06/08/2021 09:24:11 ******/
CREATE DATABASE [DBClientes]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBClientes', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DBClientes.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBClientes_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DBClientes_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DBClientes] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBClientes].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBClientes] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBClientes] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBClientes] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBClientes] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBClientes] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBClientes] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DBClientes] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBClientes] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBClientes] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBClientes] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBClientes] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBClientes] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBClientes] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBClientes] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBClientes] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DBClientes] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBClientes] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBClientes] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBClientes] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBClientes] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBClientes] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBClientes] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBClientes] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DBClientes] SET  MULTI_USER 
GO
ALTER DATABASE [DBClientes] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBClientes] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBClientes] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBClientes] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBClientes] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DBClientes] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DBClientes] SET QUERY_STORE = OFF
GO
USE [DBClientes]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 06/08/2021 09:24:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[Nome] [varchar](100) NOT NULL,
	[CPF] [varchar](15) NOT NULL,
	[ID_Tipo_do_Cliente] [int] NOT NULL,
	[Sexo] [nchar](1) NOT NULL,
	[ID_Situacao_do_Cliente] [int] NOT NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[CPF] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Situacao_do_Cliente]    Script Date: 06/08/2021 09:24:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Situacao_do_Cliente](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SituacaoDoCliente] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Situacao_do_Cliente] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tipo_de_Cliente]    Script Date: 06/08/2021 09:24:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tipo_de_Cliente](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TipodeCliente] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Tipo_de_Clientes] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [FK_Clientes_Situacao_do_Cliente] FOREIGN KEY([ID_Situacao_do_Cliente])
REFERENCES [dbo].[Situacao_do_Cliente] ([ID])
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [FK_Clientes_Situacao_do_Cliente]
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [FK_Clientes_Tipo_de_Cliente] FOREIGN KEY([ID_Tipo_do_Cliente])
REFERENCES [dbo].[Tipo_de_Cliente] ([ID])
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [FK_Clientes_Tipo_de_Cliente]
GO
/****** Object:  StoredProcedure [dbo].[DeleteCliente]    Script Date: 06/08/2021 09:24:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[DeleteCliente]
	@CPFRecebido varchar(15)

AS
BEGIN
	DELETE FROM [DBClientes].[dbo].[Clientes] WHERE CPF = @CPFRecebido
END

GO
/****** Object:  StoredProcedure [dbo].[InsertCliente]    Script Date: 06/08/2021 09:24:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script do comando SelectTopNRows de SSMS  ******/
CREATE procedure [dbo].[InsertCliente]
	@NomeRecebido VARCHAR(15),
	@CPFRecebido VARCHAR(15),
	@TipodoClienteRecebido int, 
	@SexoRecebido nchar(1), 
	@SituacaoClienteRecebido int

AS
BEGIN
	INSERT INTO [DBClientes].[dbo].[Clientes] (Nome, CPF, ID_Tipo_do_Cliente, Sexo, ID_Situacao_do_Cliente)
	VALUES (@NomeRecebido, @CPFRecebido, @TipodoClienteRecebido, @SexoRecebido, @SituacaoClienteRecebido)
END

GO
/****** Object:  StoredProcedure [dbo].[SelectClientes]    Script Date: 06/08/2021 09:24:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script do comando SelectTopNRows de SSMS  ******/
CREATE procedure [dbo].[SelectClientes]
AS
BEGIN
	SELECT * FROM [DBClientes].[dbo].[Clientes]
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateCliente]    Script Date: 06/08/2021 09:24:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script do comando SelectTopNRows de SSMS  ******/
CREATE procedure [dbo].[UpdateCliente]
	@NomeRecebido Varchar(100),
	@CPFRecebido VARCHAR(15),
	@TipodoClienteRecebido int, 
	@SexoRecebido nchar(1), 
	@SituacaoClienteRecebido int

AS
BEGIN
	UPDATE [DBClientes].[dbo].[Clientes]
	SET Nome = @NomeRecebido, CPF = @CPFRecebido, ID_Tipo_do_Cliente = @TipodoClienteRecebido, Sexo = @SexoRecebido, ID_Situacao_do_Cliente = @SituacaoClienteRecebido
	WHERE CPF = @CPFRecebido
END

GO
USE [master]
GO
ALTER DATABASE [DBClientes] SET  READ_WRITE 
GO
