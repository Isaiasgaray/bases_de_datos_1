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
	numero INT,
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
	sala_id INTEGER FOREIGN KEY REFERENCES sala(sala_id)
)

CREATE TABLE pelicula (
	pelicula_id INTEGER PRIMARY KEY IDENTITY,
	nombre VARCHAR(100),
	subtitulado BIT,
)

CREATE TABLE genero (
	genero_id INTEGER PRIMARY KEY IDENTITY,
	nombre VARCHAR(100)
)

CREATE TABLE genero_pelicula (
	pelicula_id INTEGER FOREIGN KEY REFERENCES pelicula(pelicula_id),
	genero_id INTEGER FOREIGN KEY REFERENCES genero(genero_id)
)

CREATE TABLE clasificacion (
	clasificacion_id INTEGER PRIMARY KEY IDENTITY,
	nombre VARCHAR(50),
	descripcion VARCHAR(100)
)
