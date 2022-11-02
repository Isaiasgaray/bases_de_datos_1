USE cine_paraiso

/*
Ejercicio 5.
a. El precio de la entrada depende únicamente de la sucursal.
ALTER TABLE sucursal 
ADD precio FLOAT

UPDATE sucursal

set precio = 200.00
where sucursal_id = 1

UPDATE sucursal
set precio = 250.44
where sucursal_id = 2

UPDATE sucursal
set precio = 350.44
where sucursal_id = 3
*/

-- b. El precio de la entrada depende únicamente de la película.

ALTER TABLE pelicula
ADD precio FLOAT
GO

UPDATE pelicula
SET precio = 500.00
WHERE pelicula_id = 1

UPDATE pelicula
SET precio = 350.00
WHERE pelicula_id = 2

UPDATE pelicula
SET precio = 350.00
WHERE pelicula_id = 3

UPDATE pelicula
SET precio = 400.00
WHERE pelicula_id = 4

UPDATE pelicula
SET precio = 350.00
WHERE pelicula_id = 5

/*
c. El precio de la entrada depende únicamente de la ubicación de la butaca.

ALTER TABLE butaca
ADD precio FLOAT

UPDATE butaca
set precio = 270.44
where butuca_id = 1

Para las proximas 19 butacas hacemos el mismo procedimiento 
cambiando el numero de id de la butaca
*/

