CREATE DATABASE clientes_y_pedidos3;
GO
USE clientes_y_pedidos3; 


CREATE TABLE Clientes(
ClienteID INT PRIMARY KEY,
NombreCliente VARCHAR(50),
Contacto INT
);


INSERT INTO Clientes VALUES (1, 'Marco Lambert', 456443552)
INSERT INTO Clientes VALUES (2, 'Lydia Roderic', 445332221)
INSERT INTO Clientes VALUES (3, 'Ebbe Therese', 488982635)
INSERT INTO Clientes VALUES (4, 'Sofie Mariona', 412436773)



CREATE TABLE Pedidos(
PedidoID INT PRIMARY KEY,
ClienteID INT,
Factura INT,
Precio decimal(12,2),
producto varchar(20)
);
drop table Pedidos;
INSERT INTO Pedidos VALUES(234, 4, 160, 22.50, 'Mesa')
INSERT INTO Pedidos VALUES(235, 2, 48, 37.90, 'Silla')
INSERT INTO Pedidos VALUES(236, 3, 64, 59.90, 'Sofa')
INSERT INTO Pedidos VALUES(237, 4, 92, 79.90, 'Colchon')

select * from Clientes;
select * from Pedidos;

--1. Listar los clientes que tienen algun pedido => Añadir campo "Contacto" a esta consulta
select * from clientes;

SELECT NombreCliente AS 'NombreCliente - Lista de los clientes que tienen algun pedido', Contacto
FROM Clientes
WHERE ClienteID IN (SELECT ClienteID FROM Pedidos);



--2. Listar los clientes que NO tienen algun pedido

SELECT NombreCliente AS 'NombreCliente - Lista de los clientes que NO tienen algun pedido', Contacto
FROM Clientes
WHERE ClienteID NOT IN (SELECT ClienteID FROM Pedidos);



--3. Listar los pedidos de Sofie Mariona

SELECT 'Sofie Mariona' AS 'Cliente', PedidoID, producto , precio
FROM pedidos
WHERE CLienteID IN (SELECT CLienteID FROM Clientes WHERE NombreCliente = 'Sofie Mariona')
--4. Listar los pedidos de Sofie Mariona, mayores de 50 €

SELECT 'Pedidos mayores de 50€', PedidoID, producto, precio
FROM pedidos
WHERE CLienteID IN (SELECT CLienteID FROM Clientes WHERE NombreCliente = 'Sofie Mariona') AND precio > 50



--5. Listar los clientes que han hecho pedidos > 50 €
SELECT NombreCliente 
FROM Clientes
WHERE ClienteID IN (SELECT ClienteID FROM pedidos WHERE precio > 70)

--5(b). Listar los pedidos > 50 €... ¿hace falta subconsulta con SELECT? ¿Por qué?

sel



--6. Listar los nombres de los clientes que han realizado pedidos de "Mesa"

select NombreCliente, ClienteID, Contacto 
from Clientes
where ClienteID IN (select ClienteID from pedidos where producto = 'Mesa');

--b. listar los nombres de los clientes que han realizdo pedidos de <otro producto que quearais>

select NombreCliente, ClienteID, Contacto 
from Clientes
where ClienteID IN (select ClienteID from pedidos where producto = 'Sofa');



-- Renombrar el nombre de un campo (sólo SQL SERVER)
EXEC sp_rename '<nombre_tabla>.<nombre_actual_campo>',  '<nombre_nuevo_campo>', 'COLUMN';  --Formato del comando 
EXEC sp_rename 'pedidos.un_nombre_incorrecto',  'producto', 'COLUMN';                      --Un ejemplo real del comando