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

SELECT *
FROM sucursal
WHERE sucursal_id = (
	SELECT ciudad_id
	FROM ciudad
	WHERE nombre = 'Córdoba'
)


SELECT *
FROM funcion 
WHERE CAST(fecha_hora AS DATE) = '2022-11-01'

SELECT ciudad_id
FROM ciudad
WHERE nombre = 'Córdoba'
