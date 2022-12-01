USE cine_paraiso

CREATE TABLE [plan] (
	plan_id INTEGER PRIMARY KEY IDENTITY,
	nombre_plan VARCHAR(50),
	precio FLOAT,
	mes_year BIT
)

CREATE TABLE usuario (
	usuario_id INTEGER PRIMARY KEY IDENTITY,
	mail VARCHAR(50) UNIQUE,
	usuario VARCHAR(50) UNIQUE,
	pass VARCHAR (50)
)

CREATE TABLE pago (
	pago_id INTEGER PRIMARY KEY IDENTITY,
	usuario_id INTEGER FOREIGN KEY REFERENCES usuario(usuario_id),
	fecha_pago DATE,
	precio_pagado FLOAT
)

CREATE TABLE suscripcion (
	sus_id INTEGER PRIMARY KEY IDENTITY,
	usuario_id INTEGER FOREIGN KEY REFERENCES usuario(usuario_id),
	plan_id INTEGER FOREIGN KEY REFERENCES [plan](plan_id),
	vencimiento date
)

-- Para el campo 'mes_year' el valor de 0
-- representa el plan mensual y el 1 el plan anual.
INSERT INTO [plan] (nombre_plan, precio, mes_year)
VALUES ('Plan Gratis', 0, 0),
	   ('Plan Premium', 100, 0),
	   ('Plan Familiar', 150, 0),
	   ('Plan Premium', 1000, 1),
	   ('Plan Familiar', 1500, 1)

INSERT INTO usuario (mail, usuario, pass)
VALUES ('usuario1@gmail.com', 'usuario1', 'user123'),
	   ('usuario2@gmail.com', 'usuario2', 'user456'),
	   ('usuario3@gmail.com', 'usuario3', 'user789'),
	   ('usuario4@gmail.com', 'usuario4', 'user789')

INSERT INTO pago (usuario_id, fecha_pago, precio_pagado)
VALUES (1, '2022-11-30', 0),
	   (2, '2022-11-27', 100),
	   (3, '2022-11-28', 150),
	   (4, '2022-10-10', 100)

-- Le sumamos un mes a cada fecha de pago para el vencimiento.
INSERT INTO suscripcion (usuario_id, plan_id, vencimiento)
VALUES (1, 1, DATEADD(mm, 1, '2022-11-30')),
	   (2, 2, DATEADD(mm, 1, '2022-11-27')),
	   (3, 3, DATEADD(mm, 1, '2022-11-27')),
	   (4, 2, DATEADD(mm, 1, '2022-10-10'))