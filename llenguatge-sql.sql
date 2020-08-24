USE tienda;

#1.1.3 Consultas sobre una tabla (Parte obligatoria del ejercicio IT ACADEMY)

#1.1.3-1. Lista el nombre de todos los productos que hay en la tabla producto.
SELECT DISTINCT(nombre) FROM producto ORDER BY nombre ASC;

#1.1.3-2. Lista los nombres y los precios de todos los productos de la tabla producto.
SELECT DISTINCT(nombre), precio FROM producto ORDER BY nombre ASC;

#1.1.3-3. Lista todas las columnas de la tabla producto.
SELECT * FROM producto;

#1.1.3-4. Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).
SELECT 
	DISTINCT(nombre), 
    precio AS euros,
    ROUND(precio * 1.18,2) AS dolares
FROM producto ORDER BY nombre ASC;

#1.1.3-5. Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD). Utiliza los siguientes alias para las columnas: nombre de producto, euros, dólares.
SELECT 
	DISTINCT(nombre) AS 'nombre de producto', 
    precio AS euros,
    ROUND(precio * 1.18,2) AS 'dólares'
FROM producto ORDER BY nombre ASC;

#1.1.3-6. Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula.
SELECT DISTINCT(UPPER(nombre)), precio FROM producto ORDER BY nombre ASC;

#1.1.3-7. Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a minúscula.
SELECT DISTINCT(LOWER(nombre)), precio FROM producto ORDER BY nombre ASC;

#1.1.3-8. Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.
SELECT
	DISTINCT(nombre),
	LEFT(nombre,2) AS nombre_corto
FROM fabricante
ORDER BY nombre ASC

#1.1.3-9. Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio.
SELECT DISTINCT(nombre), ROUND(precio) FROM producto ORDER BY nombre ASC;

#1.1.3-10. Lista los nombres y los precios de todos los productos de la tabla producto, truncando el valor del precio para mostrarlo sin ninguna cifra decimal.
SELECT DISTINCT(nombre), TRUNCATE(precio,0) FROM producto ORDER BY nombre ASC;

#1.1.3-11. Lista el código de los fabricantes que tienen productos en la tabla producto.
SELECT F.codigo
FROM fabricante F
INNER JOIN producto P ON F.codigo = P.codigo_fabricante
ORDER BY F.codigo ASC;

#1.1.3-12. Lista el código de los fabricantes que tienen productos en la tabla producto, eliminando los códigos que aparecen repetidos.
SELECT DISTINCT(F.codigo)
FROM fabricante F
INNER JOIN producto P ON F.codigo = P.codigo_fabricante
ORDER BY F.codigo ASC;

#1.1.3-13. Lista los nombres de los fabricantes ordenados de forma ascendente.
SELECT DISTINCT(nombre)
FROM fabricante
ORDER BY nombre ASC

#1.1.3-14. Lista los nombres de los fabricantes ordenados de forma descendente.
SELECT DISTINCT(nombre)
FROM fabricante
ORDER BY nombre DESC

#1.1.3-15. Lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente y en segundo lugar por el precio de forma descendente.
SELECT DISTINCT(nombre), precio
FROM producto
ORDER BY nombre ASC, precio DESC

#1.1.3-16. Devuelve una lista con las 5 primeras filas de la tabla fabricante.
SELECT *
FROM fabricante
LIMIT 5

#1.1.3-17. Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. La cuarta fila también se debe incluir en la respuesta.
SELECT *
FROM fabricante
WHERE codigo >= 4
ORDER BY codigo ASC
LIMIT 2

#1.1.3-18. Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas ORDER BY y LIMIT)
SELECT nombre, precio
FROM producto
ORDER BY precio ASC
LIMIT 1

#1.1.3-19. Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas ORDER BY y LIMIT)
SELECT nombre, precio
FROM producto
ORDER BY precio DESC
LIMIT 1

#1.1.3-20. Lista el nombre de todos los productos del fabricante cuyo código de fabricante es igual a 2.
SELECT DISTINCT(nombre)
FROM producto
WHERE codigo_fabricante = 2
ORDER BY nombre DESC

#1.1.3-21. Lista el nombre de los productos que tienen un precio menor o igual a 120€.
SELECT DISTINCT(nombre)
FROM producto
WHERE precio <= 120
ORDER BY nombre ASC

#1.1.3-22. Lista el nombre de los productos que tienen un precio mayor o igual a 400€.
SELECT DISTINCT(nombre)
FROM producto
WHERE precio >= 400
ORDER BY nombre ASC

#1.1.3-23. Lista el nombre de los productos que no tienen un precio mayor o igual a 400€.
SELECT DISTINCT(nombre)
FROM producto
WHERE precio < 400
ORDER BY nombre ASC

#1.1.3-24. Lista todos los productos que tengan un precio entre 80€ y 300€. Sin utilizar el operador BETWEEN.
SELECT DISTINCT(nombre)
FROM producto
WHERE precio >= 80 AND precio <= 300
ORDER BY nombre ASC

#1.1.3-25. Lista todos los productos que tengan un precio entre 60€ y 200€. Utilizando el operador BETWEEN.
SELECT DISTINCT(nombre)
FROM producto
WHERE precio BETWEEN 60 AND 200
ORDER BY nombre ASC

#1.1.3-26. Lista todos los productos que tengan un precio mayor que 200€ y que el código de fabricante sea igual a 6.
SELECT DISTINCT(nombre)
FROM producto
WHERE codigo_fabricante = 6
AND precio > 200
ORDER BY nombre DESC

#1.1.3-27. Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Sin utilizar el operador IN.
SELECT DISTINCT(nombre)
FROM producto
WHERE (codigo_fabricante = 1 OR codigo_fabricante = 3 OR codigo_fabricante = 5)
ORDER BY nombre DESC

#1.1.3-28. Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Utilizando el operador IN.
SELECT DISTINCT(nombre)
FROM producto
WHERE codigo_fabricante IN (1,3,5)
ORDER BY nombre DESC

#1.1.3-29. Lista el nombre y el precio de los productos en céntimos (Habrá que multiplicar por 100 el valor del precio). Cree un alias para la columna que contiene el precio que se llame céntimos.
SELECT 
	DISTINCT(nombre), 
    precio * 100 AS centimos
FROM producto ORDER BY nombre ASC;

#1.1.3-30. Lista los nombres de los fabricantes cuyo nombre empiece por la letra S.
SELECT DISTINCT(nombre)
FROM fabricante
WHERE LEFT(nombre,1) = 'S'
ORDER BY nombre ASC

#1.1.3-31. Lista los nombres de los fabricantes cuyo nombre termine por la vocal e.
SELECT DISTINCT(nombre)
FROM fabricante
WHERE RIGHT(nombre,1) = 'E'
ORDER BY nombre ASC

#1.1.3-32. Lista los nombres de los fabricantes cuyo nombre contenga el carácter w.
SELECT DISTINCT(nombre)
FROM fabricante
WHERE nombre LIKE '%W%'
ORDER BY nombre ASC

#1.1.3-33. Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres.
SELECT DISTINCT(nombre)
FROM fabricante
WHERE LENGTH(nombre) = 4
ORDER BY nombre ASC

#1.1.3-34. Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil en el nombre.
SELECT DISTINCT(nombre)
FROM producto
WHERE nombre LIKE '%Portátil%'
ORDER BY nombre ASC

#1.1.3-35. Devuelve una lista con el nombre de todos los productos que contienen la cadena Monitor en el nombre y tienen un precio inferior a 215 €.
SELECT DISTINCT(nombre)
FROM producto
WHERE nombre LIKE '%Monitor%'
AND precio <= 215
ORDER BY nombre ASC

#1.1.3-36. Lista el nombre y el precio de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente).
SELECT DISTINCT(nombre), precio
FROM producto
WHERE precio >= 180
ORDER BY precio DESC, nombre ASC


#1.1.4 Consultas multitabla (Parte voluntaria del ejercicio IT ACADEMY)

#1.1.4-1. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.
SELECT
	DISTINCT(P.nombre) AS producto,
	P.precio,
	F.nombre AS fabricante
FROM producto P
INNER JOIN fabricante F ON F.codigo = P.codigo_fabricante

#1.1.4-2. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos. Ordene el resultado por el nombre del fabricante, por orden alfabético.
SELECT
	DISTINCT(P.nombre) AS producto,
	P.precio,
	F.nombre AS fabricante
FROM producto P
INNER JOIN fabricante F ON F.codigo = P.codigo_fabricante
ORDER BY fabricante ASC

#1.1.4-3. Devuelve una lista con el código del producto, nombre del producto, código del fabricante y nombre del fabricante, de todos los productos de la base de datos.
SELECT
	DISTINCT(P.nombre) AS producto,
	P.codigo AS codigo_producto,
    P.precio,
	F.nombre AS fabricante,
    P.codigo_fabricante
FROM producto P
INNER JOIN fabricante F ON F.codigo = P.codigo_fabricante

#1.1.4-4. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.
SELECT
	DISTINCT(P.nombre) AS producto,
	P.precio,
	F.nombre AS fabricante
FROM producto P
INNER JOIN fabricante F ON F.codigo = P.codigo_fabricante
ORDER BY P.precio ASC
LIMIT 1

#1.1.4-5. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.
SELECT
	DISTINCT(P.nombre) AS producto,
	P.precio,
	F.nombre AS fabricante
FROM producto P
INNER JOIN fabricante F ON F.codigo = P.codigo_fabricante
ORDER BY P.precio DESC
LIMIT 1

#1.1.4-6. Devuelve una lista de todos los productos del fabricante Lenovo.
SELECT DISTINCT(P.nombre)
FROM producto P
INNER JOIN fabricante F ON F.codigo = P.codigo_fabricante
WHERE F.nombre = 'Lenovo'
ORDER BY P.nombre ASC

#1.1.4-7. Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€.
SELECT DISTINCT(P.nombre)
FROM producto P
INNER JOIN fabricante F ON F.codigo = P.codigo_fabricante
WHERE F.nombre = 'Crucial'
AND P.precio > 200
ORDER BY P.nombre ASC

#1.1.4-8. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packard y Seagate. Sin utilizar el operador IN.
SELECT DISTINCT(P.nombre)
FROM producto P
INNER JOIN fabricante F ON F.codigo = P.codigo_fabricante
WHERE (F.nombre = 'Asus' OR F.nombre = 'Hewlett-Packard' OR F.nombre = 'Seagate')
ORDER BY P.nombre ASC

#1.1.4-9. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Utilizando el operador IN.
SELECT DISTINCT(P.nombre)
FROM producto P
INNER JOIN fabricante F ON F.codigo = P.codigo_fabricante
WHERE F.nombre IN ('Asus','Hewlett-Packard','Seagate')
ORDER BY P.nombre ASC

#1.1.4-10. Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre termine por la vocal e.
SELECT DISTINCT(P.nombre), P.precio
FROM producto P
INNER JOIN fabricante F ON F.codigo = P.codigo_fabricante
WHERE RIGHT(F.nombre,1) = 'E'
ORDER BY P.nombre ASC

#1.1.4-11. Devuelve un listado con el nombre y el precio de todos los productos cuyo nombre de fabricante contenga el carácter w en su nombre.
SELECT DISTINCT(P.nombre), P.precio
FROM producto P
INNER JOIN fabricante F ON F.codigo = P.codigo_fabricante
WHERE F.nombre LIKE '%W%'
ORDER BY P.nombre ASC

#1.1.4-12. Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente)
SELECT
	DISTINCT(P.nombre) AS producto,
	P.precio,
	F.nombre AS fabricante
FROM producto P
INNER JOIN fabricante F ON F.codigo = P.codigo_fabricante
WHERE P.precio >= 180
ORDER BY P.precio DESC, P.nombre ASC

#1.1.4-13. Devuelve un listado con el código y el nombre de fabricante, solamente de aquellos fabricantes que tienen productos asociados en la base de datos.
SELECT DISTINCT(F.nombre) AS fabricante, F.codigo
FROM fabricante F
INNER JOIN producto P ON P.codigo_fabricante = F.codigo

#1.1.5 Consultas multitabla (Composición externa)

#1.1.5-1. Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los productos que tiene cada uno de ellos. El listado deberá mostrar también aquellos fabricantes que no tienen productos asociados.
SELECT 
	F.nombre AS fabricante,
	P.nombre AS producto
FROM fabricante F
LEFT JOIN producto P ON P.codigo_fabricante = F.codigo
ORDER BY fabricante ASC, producto ASC

#1.1.5-2. Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.
SELECT 
	F.nombre AS fabricante,
	P.nombre AS producto
FROM fabricante F
LEFT JOIN producto P ON P.codigo_fabricante = F.codigo
WHERE P.nombre IS NULL
ORDER BY fabricante ASC, producto ASC

#1.1.5-3. ¿Pueden existir productos que no estén relacionados con un fabricante? Justifique su respuesta.
SELECT 
	F.nombre AS fabricante,
	P.nombre AS producto
FROM producto P 
LEFT JOIN fabricante F ON P.codigo_fabricante = F.codigo
ORDER BY fabricante ASC, producto ASC;
SELECT * FROM producto WHERE codigo_fabricante IS NULL

#1.1.5-RESPUESTA: Podría ocurrir pero no es el caso que nos ocupa. Se ha confirmado con estas 2 queries la base de datos actual no existe ningún registro en la tabla Producto sin un fabricante asociado (todos los registros de la tabla producto tienen un valor codigo_fabricante no nulo). 

#1.1.6 Consultas resumen

#1.1.6-1. Calcula el número total de productos que hay en la tabla productos.
SELECT COUNT(nombre) FROM producto;

#1.1.6-2. Calcula el número total de fabricantes que hay en la tabla fabricante.
SELECT COUNT(nombre) FROM fabricante;

#1.1.6-3. Calcula el número de valores distintos de código de fabricante aparecen en la tabla productos.
SELECT COUNT(DISTINCT(codigo_fabricante)) FROM producto;

#1.1.6-4. Calcula la media del precio de todos los productos.
SELECT ROUND(AVG(precio),2)
FROM producto;

#1.1.6-5. Calcula el precio más barato de todos los productos.
SELECT MIN(precio)
FROM producto;

#1.1.6-6. Calcula el precio más caro de todos los productos.
SELECT MAX(precio)
FROM producto;

#1.1.6-7. Lista el nombre y el precio del producto más barato.
SELECT nombre, MIN(precio)
FROM producto;

#1.1.6-8. Lista el nombre y el precio del producto más caro.
SELECT nombre, MAX(precio)
FROM producto;

#1.1.6-9. Calcula la suma de los precios de todos los productos.
SELECT SUM(precio) FROM producto;

#1.1.6-10. Calcula el número de productos que tiene el fabricante Asus.
SELECT COUNT(DISTINCT(P.nombre))
FROM producto P
INNER JOIN fabricante F ON F.codigo = P.codigo_fabricante
WHERE F.nombre = 'Asus'

#1.1.6-11. Calcula la media del precio de todos los productos del fabricante Asus.
SELECT ROUND(AVG(P.precio),2)
FROM producto P
INNER JOIN fabricante F ON F.codigo = P.codigo_fabricante
WHERE F.nombre = 'Asus'

#1.1.6-12. Calcula el precio más barato de todos los productos del fabricante Asus.
SELECT MIN(P.precio)
FROM producto P
INNER JOIN fabricante F ON F.codigo = P.codigo_fabricante
WHERE F.nombre = 'Asus'

#1.1.6-13. Calcula el precio más caro de todos los productos del fabricante Asus.
SELECT MAX(P.precio)
FROM producto P
INNER JOIN fabricante F ON F.codigo = P.codigo_fabricante
WHERE F.nombre = 'Asus'

#1.1.6-14. Calcula la suma de todos los productos del fabricante Asus.
SELECT SUM(P.precio)
FROM producto P
INNER JOIN fabricante F ON F.codigo = P.codigo_fabricante
WHERE F.nombre = 'Asus'

#1.1.6-15. Muestra el precio máximo, precio mínimo, precio medio y el número total de productos que tiene el fabricante Crucial.
SELECT 
	MIN(P.precio) AS min_precio,
	MAX(P.precio) AS max_precio,
	AVG(P.precio) AS avg_precio,
	COUNT(DISTINCT(P.nombre))
FROM producto P
INNER JOIN fabricante F ON F.codigo = P.codigo_fabricante
WHERE F.nombre = 'Crucial'

#1.1.6-16. Muestra el número total de productos que tiene cada uno de los fabricantes. El listado también debe incluir los fabricantes que no tienen ningún producto. El resultado mostrará dos columnas, una con el nombre del fabricante y otra con el número de productos que tiene. Ordene el resultado descendentemente por el número de productos.
SELECT
	F.nombre AS fabricante,
	COUNT(DISTINCT(P.nombre)) AS numero_productos
FROM fabricante F 
LEFT JOIN producto P ON P.codigo_fabricante = F.codigo
GROUP BY F.nombre
ORDER BY numero_productos DESC;

#1.1.6-17. Muestra el precio máximo, precio mínimo y precio medio de los productos de cada uno de los fabricantes. El resultado mostrará el nombre del fabricante junto con los datos que se solicitan.
SELECT
	F.nombre AS fabricante,
	MIN(P.precio) AS min_precio,
	MAX(P.precio) AS max_precio,
	AVG(P.precio) AS avg_precio
FROM fabricante F 
LEFT JOIN producto P ON P.codigo_fabricante = F.codigo
GROUP BY F.nombre
ORDER BY fabricante ASC;

#1.1.6-18. Muestra el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. No es necesario mostrar el nombre del fabricante, con el código del fabricante es suficiente.
SELECT
	P.codigo_fabricante,
	MIN(P.precio) AS min_precio,
	MAX(P.precio) AS max_precio,
	COUNT(DISTINCT(P.nombre)) AS numero_productos
FROM producto P 
WHERE P.codigo_fabricante IN (
	SELECT codigo_fabricante
	FROM producto
	HAVING AVG(precio) > 200
)
GROUP BY P.codigo_fabricante
ORDER BY P.codigo_fabricante ASC;

#1.1.6-19. Muestra el nombre de cada fabricante, junto con el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. Es necesario mostrar el nombre del fabricante.
SELECT
	P.codigo_fabricante,
    F.nombre AS fabricante,
	MIN(P.precio) AS min_precio,
	MAX(P.precio) AS max_precio,
	COUNT(DISTINCT(P.nombre)) AS numero_productos
FROM producto P 
LEFT JOIN fabricante F ON F.codigo = P.codigo_fabricante
WHERE P.codigo_fabricante IN (
	SELECT codigo_fabricante
	FROM producto
	HAVING AVG(precio) > 200
)
GROUP BY P.codigo_fabricante
ORDER BY P.codigo_fabricante ASC;

#1.1.6-20. Calcula el número de productos que tienen un precio mayor o igual a 180€.
SELECT COUNT(DISTINCT(nombre))
FROM producto
WHERE precio >= 180

#1.1.6-21. Calcula el número de productos que tiene cada fabricante con un precio mayor o igual a 180€.
SELECT codigo_fabricante, COUNT(DISTINCT(nombre))
FROM producto
WHERE precio >= 180
GROUP BY codigo_fabricante

#1.1.6-22. Lista el precio medio los productos de cada fabricante, mostrando solamente el código del fabricante.
SELECT codigo_fabricante, ROUND(AVG(precio),2) As precio_promedio
FROM producto
GROUP BY codigo_fabricante

#1.1.6-23. Lista el precio medio los productos de cada fabricante, mostrando solamente el nombre del fabricante.
SELECT F.nombre AS fabricante, ROUND(AVG(precio),2) As precio_promedio
FROM producto P
INNER JOIN fabricante F ON F.codigo = P.codigo_fabricante
GROUP BY fabricante

#1.1.6-24. Lista los nombres de los fabricantes cuyos productos tienen un precio medio mayor o igual a 150€.
SELECT F.nombre AS fabricante
FROM producto P 
LEFT JOIN fabricante F ON F.codigo = P.codigo_fabricante
WHERE P.codigo_fabricante IN (
	SELECT codigo_fabricante
	FROM producto
    GROUP BY codigo_fabricante
	HAVING AVG(precio) > 150
)
GROUP BY P.codigo_fabricante
ORDER BY P.codigo_fabricante ASC;

#1.1.6-25. Devuelve un listado con los nombres de los fabricantes que tienen 2 o más productos.
SELECT F.nombre AS fabricante
FROM producto P 
LEFT JOIN fabricante F ON F.codigo = P.codigo_fabricante
WHERE P.codigo_fabricante IN (
	SELECT codigo_fabricante
	FROM producto
    GROUP BY codigo_fabricante
	HAVING COUNT(DISTINCT(nombre)) >= 2
)
GROUP BY P.codigo_fabricante
ORDER BY P.codigo_fabricante ASC;