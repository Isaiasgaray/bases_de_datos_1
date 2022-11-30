# 1.
Las relaciones presentadas en el trabajo práctico anterior ya se enecuentran en 3FN porque se cumplen las siguientes definiciones:

* Todas las relaciones poseen únicamente valores atómicos en sus atributos. Por lo tanto se encuentran en 1FN.

* Todos los atributos no clave dependen completamente de la clave. Por lo tanto también se encuentra en 2FN.

* Todos los atributos no clave dependen de manera no transitiva de la clave primaria. Por lo tanto las relaciones se encuentran en 3FN.

# 2.
La tabla de usuarios cuenta con atributos autoexplicativos.

La tabla de pago cuenta con el atributo `fecha_pago` en el que cada fecha que abona el usuario y el atributo `precio_pagado` que determina qué monto se pagó en esa fecha. Es importante tener estos dos atributos para contar con un histórico del pago realizado por el usuario y las modificaciones de precio que sufrió el plan.

En la tabla plan cabe destacar que el atributo `mes_year` es de tipo BIT y que almacenará un 0 si el plan es mensual o un 1 si el plan es anual.

En la tabla suscripción destacamos el atributo `vencimiento` que contiene la fecha del próximo vencimiento para el usuario. La idea es que la base de datos cuente con un trigger que le sume un mes a este atributo cada vez que se agregue una nueva entrada correspondiente al usuario en la tabla de pagos.


