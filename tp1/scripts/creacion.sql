-- Creación de base de datos y tablas.
USE master

if exists (select * from sysdatabases where name = 'cine_paraiso')
  drop database cine_paraiso

CREATE DATABASE cine_paraiso 
GO

USE cine_paraiso

SET DATEFORMAT YMD

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
	posicion VARCHAR(3),
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
	nombre VARCHAR(50),
	subtitulado BIT,
	clasificacion_id INTEGER
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
	clasificacion_id INTEGER PRIMARY KEY IDENTITY,
	nombre VARCHAR(3),
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

-- Inserción de datos.
INSERT INTO  ciudad (nombre) 
VALUES ('Rosario'),
	   ('Córdoba'),
	   ('La Plata')

INSERT INTO sucursal(nombre, ciudad_id) 
VALUES ('Monumental', 1),
	   ('El Pirata', 2),
	   ('Lobo', 3)
	 
INSERT INTO sala (sucursal_id, numero) 
VALUES (1, '01'), (1, '02'), (1, '03'),
	   (2, '01'), (2, '02'), (2, '03'),
	   (3, '01'), (3, '02'), (3, '03')

INSERT INTO genero (nombre) 
VALUES ('Ciencia ficción'),
	   ('Drama'),
	   ('Terror'),
	   ('Acción'),
	   ('Suspenso') 

INSERT INTO  clasificacion (nombre) 
VALUES ('ATP'),
	   ('+13'),
	   ('+16'),
	   ('+18')

INSERT INTO  pelicula (nombre, subtitulado, clasificacion_id)
VALUES  ('Argentina, 1985', 0, 2),
		('2001: Odisea del espacio', 1, 2),
		('Alien', 1, 4),
		('Gladiador', 1, 3),
		('El secreto de sus ojos', 0, 2)    

INSERT INTO genero_pelicula (pelicula_id, genero_id) 
VALUES (1, 2), 
	   (2, 1), (2, 5), 
	   (3, 1), (3, 3), 
	   (4, 4), (4, 2),
	   (5, 2)   			
	   
INSERT INTO butaca (posicion, sala_id)
VALUES	('A1', 1), ('A2', 1), ('A3', 1), ('A4', 1), ('A5', 1), 
	('B1', 1), ('B2', 1), ('B3', 1), ('B4', 1), ('B5', 1), 
	('C1', 1), ('C2', 1), ('C3', 1), ('C4', 1), ('C5', 1), 
	('D1', 1), ('D2', 1), ('D3', 1), ('D4', 1), ('D5', 1), 
	('A1', 2), ('A2', 2), ('A3', 2), ('A4', 2), ('A5', 2), 
	('B1', 2), ('B2', 2), ('B3', 2), ('B4', 2), ('B5', 2), 
	('C1', 2), ('C2', 2), ('C3', 2), ('C4', 2), ('C5', 2), 
	('D1', 2), ('D2', 2), ('D3', 2), ('D4', 2), ('D5', 2), 
	('A1', 3), ('A2', 3), ('A3', 3), ('A4', 3), ('A5', 3), 
	('B1', 3), ('B2', 3), ('B3', 3), ('B4', 3), ('B5', 3), 
	('C1', 3), ('C2', 3), ('C3', 3), ('C4', 3), ('C5', 3), 
	('D1', 3), ('D2', 3), ('D3', 3), ('D4', 3), ('D5', 3), 
	('A1', 4), ('A2', 4), ('A3', 4), ('A4', 4), ('A5', 4), 
	('B1', 4), ('B2', 4), ('B3', 4), ('B4', 4), ('B5', 4), 
	('C1', 4), ('C2', 4), ('C3', 4), ('C4', 4), ('C5', 4), 
	('D1', 4), ('D2', 4), ('D3', 4), ('D4', 4), ('D5', 4), 
	('A1', 5), ('A2', 5), ('A3', 5), ('A4', 5), ('A5', 5), 
	('B1', 5), ('B2', 5), ('B3', 5), ('B4', 5), ('B5', 5), 
	('C1', 5), ('C2', 5), ('C3', 5), ('C4', 5), ('C5', 5), 
	('D1', 5), ('D2', 5), ('D3', 5), ('D4', 5), ('D5', 5), 
	('A1', 6), ('A2', 6), ('A3', 6), ('A4', 6), ('A5', 6), 
	('B1', 6), ('B2', 6), ('B3', 6), ('B4', 6), ('B5', 6), 
	('C1', 6), ('C2', 6), ('C3', 6), ('C4', 6), ('C5', 6), 
	('D1', 6), ('D2', 6), ('D3', 6), ('D4', 6), ('D5', 6), 
	('A1', 7), ('A2', 7), ('A3', 7), ('A4', 7), ('A5', 7), 
	('B1', 7), ('B2', 7), ('B3', 7), ('B4', 7), ('B5', 7), 
	('C1', 7), ('C2', 7), ('C3', 7), ('C4', 7), ('C5', 7), 
	('D1', 7), ('D2', 7), ('D3', 7), ('D4', 7), ('D5', 7), 
	('A1', 8), ('A2', 8), ('A3', 8), ('A4', 8), ('A5', 8), 
	('B1', 8), ('B2', 8), ('B3', 8), ('B4', 8), ('B5', 8), 
	('C1', 8), ('C2', 8), ('C3', 8), ('C4', 8), ('C5', 8), 
	('D1', 8), ('D2', 8), ('D3', 8), ('D4', 8), ('D5', 8), 
	('A1', 9), ('A2', 9), ('A3', 9), ('A4', 9), ('A5', 9), 
	('B1', 9), ('B2', 9), ('B3', 9), ('B4', 9), ('B5', 9), 
	('C1', 9), ('C2', 9), ('C3', 9), ('C4', 9), ('C5', 9), 
	('D1', 9), ('D2', 9), ('D3', 9), ('D4', 9), ('D5', 9)

INSERT INTO funcion (fecha_hora, pelicula_id, sala_id)
VALUES  ('2022-10-24 12:30:00', 1, 2),
		('2022-10-24 15:00:00', 1, 1),
		('2022-10-24 18:00:00', 1, 3),
		('2022-10-25 22:00:00', 3, 1),
		('2022-10-28 20:30:00', 4, 3),
		('2022-11-01 21:00:00', 5, 3),
		('2022-11-02 18:45:00', 2, 2),
		('2022-11-02 18:45:00', 2, 7),
		('2022-11-03 20:00:00', 1, 7),
		('2022-11-02 16:45:00', 3, 4),
		('2022-10-29 13:00:00', 2, 4),
		('2022-10-24 13:00:00', 1, 4)

SELECT *
FROM  butaca
WHERE butaca_id BETWEEN 60 AND 80

-- TODO: Agregar constraint para que butaca_id este en funcion_id
INSERT INTO compra (butaca_id, funcion_id, fecha_hora)
VALUES  (42, 3, '2022-10-26 14:36:23'),
	    (43, 3, '2022-10-26 14:36:23'),
	    (62, 12, '2022-10-20 17:43:29')
