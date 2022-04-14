# Desafío "Entendiendo cómo se comportan nuestros clientes"

## Requerimientos:
1. Cargar el respaldo de la base de datos `unidad2.sql`.
2. El cliente usuario01 ha realizado la siguiente compra:
  - Producto: producto9.
  - Cantidad: 5.
  - Fecha: fecha del sistema.    

   Mediante el uso de transacciones, realiza las consultas correspondientes para este requerimiento y luego consulta la tabla producto para validar si fue efectivamente descontado en el stock.

```sql
BEGIN;
INSERT INTO compra (id, cliente_id, fecha) VALUES (33, 1, '2022-04-13');
INSERT INTO detalle_compra (id, producto_id, compra_id, cantidad) VALUES (43, 9, 33, 5);
SELECT stock FROM producto WHERE id = 9;
```
![image](https://user-images.githubusercontent.com/98556305/163300347-eafae547-131b-4f42-9e23-90ad32d27e05.png)

```sql
UPDATE producto SET stock = stock - 5 WHERE id = 9;
SELECT stock FROM producto WHERE id = 9;
```

![image](https://user-images.githubusercontent.com/98556305/163301286-03c6669c-9b96-43ab-b61e-72bdce00f9e0.png)

```sql
COMMIT;
```


3. El cliente usuario02 ha realizado la siguiente compra:
  - Producto: producto1, producto 2, producto 8.
  - Cantidad: 3 de cada producto.
  - Fecha: fecha del sistema.    
  
  Mediante el uso de transacciones, realiza las consultas correspondientes para este requerimiento y luego consulta la tabla producto para validar que si alguno de ellos se queda sin stock, no se realice la compra.

```sql
BEGIN;
INSERT INTO compra (id, cliente_id, fecha) VALUES (34, 2, '2022-04-13');
INSERT INTO detalle_compra (id, producto_id, compra_id, cantidad) VALUES (44, 1, 34, 3);
SELECT stock FROM producto WHERE id = 1;
```

![image](https://user-images.githubusercontent.com/98556305/163301672-d00d4f12-3338-48af-9277-e3936921a482.png)

```sql
UPDATE producto SET stock = stock - 3 WHERE id = 1;
SELECT stock FROM producto WHERE id = 1;
```
![image](https://user-images.githubusercontent.com/98556305/163301722-bd3493a9-78da-4137-bc7b-7ef434c26207.png)

```sql
SAVEPOINT producto_1_agregado;
INSERT INTO detalle_compra (id, producto_id, compra_id, cantidad) VALUES (45, 2, 34, 3);
SELECT stock FROM producto WHERE id = 2;
```

![image](https://user-images.githubusercontent.com/98556305/163301816-dd538ae4-580e-44cd-a4a1-c0db6187f4c1.png)

```sql
UPDATE producto SET stock = stock - 3 WHERE id = 2;
SELECT stock FROM producto WHERE id = 2;
```

![image](https://user-images.githubusercontent.com/98556305/163301845-1a218b05-ee05-4b66-b39a-79888a2fd2e6.png)

```sql
SAVEPOINT producto_2_agregado;
INSERT INTO detalle_compra (id, producto_id, compra_id, cantidad) VALUES (46, 8, 34, 3);
SELECT stock FROM producto WHERE id = 8;
```

![image](https://user-images.githubusercontent.com/98556305/163301867-3ceccb24-18e5-4e87-bde6-ade8dcfe231a.png)

```sql
ROLLBACK;
```

 4. Realizar las siguientes consultas:
 
  4.1 Deshabilitar el AUTOCOMMIT.

![image](https://user-images.githubusercontent.com/98556305/163302244-12cf6f07-abfe-4c8c-890f-bd473986bf40.png)

  4.2 Insertar un nuevo cliente.    
  4.3 Confirmar que fue agregado en la tabla cliente.    
  4.4 Realizar un ROLLBACK.    

```sql
BEGIN;
SELECT * FROM cliente;
```
![image](https://user-images.githubusercontent.com/98556305/163302453-dc566e76-4245-4f04-9dba-cd901ab7daae.png)

```sql
INSERT INTO cliente(id, nombre, email) VALUES (11, 'Lili Ramirez', 'gataprogramadora@gmail.com');
SELECT * FROM cliente;
```
![image](https://user-images.githubusercontent.com/98556305/163302489-a97e30b2-ad42-4e47-98c2-a86405dede6e.png)

```sql
ROLLBACK;
```

  4.5 Confirmar que se restauró la información, sin considerar la inserción del punto 4.2.   
  
```sql
SELECT * FROM cliente;
```

![image](https://user-images.githubusercontent.com/98556305/163302453-dc566e76-4245-4f04-9dba-cd901ab7daae.png)

  4.6 Habilitar de nuevo el AUTOCOMMIT.
  
![image](https://user-images.githubusercontent.com/98556305/163302722-fc42462d-29be-474c-ae36-2a2771d6d70d.png)
