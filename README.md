# Desafío "Entendiendo cómo se comportan nuestros clientes"

## Requerimientos:
1. Cargar el respaldo de la base de datos unidad2.sql.
2. El cliente usuario01 ha realizado la siguiente compra:
  - Producto: producto9.
  - Cantidad: 5.
  - Fecha: fecha del sistema.    

   Mediante el uso de transacciones, realiza las consultas correspondientes para este requerimiento y luego consulta la tabla producto para validar si fue efectivamente descontado en el stock.

![primera-compra-exitosa](https://user-images.githubusercontent.com/98556305/163292594-e6102e8e-86a5-4461-9a8d-cf1610e3f4d4.png)

3. El cliente usuario02 ha realizado la siguiente compra:
  - Producto: producto1, producto 2, producto 8.
  - Cantidad: 3 de cada producto.
  - Fecha: fecha del sistema.    
  
  Mediante el uso de transacciones, realiza las consultas correspondientes para este requerimiento y luego consulta la tabla producto para validar que si alguno de ellos se queda sin stock, no se realice la compra.

![image](https://user-images.githubusercontent.com/98556305/163297132-b39e9023-bf23-48c0-afea-142160d89c0e.png)
![image](https://user-images.githubusercontent.com/98556305/163297164-06b10b48-0dd5-4e07-9d8a-72a9af5caac4.png)
