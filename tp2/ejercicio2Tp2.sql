use cine_paraiso

CREATE TABLE [plan] (
	plan_id INTEGER PRIMARY KEY IDENTITY,
	nombre_plan VARCHAR(50),
	precio FLOAT,
	mes_year BIT
)

CREATE TABLE usuario (
	usuario_id INTEGER PRIMARY KEY IDENTITY,
	mail VARCHAR(50),
	usuario VARCHAR(50),
	pass VARCHAR (50)
)

CREATE TABLE pago (
	pago_id INTEGER PRIMARY KEY IDENTITY,
	usuario_id INTEGER FOREIGN KEY REFERENCES usuario(usuario_id),
	fecha_pago DATE,
	precio_pagado FLOAT
)

CREATE TABLE subscripcion (
	sub_id INTEGER PRIMARY KEY IDENTITY,
	usuario_id INTEGER FOREIGN KEY REFERENCES usuario(usuario_id),
	[plan] INT,
	vencimiento date
)

