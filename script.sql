-- Crear DB
CREATE DATABASE sistema_ventas;

/*
Acceder a DB
\c sistema_ventas
*/

/*
Importar backup DB
psql -U postgres sistema_ventas < C:\Users\rodri\Documents\src\modulo-5\proyecto-clientes\proyecto-clientes\respaldo-base-datos\unidad2.sql
*/

-- Primera compra usuario01
BEGIN;
INSERT INTO compra (id, cliente_id, fecha) VALUES (33, 1, '2022-04-13');
INSERT INTO detalle_compra (id, producto_id, compra_id, cantidad) VALUES (43, 9, 33, 5);
SELECT stock FROM producto WHERE id = 9;
UPDATE producto SET stock = stock - 5 WHERE id = 9;
SELECT stock FROM producto WHERE id = 9;
COMMIT;

-- Segunda compra usuario02
BEGIN;
INSERT INTO compra (id, cliente_id, fecha) VALUES (34, 2, '2022-04-13');
INSERT INTO detalle_compra (id, producto_id, compra_id, cantidad) VALUES (44, 1, 34, 3);
SELECT stock FROM producto WHERE id = 1;
UPDATE producto SET stock = stock - 3 WHERE id = 1;
SELECT stock FROM producto WHERE id = 1;
SAVEPOINT producto_1_agregado;
INSERT INTO detalle_compra (id, producto_id, compra_id, cantidad) VALUES (45, 2, 34, 3);
SELECT stock FROM producto WHERE id = 2;
UPDATE producto SET stock = stock - 3 WHERE id = 2;
SELECT stock FROM producto WHERE id = 2;
SAVEPOINT producto_2_agregado;
INSERT INTO detalle_compra (id, producto_id, compra_id, cantidad) VALUES (46, 8, 34, 3);
SELECT stock FROM producto WHERE id = 8;
ROLLBACK;

/*
Comprobar config autocommit
\echo :AUTOCOMMIT
*/

/*
Deshabilitar AUTOCOMMIT
\set AUTOCOMMIT off
*/

-- Insertar nuevo cliente
BEGIN;
SELECT * FROM cliente;
INSERT INTO cliente(id, nombre, email) VALUES (11, 'Lili Ramirez', 'gataprogramadora@gmail.com');
SELECT * FROM cliente;
ROLLBACK;
