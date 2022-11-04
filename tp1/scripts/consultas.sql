USE cine_paraiso

-- Ejercicio 4
/*
a. ¿Cuántas funciones hay en la sucursal La Plata 
   (no importa si la función ya ocurrió o no)?
*/

SELECT COUNT(*) AS total_funciones
FROM funcion
WHERE sala_id IN (
	-- ID de todas las salas de la sucursal.
	SELECT sala_id 
	FROM sala
	WHERE sucursal_id = (
		-- ID de la sucursal de La Plata.
		SELECT sucursal_id 
		FROM sucursal
		WHERE sucursal_id = (
			-- ID de la ciudad La Plata.
			SELECT ciudad_id
			FROM ciudad
			WHERE nombre = 'La Plata'
		)
	)
)

/*
b. ¿Cuáles son las pelı́culas en cartelera en
   una fecha determinada (fije la fecha que prefiera) 
   en la sucursal Córdoba?
*/

SELECT DISTINCT p.nombre  
FROM funcion f
INNER JOIN pelicula p 
ON p.pelicula_id = f.pelicula_id
WHERE sala_id IN (
	SELECT sala_id
	FROM sala
	WHERE sucursal_id = (
		SELECT sucursal_id 
		FROM sucursal
		WHERE sucursal_id = (
			SELECT ciudad_id
			FROM ciudad
			WHERE nombre = 'Córdoba'
		)
	)
)
AND CAST(fecha_hora AS DATE) = '2022-11-02'

/*
c. ¿Cuáles son los horarios disponibles para ver 
   la pelı́cula Argentina, 1985 en una fecha determinada 
   (fije la fecha) en la sucursal Rosario?
*/
SELECT CAST(fecha_hora AS TIME)
FROM funcion
WHERE sala_id IN (
	SELECT sala_id
	FROM sala
	WHERE sucursal_id = (
		SELECT sucursal_id 
		FROM sucursal
		WHERE sucursal_id = (
			SELECT ciudad_id
			FROM ciudad
			WHERE nombre = 'Rosario'
		)
	)
) 
AND CAST(fecha_hora AS DATE) = '2022-10-24' 
AND pelicula_id = (SELECT pelicula_id 
					FROM pelicula
					WHERE nombre = 'Argentina, 1985')

/*
d. ¿Cuáles son los horarios disponibles para ver la pelı́cula 
   Argentina, 1985 en una fecha determinada (fije la fecha) 
   para cada sucursal? Muestre estos resultados ordenados 
   cronológicamente de forma creciente. 	
*/
SELECT su.nombre sucursal, CAST(f.fecha_hora AS TIME) hora 
FROM funcion f
INNER JOIN sala s
ON s.sala_id = f.sala_id 
INNER JOIN sucursal su
ON su.sucursal_id = s.sucursal_id 
WHERE CAST(f.fecha_hora AS DATE) = '2022-10-24'
AND f.pelicula_id =
(SELECT pelicula_id
 FROM pelicula
 WHERE nombre = 'Argentina, 1985')
ORDER BY hora 
 
/*
e. ¿Cuáles pelı́culas de ciencia ficción hay en 
   cartelera la semana del 24 de octubre de 2022
   en la sucursal Rosario?
*/
SELECT DISTINCT p.nombre  
FROM funcion f
INNER JOIN pelicula p 
ON p.pelicula_id = f.pelicula_id
WHERE sala_id IN (
	SELECT sala_id
	FROM sala
	WHERE sucursal_id = (
		SELECT sucursal_id 
		FROM sucursal
		WHERE sucursal_id = (
			SELECT ciudad_id
			FROM ciudad
			WHERE nombre = 'Rosario'
		)
	)
)
AND CAST(fecha_hora AS DATE) BETWEEN 
	'2022-10-24' AND DATEADD(dd, 7, '2022-10-24')
AND p.pelicula_id IN (
	SELECT pelicula_id
	FROM genero_pelicula
	WHERE genero_id IN
		(SELECT genero_id
		 FROM genero
		 WHERE nombre = 'Ciencia ficción'))

/*
f. ¿Cuáles son las butacas vendidas para ver 
   Argentina, 1985 en Córdoba en una función 
   determinada (fije la función)?
*/

SELECT b.butaca_id, b.posicion 
FROM compra c
INNER JOIN butaca b 
ON c.butaca_id = b.butaca_id 
WHERE c.funcion_id = (
	SELECT TOP 1 funcion_id 
	FROM funcion
	WHERE pelicula_id = 
	(SELECT pelicula_id
	 FROM pelicula
	 WHERE nombre = 'Argentina, 1985')
	AND sala_id IN (
		SELECT sala_id 
		FROM sala
		WHERE sucursal_id IN (
			SELECT sucursal_id
			FROM sucursal
			WHERE sucursal_id IN (
				SELECT ciudad_id 
				FROM ciudad
				WHERE nombre = 'Córdoba' 
			)
		)
	)
)

/*
g. ¿Cuáles son las butacas libres para ver 
   Argentina, 1985 en Córdoba en una función 
   determinada (fije la función)?
*/

SELECT butaca_id, posicion
FROM butaca
-- La función fija que elegimos es la función que devuelve TOP 1 de la siguiente query.
WHERE sala_id = (SELECT sala_id FROM funcion WHERE funcion_id = 
	(SELECT TOP 1 funcion_id FROM funcion WHERE pelicula_id = 
	(SELECT pelicula_id FROM pelicula WHERE nombre = 'Argentina, 1985')
	 AND sala_id IN (SELECT sala_id FROM sala WHERE sucursal_id IN (
			SELECT sucursal_id FROM sucursal WHERE sucursal_id IN (
				SELECT ciudad_id FROM ciudad WHERE nombre = 'Córdoba')))))
AND butaca_id NOT IN (
	SELECT butaca_id FROM compra
	WHERE funcion_id = 
	(SELECT TOP 1 funcion_id FROM funcion WHERE pelicula_id = 
	(SELECT pelicula_id FROM pelicula WHERE nombre = 'Argentina, 1985')
	 AND sala_id IN (SELECT sala_id FROM sala WHERE sucursal_id IN (
			SELECT sucursal_id FROM sucursal WHERE sucursal_id IN (
				SELECT ciudad_id FROM ciudad WHERE nombre = 'Córdoba')))))

/*
h. ¿Cuántas peliculas por género están o 
	estuvieron en cartelera en el Cine Paraı́so?
*/
SELECT g.nombre genero, COUNT(*) total
FROM genero_pelicula gp 
INNER JOIN pelicula p 
ON gp.pelicula_id = p.pelicula_id 
INNER JOIN genero g 
ON gp.genero_id = g.genero_id 
GROUP BY g.nombre 
ORDER BY 2 DESC


-- Ejercicio 6
/* 
a. Determine el total recaudado por función.
*/
SELECT f.funcion_id, SUM(p.precio)
FROM compra c 
INNER JOIN funcion f 
ON c.funcion_id = f.funcion_id 
INNER JOIN pelicula p 
ON f.pelicula_id = p.pelicula_id 
GROUP BY f.funcion_id, p.precio

/*
b. Determine el promedio recaudado por función para cada pelı́cula. 
   Es decir, si la pelı́cula Argentina, 1985 tuvo dos funciones, 
   y en una recaudó 1000 pesos, y en la otra recaudó 3000 pesos, 
   el promedio recaudado por función para esta pelı́cula es 2000 pesos.
*/
SELECT p.pelicula_id, SUM(p.precio) total, COUNT(DISTINCT f.funcion_id) cant_funciones,
	   SUM(p.precio) / COUNT(DISTINCT f.funcion_id) promedio
FROM compra c 
INNER JOIN funcion f 
ON f.funcion_id = c.funcion_id  
INNER JOIN pelicula p 
ON f.pelicula_id = p.pelicula_id 
GROUP BY p.pelicula_id 

/*
c. Determine el porcentaje de entradas vendidas por función, 
   y muestre pelı́cula, sucursal, hora y dı́a, 
   solo para aquellas en las que se vendió menos del 50 %.
*/
SELECT f.funcion_id, f.sala_id, COUNT(DISTINCT c.compra_id) butacas_vendidas,
	   COUNT(DISTINCT b.butaca_id) total_butacas,
	   CAST(
	   (COUNT(DISTINCT c.compra_id) * 100.00) / COUNT(DISTINCT b.butaca_id)
	   AS DECIMAL(10, 2)) porcentaje_entradas_vendidas,
	   p.nombre pelicula, p.pelicula_id, f.fecha_hora, su.nombre 
FROM compra c 
INNER JOIN funcion f 
ON f.funcion_id = c.funcion_id  
INNER JOIN sala s 
ON f.sala_id = s.sala_id
INNER JOIN pelicula p 
ON f.pelicula_id = p.pelicula_id
INNER JOIN sucursal su
ON s.sucursal_id = su.sucursal_id 
INNER JOIN butaca b 
ON b.sala_id = f.sala_id 
GROUP BY f.funcion_id, f.sala_id, p.nombre, p.pelicula_id, f.fecha_hora, su.nombre 
HAVING (COUNT(DISTINCT c.compra_id) * 100) / COUNT(DISTINCT b.butaca_id) < 50

/*
d. Determine, para cada pelı́cula, cuál fue la función que más recaudó.
*/

SELECT b.pelicula_id, MAX(b.recaudacion) recaudacion, MAX(b.funcion_id) funcion
FROM (
	SELECT f.funcion_id, SUM(p.precio) recaudacion, p.pelicula_id  --Recaudación por función
	FROM compra c 
	INNER JOIN funcion f 
	ON c.funcion_id = f.funcion_id 
	INNER JOIN pelicula p 
	ON f.pelicula_id = p.pelicula_id 
	GROUP BY f.funcion_id, p.precio, p.pelicula_id 
	) b
INNER JOIN (
	SELECT c.pelicula_id, MAX(c.recaudacion) recaudacion
	FROM (
		SELECT f.funcion_id, SUM(p.precio) recaudacion, p.pelicula_id  --Recaudación por función
		FROM compra c 
		INNER JOIN funcion f 
		ON c.funcion_id = f.funcion_id 
		INNER JOIN pelicula p 
		ON f.pelicula_id = p.pelicula_id 
		GROUP BY f.funcion_id, p.precio, p.pelicula_id 
		) c
	GROUP BY c.pelicula_id ) a
	ON a.pelicula_id = b.pelicula_id AND a.recaudacion = b.recaudacion
GROUP BY b.pelicula_id
