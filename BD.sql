USE [master]
GO
/****** Object:  Database [AMEXME]    Script Date: 14/08/2020 03:42:53 p. m. ******/
CREATE DATABASE [AMEXME]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AMEXME', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\AMEXME.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AMEXME_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\AMEXME_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [AMEXME] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AMEXME].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AMEXME] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AMEXME] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AMEXME] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AMEXME] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AMEXME] SET ARITHABORT OFF 
GO
ALTER DATABASE [AMEXME] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [AMEXME] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AMEXME] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AMEXME] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AMEXME] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AMEXME] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AMEXME] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AMEXME] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AMEXME] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AMEXME] SET  ENABLE_BROKER 
GO
ALTER DATABASE [AMEXME] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AMEXME] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AMEXME] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AMEXME] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AMEXME] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AMEXME] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AMEXME] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AMEXME] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AMEXME] SET  MULTI_USER 
GO
ALTER DATABASE [AMEXME] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AMEXME] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AMEXME] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AMEXME] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AMEXME] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AMEXME] SET QUERY_STORE = OFF
GO
USE [AMEXME]
GO
/****** Object:  Table [dbo].[Alfprospectos]    Script Date: 14/08/2020 03:42:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alfprospectos](
	[idAlprospectos] [int] IDENTITY(1,1) NOT NULL,
	[idSocia] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idAlprospectos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[catGiros]    Script Date: 14/08/2020 03:42:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[catGiros](
	[idGiro] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idGiro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[catRubros]    Script Date: 14/08/2020 03:42:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[catRubros](
	[idRubro] [int] IDENTITY(1,1) NOT NULL,
	[empresaria] [varchar](50) NOT NULL,
	[emprendedora] [varchar](50) NOT NULL,
	[honoraria] [varchar](50) NOT NULL,
	[simpatizantes] [varchar](50) NOT NULL,
	[calle] [varchar](50) NOT NULL,
	[numExt] [int] NOT NULL,
	[colonia] [varchar](50) NOT NULL,
	[CP] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idRubro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[catSectores]    Script Date: 14/08/2020 03:42:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[catSectores](
	[idSector] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idSector] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[catSocias]    Script Date: 14/08/2020 03:42:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[catSocias](
	[idSocia] [int] IDENTITY(1,1) NOT NULL,
	[paterno] [varchar](20) NOT NULL,
	[materno] [varchar](20) NOT NULL,
	[nombre] [varchar](30) NOT NULL,
	[idRubro] [int] NOT NULL,
	[diaNacimiento] [int] NOT NULL,
	[mesNacimiento] [int] NOT NULL,
	[telMovil] [varchar](16) NOT NULL,
	[calle] [varchar](50) NOT NULL,
	[numExt] [int] NOT NULL,
	[colonia] [varchar](50) NOT NULL,
	[CP] [int] NOT NULL,
	[fechaAfiliacion] [date] NOT NULL,
	[correo] [varchar](50) NOT NULL,
	[empNombre] [varchar](50) NOT NULL,
	[empRegimen] [varchar](10) NOT NULL,
	[idGiro] [int] NOT NULL,
	[idSector] [int] NOT NULL,
	[empCalle] [varchar](50) NOT NULL,
	[empNumExt] [int] NOT NULL,
	[empColonia] [varchar](50) NOT NULL,
	[empCP] [int] NOT NULL,
	[empEstado] [varchar](50) NOT NULL,
	[empCiudad] [varchar](50) NOT NULL,
	[empRFC] [varchar](13) NOT NULL,
	[empTelefono] [varchar](16) NOT NULL,
	[numEmpleados] [int] NOT NULL,
	[empEstatus] [varchar](10) NOT NULL,
	[fechaBaja] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idSocia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[eveAsistencia]    Script Date: 14/08/2020 03:42:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[eveAsistencia](
	[idAsistencia] [int] IDENTITY(1,1) NOT NULL,
	[asistencia] [varchar](10) NOT NULL,
	[idSocia] [int] NULL,
	[idEvento] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idAsistencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[eventos]    Script Date: 14/08/2020 03:42:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[eventos](
	[idEvento] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[fecha] [date] NULL,
	[hora] [time](7) NULL,
	[descripcion] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idEvento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[expedientes]    Script Date: 14/08/2020 03:42:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[expedientes](
	[idExpediente] [int] IDENTITY(1,1) NOT NULL,
	[idSocia] [int] NOT NULL,
	[actaC] [varbinary](max) NOT NULL,
	[situacionF] [varbinary](max) NOT NULL,
	[altaIMSS] [varbinary](max) NOT NULL,
	[comprobanteDomEmp] [varbinary](max) NOT NULL,
	[identificacion] [varbinary](max) NOT NULL,
	[solicitud] [varbinary](max) NOT NULL,
	[comprobantePago] [varbinary](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idExpediente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 14/08/2020 03:42:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuarios](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[tipo] [varchar](15) NOT NULL,
	[correo] [varchar](50) NOT NULL,
	[clave] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Alfprospectos]  WITH CHECK ADD FOREIGN KEY([idSocia])
REFERENCES [dbo].[catSocias] ([idSocia])
GO
ALTER TABLE [dbo].[catSocias]  WITH CHECK ADD FOREIGN KEY([idGiro])
REFERENCES [dbo].[catGiros] ([idGiro])
GO
ALTER TABLE [dbo].[catSocias]  WITH CHECK ADD FOREIGN KEY([idRubro])
REFERENCES [dbo].[catRubros] ([idRubro])
GO
ALTER TABLE [dbo].[catSocias]  WITH CHECK ADD FOREIGN KEY([idSector])
REFERENCES [dbo].[catSectores] ([idSector])
GO
ALTER TABLE [dbo].[eveAsistencia]  WITH CHECK ADD FOREIGN KEY([idEvento])
REFERENCES [dbo].[eventos] ([idEvento])
GO
ALTER TABLE [dbo].[eveAsistencia]  WITH CHECK ADD FOREIGN KEY([idSocia])
REFERENCES [dbo].[catSocias] ([idSocia])
GO
ALTER TABLE [dbo].[expedientes]  WITH CHECK ADD FOREIGN KEY([idSocia])
REFERENCES [dbo].[catSocias] ([idSocia])
GO
ALTER TABLE [dbo].[catSocias]  WITH CHECK ADD CHECK  (([empEstatus]='Prospecto' OR [empEstatus]='Inactivo' OR [empEstatus]='Activo'))
GO
ALTER TABLE [dbo].[catSocias]  WITH CHECK ADD CHECK  (([empRegimen]='Fisico' OR [empRegimen]='Moral'))
GO
ALTER TABLE [dbo].[eveAsistencia]  WITH CHECK ADD CHECK  (([asistencia]='Asistió' OR [asistencia]='Faltó'))
GO
ALTER TABLE [dbo].[usuarios]  WITH CHECK ADD CHECK  (([tipo]='Normal' OR [tipo]='Administrador'))
GO
/****** Object:  StoredProcedure [dbo].[catGirosGetAll]    Script Date: 14/08/2020 03:42:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[catGirosGetAll]
@p_op INT,
@p_idGiro INT

AS
BEGIN
	IF @p_op = 1
		BEGIN

			SELECT *
			FROM catGiros
			WHERE  idGiro = @p_idGiro

		END
	ELSE IF @p_op = 2
		BEGIN
			SELECT * FROM catGiros
		END
	
END 
GO
/****** Object:  StoredProcedure [dbo].[catGirosSave]    Script Date: 14/08/2020 03:42:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[catGirosSave]
@p_op INT,
@idGiro int,
@nombre varchar(50)
AS
BEGIN
		IF @p_op = 1 --- INSERTAR
			BEGIN 
				INSERT INTO catGiros(nombre)
				VALUES (@nombre)
				RETURN;
			END
		ELSE IF @p_op = 2 --- ACTUALIZAR
			BEGIN
				UPDATE catGiros
				SET nombre = @nombre WHERE idGiro = @idGiro
				RETURN;
			END
		ELSE IF @p_op = 3 --- ELIMINAR
			BEGIN
				DELETE FROM catGiros WHERE idGiro = @idGiro
				RETURN;
			END
END
GO
/****** Object:  StoredProcedure [dbo].[catRubrosGetAll]    Script Date: 14/08/2020 03:42:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[catRubrosGetAll]
@p_op INT,
@p_idRubro INT

AS
BEGIN
	IF @p_op = 1
		BEGIN

			SELECT *
			FROM catRubros
			WHERE  idRubro = @p_idRubro

		END
	ELSE IF @p_op = 2
		BEGIN
			SELECT * FROM catRubros
		END
	
END 
GO
/****** Object:  StoredProcedure [dbo].[catRubrosSave]    Script Date: 14/08/2020 03:42:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[catRubrosSave]
@p_op INT,
@idRubro int,
@empresaria varchar(50),
@emprendedora varchar(50),
@honoraria varchar(50),
@simpatizantes varchar(50),
@calle varchar(50),
@numExt int,
@colonia varchar(50),
@CP int
AS
BEGIN
		IF @p_op = 1 --- INSERTAR
			BEGIN 
				INSERT INTO catRubros(empresaria,emprendedora,honoraria,simpatizantes,calle,numExt,colonia,CP)
				VALUES (@empresaria,@emprendedora,@honoraria,@simpatizantes,@calle,@numExt,@colonia,@CP)
				RETURN;
			END
		ELSE IF @p_op = 2 --- ACTUALIZAR
			BEGIN
				UPDATE catRubros
				SET empresaria = @empresaria,emprendedora = @emprendedora,honoraria = @honoraria,
				simpatizantes = @simpatizantes, calle = @calle, numExt = @numExt,colonia = @colonia,CP = @CP 
				WHERE idRubro = @idRubro
				RETURN;
			END
		ELSE IF @p_op = 3 --- ELIMINAR
			BEGIN
				DELETE FROM catRubros WHERE idRubro = @idRubro
				RETURN;
			END
END
GO
/****** Object:  StoredProcedure [dbo].[catSectoresGetAll]    Script Date: 14/08/2020 03:42:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[catSectoresGetAll]
@p_op INT,
@p_idSector INT

AS
BEGIN
	IF @p_op = 1
		BEGIN

			SELECT *
			FROM catSectores
			WHERE  idSector = @p_idSector

		END
	ELSE IF @p_op = 2
		BEGIN
			SELECT * FROM catSectores
		END
	
END 
GO
/****** Object:  StoredProcedure [dbo].[catSectoresSave]    Script Date: 14/08/2020 03:42:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[catSectoresSave]
@p_op INT,
@idSector int,
@nombre varchar(50)
AS
BEGIN

		IF @p_op = 1 --- INSERTAR
			BEGIN 
				INSERT INTO catSectores(nombre)
				VALUES (@nombre)
				RETURN;
			END
		ELSE IF @p_op = 2 --- ACTUALIZAR
			BEGIN
				UPDATE catSectores
				SET nombre = @nombre WHERE idSector = @idSector
				RETURN;
			END
		ELSE IF @p_op = 3 --- ELIMINAR
			BEGIN
				DELETE FROM catSectores WHERE idSector = @idSector
				RETURN;
			END
END
GO
/****** Object:  StoredProcedure [dbo].[catSociasGetAll]    Script Date: 14/08/2020 03:42:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[catSociasGetAll]
@p_op INT,
@p_idSocia INT,
@p_idGiro INT,
@p_idSector INT,
@p_idRubro INT

AS
BEGIN
	IF @p_op = 1
		BEGIN

			SELECT S.paterno,S.materno,S.nombre,R.empresaria, S.diaNacimiento, S.mesNacimiento,S.telMovil,S.calle,S.numExt,S.colonia, S.CP, 
				S.fechaAfiliacion, S.correo,S.empNombre,S.empRegimen,G.nombre, Sec.nombre, S.empCalle,S.empNumExt,S.empColonia, S.empCP,S.empEstado,S.empCiudad,S.empRFC,
				S.empTelefono,S.numEmpleados,S.empEstatus,S.fechaBaja
			FROM catSocias S, catGiros G, catSectores Sec, catRubros R
			WHERE  S.idSocia = @p_idSocia AND R.idRubro = @p_idRubro AND G.idGiro = @p_idGiro AND Sec.idSector = @p_idSector

		END
	ELSE IF @p_op = 2
		BEGIN
			SELECT * FROM catSocias
		END
	
END 
GO
/****** Object:  StoredProcedure [dbo].[catSociasSave]    Script Date: 14/08/2020 03:42:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[catSociasSave]
@p_op INT,
@idSocia int,
@paterno varchar(20),
@materno varchar(20),
@nombre varchar(30),
@idRubro int,
@diaNacimiento int ,
@mesNacimiento int,
@telMovil Bigint,
@calle VARCHAR(50),
@numExt int,
@colonia VARCHAR(50),
@CP int,
@fechaAfiliacion date,
@correo varchar(50),
@empNombre varchar(50),
@empRegimen varchar(10),
@idGiro int,
@idSector int,
@empCalle VARCHAR(50),
@empNumExt int,
@empColonia VARCHAR(50),
@empCP int,
@empEstado varchar(50),
@empCiudad varchar(50),
@empRFC varchar(13),
@empTelefono Bigint,
@numEmpleados int,
@empEstatus varchar(10),
@fechaBaja date
AS
BEGIN
		IF @p_op = 1 --- INSERTAR
			BEGIN 
				INSERT INTO catSocias(paterno,materno,nombre,idRubro,diaNacimiento,mesNacimiento,telMovil,calle,numExt,colonia, CP, 
				fechaAfiliacion, correo,empNombre,empRegimen,idGiro, idSector, empCalle,empNumExt,empColonia, empCP,empEstado,empCiudad,empRFC,
				empTelefono,numEmpleados,empEstatus,fechaBaja)
				VALUES (@paterno,@materno,@nombre,@idRubro,@diaNacimiento, @mesNacimiento, @telMovil,@calle,@numExt,@colonia, @CP,
				@fechaAfiliacion, @correo,@empNombre,@empRegimen,@idGiro, @idSector,@empCalle,@empNumExt,@empColonia, @empCP,@empEstado,@empCiudad, 
				@empRFC,@empTelefono,@numEmpleados,@empEstatus,@fechaBaja)
				RETURN;
			END
		ELSE IF @p_op = 2 --- ACTUALIZAR
			BEGIN
				UPDATE catSocias
				SET paterno = @paterno, materno = @materno,nombre = @nombre, idRubro = @idRubro,diaNacimiento = @diaNacimiento, 
				mesNacimiento = @mesNacimiento,telMovil = @telMovil, calle = @calle, numExt = @numExt, colonia = @colonia, CP = @CP, correo = @correo, 
				empNombre = @empNombre, empRegimen = @empRegimen, idGiro = @idGiro, idSector = @idSector, empCalle = @empCalle, empNumExt = @empNumExt, 
				empColonia = @empColonia, empCP = @empCP, empEstado = @empEstado, empCiudad = @empCiudad, empRFC = @empRFC,empTelefono = @empTelefono, 
				numEmpleados = @numEmpleados, empEstatus = @empEstatus, fechaBaja = @fechaBaja WHERE idSocia = @idSocia
				RETURN;
			END
		ELSE IF @p_op = 3 --- ELIMINAR
			BEGIN
				DELETE FROM catSocias WHERE idSocia = @idSocia
				RETURN;
			END
END
GO
/****** Object:  StoredProcedure [dbo].[eventosGetAll]    Script Date: 14/08/2020 03:42:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
CREATE PROCEDURE [dbo].[eventosGetAll]
@p_op INT,
@p_idEvento INT

AS
BEGIN
	IF @p_op = 1
		BEGIN

			SELECT *
			FROM eventos
			WHERE  idEvento = @p_idEvento

		END
	ELSE IF @p_op = 2
		BEGIN
			SELECT * FROM eventos
		END
	
END 
GO
/****** Object:  StoredProcedure [dbo].[eventosSave]    Script Date: 14/08/2020 03:42:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[eventosSave]
@p_op INT,
@idEvento int,
@nombre varchar(50),
@fecha date,
@hora time,
@descripcion varchar(255)
AS
BEGIN

		IF @p_op = 1 --- INSERTAR
			BEGIN 
				INSERT INTO eventos(nombre, fecha, hora, descripcion)
				VALUES (@nombre, @fecha, @hora, @descripcion)
				RETURN;
			END
		ELSE IF @p_op = 2 --- ACTUALIZAR
			BEGIN
				UPDATE eventos
				SET nombre = @nombre, fecha = @fecha, hora = @hora, descripcion = @descripcion WHERE idEvento = @idEvento
				RETURN;
			END
		ELSE IF @p_op = 3 --- ELIMINAR
			BEGIN
				DELETE FROM eventos WHERE idEvento = @idEvento
				RETURN;
			END
END
GO
/****** Object:  StoredProcedure [dbo].[expedientesGetAll]    Script Date: 14/08/2020 03:42:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[expedientesGetAll]
@p_op INT,
@p_idExpediente INT,
@p_idSocia INT,
@p_actaC VARBINARY(MAX),
@p_situacionF VARBINARY(MAX),
@p_altaIMSS VARBINARY(MAX),
@p_comprobanteDomEmp VARBINARY(MAX),
@p_identificacion VARBINARY(MAX),
@p_solicitud VARBINARY(MAX),
@p_comprobantePago VARBINARY(MAX)

AS
BEGIN
	IF @p_op = 1
		BEGIN

			SELECT *
			FROM expedientes
			WHERE  idExpediente = @p_idExpediente

		END
	ELSE IF @p_op = 2
		BEGIN
			SELECT * FROM expedientes
		END
	
END 
GO
/****** Object:  StoredProcedure [dbo].[expedientesSave]    Script Date: 14/08/2020 03:42:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[expedientesSave]
@p_op INT,
@p_idExpediente INT,
@p_idSocia INT,
@p_actaC VARBINARY(MAX),
@p_situacionF VARBINARY(MAX),
@p_altaIMSS VARBINARY(MAX),
@p_comprobanteDomEmp VARBINARY(MAX),
@p_identificacion VARBINARY(MAX),
@p_solicitud VARBINARY(MAX),
@p_comprobantePago VARBINARY(MAX)
AS
BEGIN
		IF @p_op = 1 --- INSERTAR
			BEGIN 
				INSERT INTO expedientes(idSocia,actaC,situacionF,altaIMSS,comprobanteDomEmp,identificacion,solicitud,comprobantePago)
				VALUES (@p_idSocia,@p_actaC,@p_situacionF,@p_altaIMSS,@p_comprobanteDomEmp,@p_identificacion,@p_solicitud,@p_comprobantePago)
				RETURN;
			END
		ELSE IF @p_op = 2 --- ACTUALIZAR
			BEGIN
				UPDATE expedientes
				SET idSocia = @p_idSocia, actaC = @p_actaC, situacionF = @p_situacionF,altaIMSS = @p_altaIMSS,
				comprobanteDomEmp = @p_comprobanteDomEmp,identificacion= @p_identificacion, solicitud = @p_situacionF,
				comprobantePago = @p_comprobantePago
				WHERE idExpediente = @p_idExpediente
				RETURN;
			END
		ELSE IF @p_op = 3 --- ELIMINAR
			BEGIN
				DELETE FROM expedientes WHERE idExpediente = @p_idExpediente
				RETURN;
			END
END
GO
/****** Object:  StoredProcedure [dbo].[usuarioGet]    Script Date: 14/08/2020 03:42:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usuarioGet] 
	@p_username varchar(50),
	@p_clave varchar(100)
AS
BEGIN
	SELECT * FROM usuarios
	WHERE username = @p_username AND clave = @p_clave 
END
GO
/****** Object:  StoredProcedure [dbo].[usuariosGetAll]    Script Date: 14/08/2020 03:42:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usuariosGetAll]
@p_op INT,
@p_idUsuario INT

AS
BEGIN
	IF @p_op = 1
		BEGIN

			SELECT *
			FROM usuarios
			WHERE  idUsuario = @p_idUsuario

		END
	ELSE IF @p_op = 2
		BEGIN
			SELECT * FROM usuarios
		END
	
END
GO
/****** Object:  StoredProcedure [dbo].[usuariosSave]    Script Date: 14/08/2020 03:42:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usuariosSave]
@p_op INT,
@idUsuario int,
@username varchar(50),
@tipo varchar(50),
@correo varchar(50),
@clave varchar(50)
AS
BEGIN
		IF @p_op = 1 --- INSERTAR
			BEGIN 
				INSERT INTO usuarios(username,tipo,correo,clave)
				VALUES (@username, @tipo, @correo, @clave)
				RETURN;
			END
		ELSE IF @p_op = 2 --- ACTUALIZAR
			BEGIN
				UPDATE usuarios
				SET username = @username, tipo = @tipo, correo = @correo,
				clave = @clave
				WHERE idUsuario = @idUsuario
				RETURN;
			END
		ELSE IF @p_op = 3 --- ELIMINAR
			BEGIN
				DELETE FROM usuarios WHERE idUsuario = @idUsuario
				RETURN;
			END
END
GO
USE [master]
GO
ALTER DATABASE [AMEXME] SET  READ_WRITE 
GO
