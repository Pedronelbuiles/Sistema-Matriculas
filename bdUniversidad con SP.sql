USE [dbUniversidad]
GO
/****** Object:  Table [dbo].[tblAulas]    Script Date: 23/05/2020 1:47:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAulas](
	[Id_Aula] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Aula] [varchar](5) NOT NULL,
	[Capacidad_Alumnos] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Aula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBodegas]    Script Date: 23/05/2020 1:47:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBodegas](
	[IdBodega] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Direccion] [varchar](100) NOT NULL,
	[IdCiudad] [int] NOT NULL,
	[Telefono] [varchar](20) NOT NULL,
	[IdEstado] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdBodega] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCalificaciones]    Script Date: 23/05/2020 1:47:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCalificaciones](
	[Id_Calificacion] [int] IDENTITY(1,1) NOT NULL,
	[Id_Matricula] [int] NULL,
	[Nota] [float] NOT NULL,
	[Porcentaje] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Calificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCarreras]    Script Date: 23/05/2020 1:47:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCarreras](
	[Id_Carrera] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Carrera] [varchar](100) NOT NULL,
	[Id_Decanatura] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Carrera] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCiudades]    Script Date: 23/05/2020 1:47:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCiudades](
	[IdCiudad] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[IdDepto] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCiudad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCursos]    Script Date: 23/05/2020 1:47:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCursos](
	[Id_Curso] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Curso] [varchar](100) NOT NULL,
	[Numero_Creditos] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Curso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCursosCarreras]    Script Date: 23/05/2020 1:47:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCursosCarreras](
	[Id_Curso] [int] NOT NULL,
	[Id_Carrera] [int] NOT NULL,
	[Numero_Semestre] [varchar](2) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Curso] ASC,
	[Id_Carrera] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCursosDocentes]    Script Date: 23/05/2020 1:47:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCursosDocentes](
	[Id_CursoDocente] [int] IDENTITY(1,1) NOT NULL,
	[Id_Curos] [int] NOT NULL,
	[Id_Docente] [int] NOT NULL,
	[Id_Aula] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_CursoDocente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDecanaturas]    Script Date: 23/05/2020 1:47:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDecanaturas](
	[Id_Decanatura] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Decanatura] [varchar](100) NOT NULL,
	[Telefono_Decanatura] [varchar](12) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Decanatura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDepartamentos]    Script Date: 23/05/2020 1:47:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDepartamentos](
	[IdDepto] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[IdPais] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDepto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDocentes]    Script Date: 23/05/2020 1:47:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDocentes](
	[Id_Docente] [int] IDENTITY(1,1) NOT NULL,
	[Nombre_Docente] [varchar](100) NOT NULL,
	[Telefono_Fijo] [varchar](50) NULL,
	[Celular] [varchar](15) NOT NULL,
	[E_mail] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Docente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDocentesDecanaturas]    Script Date: 23/05/2020 1:47:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDocentesDecanaturas](
	[Id_Docente] [int] NOT NULL,
	[Id_Decanatura] [int] NOT NULL,
	[Cant_Horas_Clase] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Docente] ASC,
	[Id_Decanatura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEstados]    Script Date: 23/05/2020 1:47:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEstados](
	[IdEstado] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEstudiantes]    Script Date: 23/05/2020 1:47:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEstudiantes](
	[Id_Estudiante] [int] IDENTITY(1,1) NOT NULL,
	[Cedula] [varchar](15) NOT NULL,
	[Nombre_Estudiante] [varchar](50) NOT NULL,
	[Dir_Residencia] [varchar](100) NULL,
	[Celular] [varchar](12) NOT NULL,
	[E_mail] [varchar](100) NOT NULL,
	[carne] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Estudiante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Cedula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEstudiantesCarreras]    Script Date: 23/05/2020 1:47:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEstudiantesCarreras](
	[Id_EstudianteCarrea] [int] IDENTITY(1,1) NOT NULL,
	[Id_Carrera] [int] NOT NULL,
	[Id_Estudiante] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_EstudianteCarrea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblGeneros]    Script Date: 23/05/2020 1:47:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblGeneros](
	[IdGenero] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdGenero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLotes]    Script Date: 23/05/2020 1:47:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLotes](
	[IdLote] [int] IDENTITY(1,1) NOT NULL,
	[IdProducto] [int] NOT NULL,
	[IdProveedor] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[PrecioCompra] [float] NOT NULL,
	[FecIngreso] [char](8) NOT NULL,
	[FecVenci] [char](8) NOT NULL,
	[IdEstado] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdLote] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMatriculas]    Script Date: 23/05/2020 1:47:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMatriculas](
	[Id_Matricula] [int] IDENTITY(1,1) NOT NULL,
	[Id_Estudiante] [int] NOT NULL,
	[Id_Curso] [int] NOT NULL,
	[Id_Docente] [int] NOT NULL,
	[Id_Aula] [int] NOT NULL,
	[Dia_Curso] [varchar](10) NOT NULL,
	[Hora_Inicio_Curso] [varchar](10) NOT NULL,
	[Hora_Fin_Curso] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Matricula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrdenes_Det]    Script Date: 23/05/2020 1:47:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrdenes_Det](
	[IdOrdenDet] [int] IDENTITY(1,1) NOT NULL,
	[IdOrden] [int] NOT NULL,
	[IdLote] [int] NOT NULL,
	[IdBodegaDestinno] [int] NOT NULL,
	[IdEstEntrega] [int] NOT NULL,
	[IdUsrRecibe] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdOrdenDet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrdenes_Enc]    Script Date: 23/05/2020 1:47:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrdenes_Enc](
	[IdOrden] [int] IDENTITY(1,1) NOT NULL,
	[IdTipoOrden] [int] NOT NULL,
	[IdBodegaOrigen] [int] NOT NULL,
	[IdUsrRemite] [int] NOT NULL,
	[FechaCreacion] [char](8) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdOrden] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPaises]    Script Date: 23/05/2020 1:47:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPaises](
	[IdPais] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProductos]    Script Date: 23/05/2020 1:47:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProductos](
	[IdProducto] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[IdTipoProducto] [int] NOT NULL,
	[IdRegInvima] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProveedores]    Script Date: 23/05/2020 1:47:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProveedores](
	[IdProveedor] [int] IDENTITY(1,1) NOT NULL,
	[Nit] [varchar](20) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Direccion] [varchar](50) NOT NULL,
	[Telefono] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Nit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTipoOrdenes]    Script Date: 23/05/2020 1:47:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTipoOrdenes](
	[IdTipoOrden] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdTipoOrden] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTiposProductos]    Script Date: 23/05/2020 1:47:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTiposProductos](
	[IdTipoProducto] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdTipoProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsuarios]    Script Date: 23/05/2020 1:47:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsuarios](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Email] [varchar](100) NULL,
	[Celular] [varchar](20) NOT NULL,
	[Facebook] [varchar](100) NOT NULL,
	[DirReside] [varchar](100) NOT NULL,
	[IdCiudad] [int] NOT NULL,
	[FechaNto] [char](8) NOT NULL,
	[IdGenero] [int] NOT NULL,
	[UsrSistema] [varchar](50) NULL,
	[Clave] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tlbRegistrosInvima]    Script Date: 23/05/2020 1:47:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tlbRegistrosInvima](
	[IdRegInvima] [int] IDENTITY(1,1) NOT NULL,
	[Codigo] [varchar](100) NOT NULL,
	[FecAproba] [char](8) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdRegInvima] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblBodegas]  WITH CHECK ADD FOREIGN KEY([IdCiudad])
REFERENCES [dbo].[tblCiudades] ([IdCiudad])
GO
ALTER TABLE [dbo].[tblBodegas]  WITH CHECK ADD FOREIGN KEY([IdEstado])
REFERENCES [dbo].[tblEstados] ([IdEstado])
GO
ALTER TABLE [dbo].[tblCalificaciones]  WITH CHECK ADD FOREIGN KEY([Id_Matricula])
REFERENCES [dbo].[tblMatriculas] ([Id_Matricula])
GO
ALTER TABLE [dbo].[tblCarreras]  WITH CHECK ADD FOREIGN KEY([Id_Decanatura])
REFERENCES [dbo].[tblDecanaturas] ([Id_Decanatura])
GO
ALTER TABLE [dbo].[tblCiudades]  WITH CHECK ADD FOREIGN KEY([IdDepto])
REFERENCES [dbo].[tblDepartamentos] ([IdDepto])
GO
ALTER TABLE [dbo].[tblCursosCarreras]  WITH CHECK ADD FOREIGN KEY([Id_Carrera])
REFERENCES [dbo].[tblCarreras] ([Id_Carrera])
GO
ALTER TABLE [dbo].[tblCursosCarreras]  WITH CHECK ADD FOREIGN KEY([Id_Curso])
REFERENCES [dbo].[tblCursos] ([Id_Curso])
GO
ALTER TABLE [dbo].[tblCursosDocentes]  WITH CHECK ADD FOREIGN KEY([Id_Aula])
REFERENCES [dbo].[tblAulas] ([Id_Aula])
GO
ALTER TABLE [dbo].[tblCursosDocentes]  WITH CHECK ADD FOREIGN KEY([Id_Curos])
REFERENCES [dbo].[tblCursos] ([Id_Curso])
GO
ALTER TABLE [dbo].[tblCursosDocentes]  WITH CHECK ADD FOREIGN KEY([Id_Docente])
REFERENCES [dbo].[tblDocentes] ([Id_Docente])
GO
ALTER TABLE [dbo].[tblDepartamentos]  WITH CHECK ADD FOREIGN KEY([IdPais])
REFERENCES [dbo].[tblPaises] ([IdPais])
GO
ALTER TABLE [dbo].[tblDocentesDecanaturas]  WITH CHECK ADD FOREIGN KEY([Id_Decanatura])
REFERENCES [dbo].[tblDecanaturas] ([Id_Decanatura])
GO
ALTER TABLE [dbo].[tblDocentesDecanaturas]  WITH CHECK ADD FOREIGN KEY([Id_Docente])
REFERENCES [dbo].[tblDocentes] ([Id_Docente])
GO
ALTER TABLE [dbo].[tblEstudiantesCarreras]  WITH CHECK ADD FOREIGN KEY([Id_Carrera])
REFERENCES [dbo].[tblCarreras] ([Id_Carrera])
GO
ALTER TABLE [dbo].[tblEstudiantesCarreras]  WITH CHECK ADD FOREIGN KEY([Id_Estudiante])
REFERENCES [dbo].[tblEstudiantes] ([Id_Estudiante])
GO
ALTER TABLE [dbo].[tblLotes]  WITH CHECK ADD FOREIGN KEY([IdEstado])
REFERENCES [dbo].[tblEstados] ([IdEstado])
GO
ALTER TABLE [dbo].[tblLotes]  WITH CHECK ADD FOREIGN KEY([IdProducto])
REFERENCES [dbo].[tblProductos] ([IdProducto])
GO
ALTER TABLE [dbo].[tblLotes]  WITH CHECK ADD FOREIGN KEY([IdProveedor])
REFERENCES [dbo].[tblProveedores] ([IdProveedor])
GO
ALTER TABLE [dbo].[tblMatriculas]  WITH CHECK ADD FOREIGN KEY([Id_Aula])
REFERENCES [dbo].[tblAulas] ([Id_Aula])
GO
ALTER TABLE [dbo].[tblMatriculas]  WITH CHECK ADD FOREIGN KEY([Id_Curso])
REFERENCES [dbo].[tblCursos] ([Id_Curso])
GO
ALTER TABLE [dbo].[tblMatriculas]  WITH CHECK ADD FOREIGN KEY([Id_Docente])
REFERENCES [dbo].[tblDocentes] ([Id_Docente])
GO
ALTER TABLE [dbo].[tblMatriculas]  WITH CHECK ADD FOREIGN KEY([Id_Estudiante])
REFERENCES [dbo].[tblEstudiantes] ([Id_Estudiante])
GO
ALTER TABLE [dbo].[tblOrdenes_Det]  WITH CHECK ADD FOREIGN KEY([IdBodegaDestinno])
REFERENCES [dbo].[tblBodegas] ([IdBodega])
GO
ALTER TABLE [dbo].[tblOrdenes_Det]  WITH CHECK ADD FOREIGN KEY([IdEstEntrega])
REFERENCES [dbo].[tblEstados] ([IdEstado])
GO
ALTER TABLE [dbo].[tblOrdenes_Det]  WITH CHECK ADD FOREIGN KEY([IdLote])
REFERENCES [dbo].[tblLotes] ([IdLote])
GO
ALTER TABLE [dbo].[tblOrdenes_Det]  WITH CHECK ADD FOREIGN KEY([IdOrden])
REFERENCES [dbo].[tblOrdenes_Enc] ([IdOrden])
GO
ALTER TABLE [dbo].[tblOrdenes_Det]  WITH CHECK ADD FOREIGN KEY([IdUsrRecibe])
REFERENCES [dbo].[tblUsuarios] ([IdUsuario])
GO
ALTER TABLE [dbo].[tblOrdenes_Enc]  WITH CHECK ADD FOREIGN KEY([IdBodegaOrigen])
REFERENCES [dbo].[tblBodegas] ([IdBodega])
GO
ALTER TABLE [dbo].[tblOrdenes_Enc]  WITH CHECK ADD FOREIGN KEY([IdTipoOrden])
REFERENCES [dbo].[tblTipoOrdenes] ([IdTipoOrden])
GO
ALTER TABLE [dbo].[tblOrdenes_Enc]  WITH CHECK ADD FOREIGN KEY([IdUsrRemite])
REFERENCES [dbo].[tblUsuarios] ([IdUsuario])
GO
ALTER TABLE [dbo].[tblProductos]  WITH CHECK ADD FOREIGN KEY([IdRegInvima])
REFERENCES [dbo].[tlbRegistrosInvima] ([IdRegInvima])
GO
ALTER TABLE [dbo].[tblProductos]  WITH CHECK ADD FOREIGN KEY([IdTipoProducto])
REFERENCES [dbo].[tblTiposProductos] ([IdTipoProducto])
GO
ALTER TABLE [dbo].[tblUsuarios]  WITH CHECK ADD FOREIGN KEY([IdCiudad])
REFERENCES [dbo].[tblCiudades] ([IdCiudad])
GO
ALTER TABLE [dbo].[tblUsuarios]  WITH CHECK ADD FOREIGN KEY([IdGenero])
REFERENCES [dbo].[tblGeneros] ([IdGenero])
GO
/****** Object:  StoredProcedure [dbo].[SP_ConsultarComboMatricula]    Script Date: 23/05/2020 1:47:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ConsultarComboMatricula]
@TipoConsulta VARCHAR(100),
@IdCurso INT = NULL,
@IdDocente INT = NULL
AS
BEGIN

	IF @TipoConsulta = 'CURSOS'
	BEGIN
		--Cursos
		SELECT DISTINCT Id_Curso AS Id,
			   Nombre_Curso AS Curso
		FROM tblCursos
	END
	ELSE IF @TipoConsulta = 'DOCENTES' 
	BEGIN
		--Docentes
		SELECT DISTINCT tblDocentes.Id_Docente AS Id,
			   Nombre_Docente AS Docente
		FROM tblDocentes INNER JOIN tblCursosDocentes ON tblDocentes.Id_Docente = tblCursosDocentes.Id_Docente
		WHERE tblCursosDocentes.Id_Curos = @IdCurso
	END
	ELSE IF @TipoConsulta = 'AULAS' 
	BEGIN
		--Aulas
		SELECT DISTINCT tblAulas.Id_Aula AS Id,
			   Nombre_Aula AS Aula
		FROM tblAulas INNER JOIN tblCursosDocentes ON tblAulas.Id_Aula = tblCursosDocentes.Id_Aula
		WHERE Id_Docente = @IdDocente AND Id_Curos = @IdCurso
	END
	ELSE IF @TipoConsulta = 'PROGRAMAS'
	BEGIN
		SELECT Id_Carrera AS Id,
			   Nombre_Carrera AS Carrera
		FROM tblCarreras
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ConsultarEstudiante]    Script Date: 23/05/2020 1:47:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ConsultarEstudiante]
@Cedula VARCHAR(15)
AS
BEGIN

	SELECT  Cedula,
		    Nombre_Estudiante AS Estudiante,
			Carne,
			Dir_Residencia,
			Celular, 
			E_mail
	FROM tblEstudiantes
	WHERE Cedula = @Cedula

	EXEC SP_ConsultarMatricula @Cedula


END
GO
/****** Object:  StoredProcedure [dbo].[SP_ConsultarMatricula]    Script Date: 23/05/2020 1:47:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ConsultarMatricula]
@CCEstudiante VARCHAR(20)
AS
BEGIN

	SELECT tblMatriculas.Id_Matricula,
			   tblCursos.Nombre_Curso AS Asignatura,
			   tblDocentes.Nombre_Docente AS Docente,
			   tblAulas.Nombre_Aula AS Aula,
			   tblMatriculas.Dia_Curso AS [Día],
			   tblMatriculas.Hora_Inicio_Curso + '-' + tblMatriculas.Hora_Fin_Curso AS [Hora]
		FROM tblMatriculas INNER JOIN tblEstudiantes ON tblMatriculas.Id_Estudiante = tblEstudiantes.Id_Estudiante
			 INNER JOIN tblCursos ON tblMatriculas.Id_Curso = tblCursos.Id_Curso
			 INNER JOIN tblDocentes ON tblMatriculas.Id_Docente = tblDocentes.Id_Docente
			 INNER JOIN tblAulas ON tblMatriculas.Id_Aula = tblAulas.Id_Aula
		WHERE tblEstudiantes.Cedula = @CCEstudiante
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CrearEstudiante]    Script Date: 23/05/2020 1:47:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CrearEstudiante]
@Cedula VARCHAR(15),
@Nombre_Estudiante VARCHAR(50),
@Dir_Residencia VARCHAR(100),
@Celular VARCHAR(12),
@E_mail VARCHAR(100)
AS
BEGIN

	IF NOT EXISTS(SELECT Id_Estudiante FROM tblEstudiantes WHERE Cedula = @Cedula)
	BEGIN
		INSERT INTO tblEstudiantes(Cedula, Nombre_Estudiante, Dir_Residencia, Celular, E_mail) 
			VALUES (@Cedula,@Nombre_Estudiante,@Dir_Residencia,@Celular,@E_mail)

		SELECT '0' AS CodRpta,
				'Estudiante creado' AS Mensaje

		RETURN
	END
	SELECT '1' AS CodRpta,
		   'Ya existe un estudiante con este número de cedula. Verifique los datos' AS Mensaje
END
GO
/****** Object:  StoredProcedure [dbo].[SP_MatricularEstudiante]    Script Date: 23/05/2020 1:47:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_MatricularEstudiante]
@CCEstudiante VARCHAR(20),
@Id_Curso INT,
@Id_Docente INT,
@Id_Aula INT,
@Dia_Curso VARCHAR(12),
@Hora_Inicio_Curso VARCHAR(6),
@Hora_Fin_Curso VARCHAR(6)
AS
BEGIN

	DECLARE @Id_Estudiante INT

	SELECT @Id_Estudiante = Id_Estudiante
	FROM tblEstudiantes
	WHERE Cedula = @CCEstudiante

	IF NOT EXISTS(SELECT Id_Matricula FROM tblMatriculas WHERE Id_Estudiante = @Id_Estudiante AND Id_Curso = @Id_Curso)
	BEGIN
		
		INSERT INTO tblMatriculas(Id_Estudiante, Id_Curso, Id_Docente, Id_Aula, Dia_Curso, Hora_Inicio_Curso, Hora_Fin_Curso)
			VALUES(@Id_Estudiante,	@Id_Curso,	@Id_Docente,	@Id_Aula,	@Dia_Curso,	@Hora_Inicio_Curso,	@Hora_Fin_Curso)

		SELECT '0' AS CodRpta,
			   'Asignatura matriculada' AS Mensaje

		EXEC SP_ConsultarMatricula @CCEstudiante
		RETURN

	END
	SELECT '1' AS CodRpta,
		   'El estudiante ya tienen matriculada la asignatura' AS Mensaje

END
GO
