
/* MIN y MAX */

-- Ejercicio 1: Encontrar la duración mínima de las pistas en milisegundos.
select min("Milliseconds") as "Min_Duration"
from "Track" t ;

-- Ejercicio 2: Encontrar la duración máxima de las pistas en milisegundos.
select max("Milliseconds") as "Max_Duration"
from "Track" t ;

-- Ejercicio 3: Encontrar el precio mínimo de las pistas.
select min("UnitPrice") as "Min_Price"
from "Track" t ;

-- Ejercicio 4: Encontrar el precio máximo de las pistas.
select max("UnitPrice") as "Max_Price"
from "Track" t ;
 
-- Ejercicio 5: Encontrar la fecha mínima de la factura.
select min("InvoiceDate") as "Min_Invoice_Date"
from "Invoice" i ;

-- Ejercicio 6: Encontrar la fecha máxima de la factura.
select max("InvoiceDate") as "Max_Invoice_Date"
from "Invoice" i ;
  
/* COUNT y SUM */

-- Ejercicio 7: Contar el número total de pistas.
select count(*) as "Total_Tracks"
from "Track" t ;

-- Ejercicio 8: Contar el número de clientes en Brasil.
select count(*) as "Total_Customers_In_Brazil"
from "Customer" c 
where "Country" = 'Brazil';
  
-- Ejercicio 9: Sumar la duración total de todas las pistas en milisegundos.
select sum("Milliseconds") as "Total_Duration_Milliseconds"
from "Track" t ;
 
-- Ejercicio 10: Contar el número de empleados con el título 'Sales Support Agent'.
select count(*) as "Total_Sales_Support_Agents"
from "Employee" e 
where "Title" = 'Sales Support Agent';
  
-- Ejercicio 11: Sumar el total de las cantidades en las facturas.
select sum("Total") as "Total_Invoice_Amount"
from "Invoice" i ;
   
/* AVG, STDDEV, VARIANCE */

-- Ejercicio 12: Calcular la duración media de las pistas en milisegundos.
select round(AVG("Milliseconds"), 2) as "Average_Duration_Milliseconds"
from "Track" t ;
  
-- Ejercicio 13: Calcular el precio medio de las pistas.
select round(AVG("UnitPrice"), 2) as "Average_Price"
from "Track" t ;
  
-- Ejercicio 14: Calcular la desviación estándar de la duración de las pistas.
select round(STDDEV("Milliseconds"), 2) as "Duration_StdDev"
from "Track" t ;
 
-- Ejercicio 15: Calcular la varianza de la duración de las pistas.
select round(VARIANCE("Milliseconds"), 2) as "Duration_Variance"
from "Track" t ;

-- Ejercicio 16: Calcular la desviación estándar del precio de las pistas.
select round(STDDEV("UnitPrice"), 2) as "Price_StdDev"
from "Track" t ;

/* CONCAT */

-- Ejercicio 17: Concatenar el nombre y el apellido de los clientes.
select CONCAT("FirstName", ' ', "LastName") as "FullName"
from "Customer" c ;


