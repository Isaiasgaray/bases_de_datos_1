use cine_paraiso


CREATE TABLE [plan] (
	plan_id INTEGER PRIMARY KEY IDENTITY,
	nombre_plan VARCHAR(50),
	precio FLOAT,
	mes_year BIT,
	
)
CREATE TABLE usuario (
	usuario_id INTEGER PRIMARY KEY IDENTITY,
	mail VARCHAR(50),
	usuario VARCHAR(50),
	pass VARCHAR (50)
)
CREATE TABLE pagos (
	id_pago INTEGER PRIMARY KEY IDENTITY,
	fecha_pago DATE,
	precio_pagado FLOAT
)

CREATE TABLE Subscripcion (
	id_sub INTEGER PRIMARY KEY IDENTITY,
	id_usuario INTEGER FOREIGN KEY REFERENCES usuario(usuario_id),
	[plan] INT,
	Vencimiento date
)

