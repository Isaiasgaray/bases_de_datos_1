USE cine_paraiso

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
					