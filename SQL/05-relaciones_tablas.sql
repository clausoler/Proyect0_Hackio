
-- Ejercicio  1: Encuentra el nombre de las pistas y los títulos de los álbumes a los que pertenecen.
SELECT t."Name" AS "Track_Name" , a."Title" AS "Album_Title"
FROM "Track" as "t"
INNER JOIN "Album" as "a" 
on t."AlbumId" = a."AlbumId";

-- Ejercicio 2: Lista los nombres de los artistas y los títulos de sus álbumes. Ordena los resultados por artista.
SELECT ar."Name" AS "Artist_Name" , al."Title" AS "Album_Title"
FROM "Artist" as "ar"
INNER JOIN "Album" as "al"
ON ar."ArtistId" = al."ArtistId"
ORDER BY "Artist_Name";

-- Ejercicio 3: Encuentra los nombres de los clientes y los totales de sus facturas. Extrae solo los 5 clientes con mayor total. 
SELECT c."FirstName" as "nombre_clientes" , SUM(i."Total") AS "Total_factura"
FROM "Customer" as "c"
INNER JOIN "Invoice" as "i"
ON c."CustomerId" = i."CustomerId"
GROUP BY c."FirstName"
ORDER BY "Total_factura" DESC
LIMIT 5;

-- Ejercicio 4: Lista los nombres de los empleados y los nombres de los clientes que les han sido asignados.
SELECT CONCAT(e."FirstName" , ' ' , e."LastName") AS "nombre_empleado" , CONCAT(c."FirstName" , '' , c."LastName") AS "nombre_cliente"
FROM "Employee" as "e"
INNER JOIN "Customer" as "c"
ON e."EmployeeId" = c."SupportRepId"
ORDER BY e."FirstName" , e."LastName";

-- Ejercicio 5: Muestra los ID de las facturas y los nombres de las pistas incluidas en esas facturas.
select il."InvoiceLineId" as "ID_facturas", t."Name" as "nombre_pistas"
from "InvoiceLine" as "il"
inner join "Track" as "t"
on il."TrackId" = t."TrackId"
order by il."InvoiceLineId" , t."Name";

-- Ejercicio 6: Encuentra los nombres de los artistas y los géneros de sus pistas.
SELECT a."Name" AS "nombre_artista" , g."Name" AS "género_pistas"
FROM "Artist" as "a"
INNER JOIN "Album" as "al"
ON a."ArtistId" = al."ArtistId"
INNER JOIN "Track" as "t"
ON al."AlbumId" = t."AlbumId"
INNER JOIN "Genre" as "g"
ON t."GenreId" = g."GenreId"
ORDER BY a."Name", g."Name";

--  Ejercicio 7: Muestra los nombres de las pistas y el tipo de medio en el que están disponibles.
SELECT t."Name" AS "nombre_pista" , mt."Name" AS "tipo_medio"
FROM "Track" as "t"
INNER JOIN "MediaType" as "mt"
ON t."MediaTypeId" = mt."MediaTypeId"
ORDER BY t."Name"
limit 100;

-- Ejercicio 8: Encuentra todas las pistas y, si existen, muestra los nombres de los géneros a los que pertenecen. Incluye también las pistas que no tienen un género asignado.**
SELECT t."Name" AS "nombre_pista" , g."Name" AS "genero_pista"
FROM "Track" as "t"
LEFT JOIN "Genre" as "g"
ON t."GenreId" = g."GenreId"
ORDER BY t."Name";

-- Ejercicio 9: Muestra todos los clientes y, si existen, muestra las facturas que han realizado. Incluye también los clientes que no tienen ninguna factura.
SELECT c."FirstName" , c."LastName" , i."InvoiceId" , i."Total"
FROM "Customer" as "c"
LEFT JOIN "Invoice" as "i"
ON c."CustomerId" = i."CustomerId"
ORDER BY c."LastName" , c."FirstName";

-- Ejercico 10: Encuentra todos los álbumes y, si existen, muestra los nombres de los artistas que los crearon. Incluye también los álbumes que no tienen un artista asignado (aunque en este caso en la base de datos de Chinook, todos los álbumes tienen un artista asignado).
SELECT al."Title" AS "título_album" , ar."Name" AS "nombre_artista"
FROM "Album" as "al"
LEFT JOIN "Artist" as "ar"
ON al."ArtistId" = ar."ArtistId"
ORDER BY al."Title";

-- Ejercicio 11: Cuenta cuántas pistas hay en cada género. Ordena los generos en función del número de canciones de mayor a menor. 
SELECT g."Name" AS "género_pista" , COUNT(t."TrackId") AS "número_canciones"
FROM "Genre" as "g"
INNER JOIN "Track" as "t"
ON g."GenreId" = t."GenreId"
GROUP BY g."Name"
ORDER BY "número_canciones" DESC;

--  Ejercicio 12: Muestra los títulos de los álbumes y la duración total de todas las pistas en cada álbum.
SELECT a."Title" AS "titulo_album" , SUM(t."Milliseconds") AS "duracion_total"
FROM "Album" a 
INNER JOIN "Track" as "t"
ON a."AlbumId" = t."AlbumId"
GROUP BY a."Title"
ORDER BY "duracion_total";

-- Ejercicio 14: Encuentra los nombres de los clientes y el total gastado por cada uno.
SELECT CONCAT(c."FirstName" , ' ', c."LastName") AS "nombre_cliente" , SUM(i."Total") AS "total_gastado"
FROM "Customer" as "c" 
INNER JOIN "Invoice" as "i"
ON c."CustomerId" = i."CustomerId"
GROUP BY c."CustomerId" , c."FirstName" , c."LastName"
ORDER BY "total_gastado" DESC;

-- Ejercicio 15: Encuentra todos los empleados y, si existen, muestra los nombres de los clientes que tienen asignados. Incluye también los empleados que no tienen clientes asignados.
SELECT CONCAT(e."FirstName" , ' ', e."LastName") AS "nombre_empleado" , CONCAT(c."FirstName" , ' ', c."LastName") AS "nombre_cliente"
FROM "Employee" as "e"
LEFT JOIN "Customer" as "c"
ON e."EmployeeId" = c."SupportRepId"
ORDER by "nombre_cliente";



