USE cine_paraiso
/*
5a) El precio de la entrada depende unicamente de la sucursal.

ALTER TABLE sucursal 
ADD precio FLOAT;

UPDATE sucursal

set precio = 200.00
where sucursal_id = 1;

UPDATE sucursal
set precio = 250.44
where sucursal_id = 2;

UPDATE sucursal
set precio = 350.44
where sucursal_id = 3;
*/


-- 5b) El precio de la entrada depende unicamente de la pelicula.

ALTER TABLE pelicula
ADD precio FLOAT;

UPDATE pelicula
set precio = 200.00
where pelicula_id = 1;

UPDATE pelicula
set precio = 250.44
where pelicula_id = 2;

UPDATE pelicula
set precio = 350.44
where pelicula_id = 3;

UPDATE pelicula
set precio = 150.44
where pelicula_id = 4;

UPDATE pelicula
set precio = 270.44
where pelicula_id = 5;

/*
5c) El preico de la entrada depende unicamente de la ubicacion de la butaca.
ALTER TABLE butaca
ADD precio FLOAT;

UPDATE butaca
set precio = 270.44
where butuca_id = 1;

Para las proximas 19 butacas hacemos el mismo procedimiento cambiando el numero de id de la butaca
*/



