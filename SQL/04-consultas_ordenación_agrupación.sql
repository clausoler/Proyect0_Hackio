
-- Ejercicio 1:  Selecciona el nombre de todos los álbumes y ordénalos alfabéticamente.
SELECT "Title"
FROM "Album" a 
ORDER BY "Title";

-- Ejercicio 2:  Encuentra el álbum con el mayor número de canciones.
select "AlbumId" as "max_album_canciones", count ("TrackId") as "number_canciones"
from "Track" t 
group by "AlbumId" 
order by "number_canciones" desc 
limit 1;
 
-- Ejercicio 3:  Calcula la duración promedio, desviación estándar y varianza por compositor.
SELECT "Composer" , AVG("Milliseconds") AS "duración_promedio" , STDDEV("Milliseconds") AS "desviación_estándar" , VARIANCE("Milliseconds") AS "varianza_compositor"
FROM "Track" t 
GROUP BY "Composer";

-- Ejercicio 4: Selecciona el título y el precio de las pistas, y limita los resultados a 10.
SELECT "Name" as "nombre_pistas" , "UnitPrice" as "precio_pistas"
FROM "Track" t 
LIMIT 10;

-- Ejercicio 5: Lista los nombres de los empleados y ordénalos por el ID del empleado en orden descendente.
SELECT "FirstName" as "Nombre_empleado" , "LastName" as "Apellido_empleado", "EmployeeId" as "ID_empleado"
FROM "Employee" e 
ORDER BY "ID_empleado" DESC;

-- Ejercicio 6:  Muestra el número de géneros distintos disponibles en la base de datos.
SELECT COUNT(DISTINCT "Name") AS "género_distinto"
FROM "Genre" g ;

-- Ejercicio 7: Selecciona el nombre del cliente y el país, limitando los resultados a 5, y ordena por el nombre del cliente.
SELECT "FirstName" as "nombre_empleado" , "LastName" as "apellido_empleado", "Country" as "país"
FROM "Customer" c 
ORDER BY "nombre_empleado"
LIMIT 5;
   
-- Ejercicio 8: Muestra la cantidad total de clientes agrupados por país.
SELECT "Country" as "País" , COUNT("CustomerId") AS "Total_clientes"
FROM "Customer" c 
GROUP BY "Country";

-- Ejercicio 9: Obtén el total de importes de facturas para cada país y muestra solo aquellos con un total superior a 10,000.
SELECT "BillingCountry" as "País_origen" , SUM("Total") AS "Total_factura"
FROM "Invoice" i 
GROUP BY "BillingCountry" 
HAVING SUM("Total") > 10.000;
 
-- Ejercicio 10: Encuentra los países donde el número total de clientes es mayor a 5. Muestra el país y el número de clientes.
SELECT "Country" , COUNT("CustomerId") AS "Total_clientes"
FROM "Customer" c 
GROUP BY "Country"
HAVING COUNT("CustomerId") > 5;

-- Ejercicio 11: Obtén la cantidad de pistas en cada tipo de medio (MediaType) que tienen una duración mayor a 250,000 milisegundos.
SELECT "MediaTypeId" , COUNT("TrackId") AS "número_pistas", "Milliseconds" as "Milisegundos"
FROM "Track" t 
WHERE "Milliseconds" > 250000
GROUP BY "MediaTypeId", "TrackId", "Milliseconds"
order by "Milliseconds";

-- Ejercicio 12: Lista el país y el número total de clientes que han sido asistidos por un representante de ventas específico, cuyo ID sea menor a 5.
SELECT "Country" , COUNT("CustomerId") AS "Total_Clientes", "SupportRepId" as "ID_cliente"
FROM "Customer" c 
WHERE "SupportRepId" < 5
GROUP BY "Country", "SupportRepId"
order by "ID_cliente"
 
-- Ejercicio 13: Muestra los códigos postales (BillingPostalCode) de los clientes que han hecho más de 5 compras.
select "CustomerId" AS "Num_clientes", "BillingPostalCode" as "código_postal", count ("InvoiceId") as "num_compras"
from "Invoice" i
group by "Num_clientes", "código_postal"
having count ("InvoiceId") >5
order by "num_compras";
 
-- Ejercicio 14: Encuentra la cantidad total de pistas en cada tipo de medio (MediaTypeId) donde el precio de la pista (UnitPrice) es mayor a 0.99 y la duración de la pista (Milliseconds) es mayor a 200,000. Muestra el tipo de medio y el número total de pistas.
select "MediaTypeId" as "tipo_medio", count ("TrackId") as "total_pistas"
from "Track" t 
where "UnitPrice" > 0.99 and "Milliseconds" > 200000
group by "tipo_medio";


-- Ejercicio 15: Lista el país y el estado de los clientes que tienen el soporte asignado a un representante con ID mayor a 3 y cuyo nombre de empresa (Company) no es nulo. Muestra el país, el estado y el número de clientes.
SELECT "Country" , "State" , COUNT("CustomerId") AS "Total_clientes"
FROM "Customer" c 
WHERE "SupportRepId" > 3 AND "Company" IS NOT NULL
GROUP BY "Country" , "State"
order by "Country";
