USE master

if exists (select * from sysdatabases where name = 'cine_paraiso')
  drop database cine_paraiso

CREATE DATABASE cine_paraiso 
GO

USE cine_paraiso


CREATE TABLE ciudad (
	ciudad_id INTEGER PRIMARY KEY IDENTITY,
	nombre VARCHAR(50)
)

CREATE TABLE sucursal (
	sucursal_id INTEGER PRIMARY KEY IDENTITY,
	nombre VARCHAR(50),
	ciudad_id INTEGER FOREIGN KEY REFERENCES ciudad(ciudad_id)
)

CREATE TABLE sala (
	sala_id INTEGER PRIMARY KEY IDENTITY,
	numero VARCHAR(2),
	sucursal_id INTEGER FOREIGN KEY REFERENCES sucursal(sucursal_id)
)

CREATE TABLE butaca ( 
	butaca_id INTEGER PRIMARY KEY IDENTITY,
	posicion VARCHAR(10),
	sala_id INTEGER FOREIGN KEY REFERENCES sala(sala_id)
)

CREATE TABLE funcion ( 
	funcion_id INTEGER PRIMARY KEY IDENTITY,
	fecha_hora DATETIME,
	pelicula_id INTEGER,
	sala_id INTEGER FOREIGN KEY REFERENCES sala(sala_id)
)

CREATE TABLE pelicula (
	pelicula_id INTEGER PRIMARY KEY IDENTITY,
	nombre VARCHAR(100),
	subtitulado BIT,
	clasificacion_id VARCHAR(3)
)

CREATE TABLE genero (
	genero_id INTEGER PRIMARY KEY IDENTITY,
	nombre VARCHAR(100)
)

CREATE TABLE genero_pelicula (
	pelicula_id INTEGER NOT NULL FOREIGN KEY REFERENCES pelicula(pelicula_id),
	genero_id INTEGER NOT NULL FOREIGN KEY REFERENCES genero(genero_id)
)

CREATE TABLE clasificacion (
	clasificacion_id VARCHAR(3) PRIMARY KEY,
	descripcion VARCHAR(50)
)

CREATE TABLE compra (
	compra_id INTEGER PRIMARY KEY IDENTITY,
	butaca_id  INTEGER FOREIGN KEY REFERENCES butaca(butaca_id),
	funcion_id INTEGER FOREIGN KEY REFERENCES funcion(funcion_id),
	fecha_hora DATETIME
)

ALTER TABLE funcion 
ADD CONSTRAINT FK_funcion_pelicula_id 
FOREIGN KEY (pelicula_id) 
REFERENCES pelicula(pelicula_id)

ALTER TABLE pelicula  
ADD CONSTRAINT FK_pelicula_clasificacion_id 
FOREIGN KEY (clasificacion_id) 
REFERENCES clasificacion(clasificacion_id)

ALTER TABLE genero_pelicula 
ADD CONSTRAINT PK_genero_pelicula
PRIMARY KEY (pelicula_id, genero_id)


INSERT INTO  ciudad (nombre) 
VALUES ('Rosario')

INSERT INTO  ciudad (nombre) 
VALUES ('Cordoba')

INSERT INTO  ciudad (nombre) 
VALUES ('La Plata')

INSERT INTO  sucursal(nombre, ciudad_id) 
VALUES ('Monumental', 1)


INSERT INTO  sucursal(nombre, ciudad_id) 
VALUES ('EL Pirata', 2)


INSERT INTO  sucursal(nombre, ciudad_id) 
VALUES ('Lobbo', 3)

INSERT INTO  sala(sucursal_id, numero) 
VALUES (1, '01')

INSERT INTO  sala(sucursal_id, numero) 
VALUES (1, '02')

INSERT INTO  sala(sucursal_id, numero) 
VALUES (1, '03')


INSERT INTO  sala(sucursal_id, numero) 
VALUES (2, '01')

INSERT INTO  sala(sucursal_id, numero) 
VALUES (2, '02')

INSERT INTO  sala(sucursal_id, numero) 
VALUES (2, '03')



INSERT INTO  sala(sucursal_id, numero) 
VALUES (3, '01')

INSERT INTO  sala(sucursal_id, numero) 
VALUES (3, '02')

INSERT INTO  sala(sucursal_id, numero) 
VALUES (3, '03')

INSERT INTO  genero(nombre) 
VALUES ('ciencia ficcion'), ('drama'), ('terror'), ('accion'), ('suspenso') 

INSERT INTO  clasificacion(clasificacion_id) 
VALUES ('ATP'), ('+13'), ('+16'), ('+18')


INSERT INTO  pelicula(nombre, subtitulado, clasificacion_id)
VALUES  ('Argentina 1985', 0, '+13'), ('2001: Odisea del espacio', 1, '+13'),
		('Alien', 1, '+18'), ('Gladiador', 1, '+16'), ('Secreto de sus ojos', 0, '+13')    

INSERT INTO genero_pelicula(pelicula_id, genero_id) 
VALUES (1, 2), (2, 1), (2, 5), (3, 1), (3, 3), (4, 4), (4, 2), (5, 2)   			
			
INSERT INTO funcion(fecha_hora, pelicula_id, sala_id) 
VALUES ('2022-24-10 17:30', 1, 2)

--INSERT INTO funcion(fecha_hora, pelicula_id, sala_id) 
--VALUES (, 1, 2)


--SELECT *
--FROM funcion

--select GETDATE()


select *
from funcion



