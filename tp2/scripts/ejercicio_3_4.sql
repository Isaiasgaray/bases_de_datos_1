-- Ejercicio 3

-- Hacer un procedimiento que recibe un id de usuario
-- y le actualice el plan a 1.
CREATE PROCEDURE usp_BajaDePlan	
AS
DECLARE @id_plan_gratis INT
SELECT @id_plan_gratis = plan_id
FROM [plan]
WHERE precio = 0
UPDATE suscripcion 
SET plan_id = @id_plan_gratis
WHERE usuario_id IN 
-- Em esta subquery traemos el id de usuarios a los que se les venció
-- el plan por falta de pago en el mes actual.
(SELECT s.usuario_id 
FROM pago p 
INNER JOIN suscripcion s 
ON s.usuario_id = p.usuario_id 
WHERE precio_pagado > 0
AND GETDATE() > s.vencimiento)

-- Ejercicio 4
CREATE PROCEDURE usp_VerificarLogin	
	@usuario VARCHAR(50),
	@pass    VARCHAR(50)
AS
DECLARE @login INT
SELECT @login = COUNT(*)
FROM usuario
WHERE usuario = @usuario
AND pass = @pass
RETURN @login