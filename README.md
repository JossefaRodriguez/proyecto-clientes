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
INSERT INTO compra (id, cliente_id, fecha) VALUES (33, 1, '2202-04-13');
INSERT INTO detalle_compra (id, producto_id, compra_id, cantidad) VALUES (43, 9, 33, 5);
SELECT stock FROM producto WHERE id = 9;
```
![image](https://user-images.githubusercontent.com/98556305/163300347-eafae547-131b-4f42-9e23-90ad32d27e05.png)

```sql
UPDATE producto SET stock = stock - 5 WHERE id = 9;
SELECT stock FROM producto WHERE id = 9;
COMMIT;
```


3. El cliente usuario02 ha realizado la siguiente compra:
  - Producto: producto1, producto 2, producto 8.
  - Cantidad: 3 de cada producto.
  - Fecha: fecha del sistema.    
  
  Mediante el uso de transacciones, realiza las consultas correspondientes para este requerimiento y luego consulta la tabla producto para validar que si alguno de ellos se queda sin stock, no se realice la compra.

![image](https://user-images.githubusercontent.com/98556305/163297132-b39e9023-bf23-48c0-afea-142160d89c0e.png)
![image](https://user-images.githubusercontent.com/98556305/163297164-06b10b48-0dd5-4e07-9d8a-72a9af5caac4.png)

 4. Realizar las siguientes consultas:
 
  4.1 Deshabilitar el AUTOCOMMIT.

![image](https://user-images.githubusercontent.com/98556305/163297612-166a4327-0537-449c-982b-f1f97214f4d8.png)

  4.2 Insertar un nuevo cliente.    
  4.3 Confirmar que fue agregado en la tabla cliente.    
  4.4 Realizar un ROLLBACK.    
  4.5 Confirmar que se restauró la información, sin considerar la inserción del punto 4.2.    
  4.6 Habilitar de nuevo el AUTOCOMMIT.
 
 ![image](https://user-images.githubusercontent.com/98556305/163299024-dff5d1e9-4f79-4223-9760-830797aa4901.png)
 ![image](https://user-images.githubusercontent.com/98556305/163299087-f9f57c41-03f8-45f1-af84-ba8eacdb795c.png)

