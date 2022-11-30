use cine_paraiso

CREATE TABLE [plan] (
	plan_id INTEGER PRIMARY KEY IDENTITY,
	nombre_plan VARCHAR(50),
	precio FLOAT
)
CREATE TABLE usuario (
	usuario_id INTEGER PRIMARY KEY IDENTITY,
	mail VARCHAR(50),
	usuario VARCHAR(50),
	pass VARCHAR (50),
	plan_id INTEGER FOREIGN KEY REFERENCES [plan](plan_id)
)
CREATE TABLE pagos (
	plan_id INTEGER NOT NULL FOREIGN KEY REFERENCES [plan](plan_id),
	usuario_id INTEGER NOT NULL FOREIGN KEY REFERENCES usuario(usuario_id),
	fecha_pago DATE,
	precio_pagado FLOAT
)