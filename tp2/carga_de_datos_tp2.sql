USE cine_paraiso

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
	   ('usuario3@gmail.com', 'usuario3', 'user789')

INSERT INTO pago (usuario_id, fecha_pago, precio_pagado)
VALUES (1, '2022-11-30', 0),
	   (2, '2022-11-27', 100),
	   (3, '2022-11-28', 150)

-- Le sumamos un mes a cada fecha de pago para el vencimiento.
INSERT INTO suscripcion (usuario_id, plan_id, vencimiento)
VALUES (1, 1, DATEADD(mm, 1, '2022-11-30')),
	   (2, 2, DATEADD(mm, 1, '2022-11-27')),
	   (3, 3, DATEADD(mm, 1, '2022-11-27'))
