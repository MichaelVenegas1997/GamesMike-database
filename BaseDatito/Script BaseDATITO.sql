CREATE DATABASE GamesMike;

use GamesMike;


CREATE TABLE Ventas (
     
	 Numero_boleta int  primary key ,
     Fecha date not null,
     Iva int not null,
     Total int  not null,
     Cantidad int not null,
	 Correo varchar(50),
	 FOREIGN KEY (Correo) references Clientes(Correo)
     
);

Alter table Ventas drop column Iva;
Alter table Ventas drop column Cantidad;
CREATE TABLE Clientes (

	  Correo varchar(50) primary key ,
      Nombre varchar(100) not null,
      Direccion varchar(50) not null
      
);

CREATE TABLE Detalle_Ventas (
		ID_Detalle int auto_increment primary key,
        Item_Id int not null,
        Numero_boleta int,
        FOREIGN KEY (Numero_boleta) references Ventas(Numero_boleta),
        Correo varchar(50),
        FOREIGN KEY (Correo) references Clientes(Correo),
        FOREIGN KEY (Item_Id) references Productos(Item_Id)

);

CREATE TABLE Productos (
		Item_Id int primary key,
        Titulo varchar(100) not null,
        Precio_unitario int not null,
        Plataforma_Id int not null,
        FOREIGN KEY(Plataforma_Id) references Plataformas(Plataforma_Id)

);

ALTER TABLE Productos
DROP COLUMN Plataforma;

ALTER TABLE Productos
ADD Plataforma_Id INT NOT NULL;

ALTER TABLE Productos
ADD FOREIGN KEY (Plataforma_Id) REFERENCES Plataformas(Plataforma_Id);

CREATE TABLE Plataformas (
		Plataforma_Id int primary key,
        Marca varchar(100) not null
        
);

INSERT INTO Plataformas (Plataforma_Id,Marca)
values (1,'XBOX');

INSERT INTO Plataformas (Plataforma_Id,Marca)
values (2,'PLAYSTATION');

SELECT * FROM Plataformas;


INSERT INTO Clientes (Correo,Nombre,Direccion)
values('janitoGOD@GMAIL.COM','Janito Alcachofa','Pasaje las aceitunas');

INSERT INTO Clientes (Correo,Nombre,Direccion)
values('RORO12@GMAIL.COM','Rodrigo Ronaldo','Pasaje CR7');

SELECT * FROM Clientes;


INSERT Productos (Item_Id,Titulo,Precio_unitario,Plataforma_Id)
values(1,'GOD OF WAR',45000,2);

INSERT Productos (Item_Id,Titulo,Precio_unitario,Plataforma_Id)
values(2,'MARIO KART 10',35000,1);

SELECT * FROM Productos;


INSERT INTO Ventas ( Numero_boleta ,Fecha,Total,Correo)
values(1001,'2024-08-14',45000,'janitoGOD@GMAIL.COM');

INSERT INTO Ventas ( Numero_boleta ,Fecha,Total,Correo)
values(1002,'2024-08-14',35000,'RORO12@GMAIL.COM');

SELECT * FROM Ventas;

INSERT INTO Detalle_Ventas(Item_Id,Numero_boleta,Correo)
values (1,1001,'janitoGOD@GMAIL.COM');
INSERT INTO Detalle_Ventas(Item_Id,Numero_boleta,Correo)
values (2,1002,'RORO12@GMAIL.COM');


SELECT * FROM Detalle_Ventas;


SELECT 
    v.Numero_boleta,
    p.Titulo,
    p.Precio_unitario,
    pla.Marca AS Plataforma,
    v.Fecha,
    v.Total,
    c.Nombre AS Nombre_Usuario,
    c.Direccion AS Direccion_Usuario,
    c.Correo AS Correo_Usuario
FROM 
    Detalle_Ventas dv
JOIN 
    Ventas v ON dv.Numero_boleta = v.Numero_boleta
JOIN 
    Productos p ON dv.Item_Id = p.Item_Id
JOIN 
    Clientes c ON v.Correo = c.Correo
JOIN 
    Plataformas pla ON p.Plataforma_Id = pla.Plataforma_Id;

