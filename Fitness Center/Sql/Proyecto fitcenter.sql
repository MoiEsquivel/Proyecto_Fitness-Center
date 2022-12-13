create database Gimnasio

use Gimnasio
-----------------Cliente---------------------------
create table Cliente
(
Codigo int identity,
Nombre nvarchar(50) Not NULL,
Apellido nvarchar(50),
Telefono nvarchar(10),
Email nvarchar(100) unique, 
Tipo varchar(20), --Admi o Cliente
CONSTRAINT PK_Codigoclien PRIMARY KEY (Codigo)
)

----------Ingreso--------------
create procedure IngresarClientes
@Cliente nvarchar(50),
@Apellido nvarchar(50), @Telefono nvarchar(10),
@Correo nvarchar(50), @Tipo nvarchar(10),
@CoPro int,
@CoCan int, @CoDis int,
@Señas nvarchar(100)
as
begin
	Insert into Cliente (Nombre,Apellido,Telefono,Email,Tipo) values (@Cliente,@Apellido,@Telefono,@Correo,@Tipo)
	insert into  Direccion (CodCliente,CodProv,CodCant,CodDis,Señas) values ((select max(Codigo) from Cliente), @CoPro, @CoCan, @CoDis, @Señas)
	insert into Usuario (CodUsuario, Email,Clave) values ((select max(Codigo) from Cliente),@Correo,'123')
end
exec IngresarClientes 'Moises','Esquivel','72453032','moi@uh.com','Admi',1,1,1,'Por la iglesia caat'

--La clave se genera automaticamente y luego el usuario podra cambiarla

-------------Modificar------------
create procedure ModificarClientes
@Cliente nvarchar(50),
@Apellido nvarchar(50), @Telefono nvarchar(10),
@Correo nvarchar(50), @Tipo nvarchar(10),
@CoPro int,
@CoCan int, @CoDis int,
@Señas nvarchar(100),
@codigo int
as
begin
	update  Cliente set Nombre = @Cliente, Apellido = @Apellido, Telefono = @Telefono, Email = @Correo,Tipo = @Tipo where Codigo = @codigo
	update   Direccion set  CodProv = @CoPro, CodCant = @CoCan, CodDis = @CoDis,Señas = @Señas where CodCliente = @codigo
end

--------------Eliminar--------------
create procedure EliminarClientes
@codigo int
as
begin
	delete Usuario where CodUsuario = @codigo
	delete Direccion where CodCliente = @codigo
	delete Cliente where Codigo = @codigo
end

----------------------DIRECCION--------------------------------------
----------PROVINCIA------------
create table Provincia
(
CodProvincia int identity,
NombreProv varchar(50),
CONSTRAINT PK_Codigoprv PRIMARY KEY (CodProvincia)
)
Insert into Provincia(NombreProv) values ('San Jose'),('Alajuela'),('Cartago'),('Heredia'),('Guanacaste'),('Puntarenas'),('Limon')
select * from Provincia

create procedure AgregarProvincia
@provincia nvarchar(50)
as
begin
Insert into Provincia(NombreProv) values (@provincia)
end

create procedure EliminarProvincia
@provincia nvarchar(50)
as
begin
delete Provincia where CodProvincia = @provincia
end

-----CANTON---------
create table Canton
(
CodCanton int identity,
Nombrecant varchar(50),
Codigoprov int,
CONSTRAINT PK_Codigocan PRIMARY KEY (CodCanton),
CONSTRAINT FK_codprov FOREIGN KEY (Codigoprov) References Provincia (CodProvincia)
)

Insert into Canton (Nombrecant,Codigoprov) values ('San Jose',1),('Escazu',1),('Desamparados',1),('Puriscal',1),('Terrazu',1),('Aserri',1),('Mora',1)

Select* from Canton

Create Procedure Selectcanton
@Codigo int 
as 
begin
Select c.CodCanton,c.Nombrecant
from Canton c
inner join Provincia p on p.CodProvincia = c.Codigoprov where c.Codigoprov = @Codigo
end

create procedure AgregarCanton
@Canton nvarchar(50),
@cdp int
as
begin
Insert into Canton(Nombrecant,Codigoprov) values (@Canton,@cdp)
end

create procedure EliminarCanton
@cdp int
as
begin
delete Canton where CodCanton = @cdp
end

--------DISTRITO-------
create table Distrito
(
CodDistrito int identity,
NombreDistrito varchar(50),
CodCant int,
CONSTRAINT PK_Codigodis PRIMARY KEY (CodDistrito),
CONSTRAINT FK_codcan FOREIGN KEY (CodCant) References Canton (CodCanton)
)
Insert into Distrito (NombreDistrito,CodCant) values ('Carmen',1),('Merced',1),('Hospital',1),('Catedral',1)

delete Cliente

Create Procedure Selectdidtrito
@Codigo int 
as 
begin
Select d.CodDistrito,d.NombreDistrito
from Distrito d
inner join Canton ca on d.CodCant = ca.CodCanton where ca.CodCanton = @Codigo
end

create procedure AgregarDistrito
@Distrito nvarchar(50),
@cdd int
as
begin
Insert into Distrito(NombreDistrito,CodCant) values (@Distrito,@cdd)
end

create procedure EliminarDistrito
@cdd int
as
begin
delete Distrito where CodDistrito = @cdd
end

----------DIRECCION----------
create table Direccion
(
CodDireccion int identity,
CodCliente int,
CodProv int,
CodCant int,
CodDis int,
Señas nvarchar(100),
CONSTRAINT PK_Codidirec PRIMARY KEY (CodDireccion),
CONSTRAINT FK_codcli1 FOREIGN KEY (CodCliente) References Cliente (Codigo),
CONSTRAINT FK_codprov1 FOREIGN KEY (CodProv) References Provincia (CodProvincia),
CONSTRAINT FK_codcan1 FOREIGN KEY (CodCant) References Canton (CodCanton),
CONSTRAINT FK_coddis1 FOREIGN KEY (CodDis) References Distrito (CodDistrito)
)

-------------USUARIO-----------------

create table Usuario
(
CodUsuario int,
Email nvarchar(100),
Clave nvarchar(20),
NombreUsuario nvarchar(50),
CONSTRAINT PK_Codigo PRIMARY KEY (CodUsuario),
CONSTRAINT FK_Email FOREIGN KEY (Email) References Cliente (Email),
)

alter Procedure ValidarUsuario
@email nvarchar(50),
@clave nvarchar(30)
as
begin
	Select u.Email, u.Clave, c.Tipo, c.Codigo 
	from Usuario U
	inner Join  Cliente c on U.Email = c.Email where U.Email = @email and Clave = @clave 
end

---------------VER CLIENTE-------
create Procedure ListarCliente
@nombre nvarchar(100),
@correo nvarchar(100)
as
begin
Select cl.Codigo,cl.Nombre,cl.Apellido,cl.Email,cl.Telefono,cl.Tipo,d.CodProv,d.CodCant,d.CodDis,d.Señas
from Cliente cl
inner Join Direccion d on cl.Codigo = d.CodCliente where  cl.Nombre + ' ' + cl.Apellido = @nombre or cl.Email = @correo 
end

create procedure VerCliente
@Cod int
as
begin
select Nombre , Apellido from Cliente where Codigo = @cod
end

create Procedure VerTodos
as 
	begin
Select cl.Codigo,cl.Nombre,cl.Apellido,cl.Email,cl.Telefono,cl.Tipo,pr.NombreProv,ca.Nombrecant,dis.NombreDistrito,d.Señas
from Cliente cl
inner Join Direccion d on cl.Codigo = d.CodCliente
inner join Provincia pr on d.CodProv = pr.CodProvincia
inner join Canton ca on d.CodCant = ca.CodCanton
inner join Distrito dis on d.CodDis = dis.CodDistrito
	end

------Facturacion---------

create table Prducto
(
Codigo int identity(1,5) ,
NombreProducto nvarchar(50),
Precio money
CONSTRAINT PK_Producto PRIMARY KEY (Codigo)
)
create Procedure IngresarProducto
@Nombre nvarchar(100),
@precio money
as
begin
insert into Prducto (NombreProducto,Precio) values (@Nombre, @Precio)
end

exec IngresarProducto 'Powerrade','989.5'

create Procedure ModificarProducto
@Codigo int,
@Nombre nvarchar(100),
@precio money
as
begin
update Prducto set NombreProducto = @Nombre, Precio = @Precio where Codigo = @Codigo
end

create Procedure EliminarProducto
@Codigo int
as
begin
delete Prducto where Codigo = @Codigo
end	

create Procedure VerProducto
@Nombre nvarchar(100)
as
begin
Select Codigo,NombreProducto,Precio from Prducto where NombreProducto = @Nombre
end	

create Procedure VerProductoC
@Codigo int
as
begin
Select NombreProducto,Precio from Prducto where Codigo = @Codigo
end	

exec VerProductoC 56

create Procedure VerProductos
as
begin
Select *from Prducto
end	

--------------------------------------


create table Mae_Factura
(
N_Fac int identity,
Fecha date default Getdate(),
CodCliente int,
Total money,
IVATotal money,
Subtotal money
CONSTRAINT PK_Mfac PRIMARY KEY (N_Fac),
CONSTRAINT FK_Codcl FOREIGN KEY (CodCliente) REFERENCES Cliente (Codigo)
)

create Procedure Maefactura
@CodCliente int,
@Total money,
@subtotal money,
@IVA money
as
begin
Declare @FECHA datetime
set @fecha = GETDATE()
INSERT INTO Mae_Factura (Fecha, CodCliente, Subtotal,IVATotal,Total) values (@FECHA,@CodCliente,@subtotal,@IVA,@Total)
end



--------------------------

create table Det_Factura
(
Codigo int identity,
N_fac int,
CodPro int,
Cantidad int,
Linea int,
Precio_unid money
CONSTRAINT PK_Dfac PRIMARY KEY (Codigo),
CONSTRAINT FK_nfac FOREIGN KEY (N_fac) REFERENCES Mae_Factura (N_Fac)
)

create procedure DetFactura
@linea int,
@codpro int,
@cantidad int,
@precio money
as
begin
declare @Nfac int
set @Nfac = (select top 1 N_Fac from Mae_Factura order by N_Fac desc)
insert into Det_Factura (N_fac,Linea,CodPro,Cantidad,Precio_unid) values (@Nfac,@linea,@codpro,@cantidad,@precio)
end

select * from Cliente
select * from Det_Factura

create procedure VerFactura
@Codigo int
as
begin
Select mf.N_Fac,mf.Fecha,mf.CodCliente,cl.Nombre,cl.Apellido,mf.Subtotal,mf.IVATotal,mf.Total 
from Mae_Factura mf
inner Join Cliente cl  on mf.CodCliente = cl.Codigo where mf.N_fac = @Codigo
end

create procedure VerFacturaD
@Codigo int
as
begin
Select df.CodPro, p.NombreProducto, df.Cantidad,df.Precio_unid
from Det_Factura df
inner Join Mae_Factura mf  on mf.N_fac = df.N_fac 
inner Join Prducto p on df.CodPro = p.Codigo where mf.N_fac = @Codigo
end