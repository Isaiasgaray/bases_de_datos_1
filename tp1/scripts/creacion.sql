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


INSERT INTO  ciudad (nombre) 
VALUES ('Rosario'),
	   ('Cordoba'),
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
VALUES  ('Argentina 1985', 0, 2),
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
	('E1', 1), ('E2', 1), ('E3', 1), ('E4', 1), ('E5', 1), 
	('A1', 2), ('A2', 2), ('A3', 2), ('A4', 2), ('A5', 2), 
	('B1', 2), ('B2', 2), ('B3', 2), ('B4', 2), ('B5', 2), 
	('C1', 2), ('C2', 2), ('C3', 2), ('C4', 2), ('C5', 2), 
	('D1', 2), ('D2', 2), ('D3', 2), ('D4', 2), ('D5', 2), 
	('E1', 2), ('E2', 2), ('E3', 2), ('E4', 2), ('E5', 2), 
	('A1', 3), ('A2', 3), ('A3', 3), ('A4', 3), ('A5', 3), 
	('B1', 3), ('B2', 3), ('B3', 3), ('B4', 3), ('B5', 3), 
	('C1', 3), ('C2', 3), ('C3', 3), ('C4', 3), ('C5', 3), 
	('D1', 3), ('D2', 3), ('D3', 3), ('D4', 3), ('D5', 3), 
	('E1', 3), ('E2', 3), ('E3', 3), ('E4', 3), ('E5', 3)


INSERT INTO funcion (fecha_hora, pelicula_id, sala_id)
VALUES  ('2022-10-24 12:12:12', 1, 2),
		('2022-10-25 22:12:00', 3, 1),
		('2022-10-28 20:00:00', 4, 3),
		('2022-11-01 21:00:00', 5, 3),
		('2022-11-02 18:00:00', 2, 2)


select *
from funcion



