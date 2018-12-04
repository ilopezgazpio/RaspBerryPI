-- 1.- Obtener el origen, destino y hora de salida para todos los vuelos.

   SELECT ORIGEN, DESTINO, HORA_SALIDA FROM VUELOS;

-- 2.- Obtener las ciudades de donde sale algún vuelo.

   SELECT ORIGEN FROM VUELOS;

-- 3.- Obtener el no de vuelo y la hora de los vuelos que hacen el trayecto Madrid-Londres.

   SELECT NUM_VUELO, HORA_SALIDA FROM VUELOS WHERE ORIGEN LIKE 'MADRID' AND DESTINO LIKE 'LONDRES';

-- 4.- Obtener todos los vuelos que salgan de Madrid y lleguen a Barcelona o a Sevilla.

   SELECT * FROM VUELOS WHERE ORIGEN LIKE 'MADRID' AND DESTINO IN ('BARCELONA', 'SEVILLA');

-- 5.- Obtener todos los vuelos que salgan de Madrid, Barcelona o Sevilla.

   SELECT * FROM VUELOS WHERE ORIGEN IN ('MADRID','BARCELONA','SEVILLA');

-- 6.- Recuperar los vuelos que salgan desde las 6 hasta las 12 de la mañana.

   SELECT * FROM VUELOS WHERE HORA_SALIDA >= TIME("06:00") AND HORA_SALIDA <= TIME("12:00");
   SELECT * FROM VUELOS WHERE HORA_SALIDA BETWEEN TIME("06:00") AND TIME("12:00");

-- 7.- Obtener todos los vuelos de la compañía IBERIA.

   SELECT * FROM VUELOS WHERE NUM_VUELO LIKE "IB%";

-- 8.- Obtener cual es la velocidad máxima de crucero.

   SELECT MAX(VELOCIDAD_CRUCERO) FROM AVIONES;

-- 9.- Obtener a qué hora sale el primer vuelo de Madrid.

   SELECT * FROM VUELOS WHERE HORA_SALIDA = (SELECT MIN(HORA_SALIDA) FROM VUELOS );

-- 10.- Obtener cuántas reservas permanecen con más de 50 plazas libres.

   SELECT COUNT(*) FROM RESERVAS WHERE PLAZAS_LIBRES > 50;

-- 11.- Determinar el número de destinos distintos en la tabla VUELOS.

   SELECT COUNT(DISTINCT DESTINO) FROM VUELOS;

-- 12.- Dar el número de plazas que quedan en total en todos los vuelos del día 20 de Febrero de 1992.

   SELECT SUM(PLAZAS_LIBRES) FROM RESERVAS WHERE FECHA_SALIDA = "20/02/08";

-- 13.- Obtener para todas las ciudades de origen a qué hora sale el primer vuelo.

   SELECT ORIGEN, MIN(HORA_SALIDA) FROM VUELOS GROUP BY ORIGEN;

-- 14.- Mostrar el número total de plazas libres existentes para cada vuelo de Iberia (independientemente de la fecha).

   SELECT NUM_VUELO, SUM(PLAZAS_LIBRES) FROM RESERVAS WHERE NUM_VUELO LIKE 'IB%' GROUP BY NUM_VUELO;

-- 15.- Ver qué vuelos de Iberia tienen en total más de 150 plazas libres.

   SELECT NUM_VUELO, SUM(PLAZAS_LIBRES) FROM RESERVAS WHERE NUM_VUELO LIKE 'IB%' GROUP BY NUM_VUELO HAVING SUM(PLAZAS_LIBRES) > 150;

-- 16.- Mirar si hay plazas libres en el vuelo Madrid-Londres del 21/2/1908 a las 20:40.

   SELECT * FROM VUELOS INNER JOIN RESERVAS ON VUELOS.NUM_VUELO = RESERVAS.NUM_VUELO WHERE ORIGEN LIKE 'MADRID' AND DESTINO LIKE 'LONDRES' AND FECHA_SALIDA = "21/02/08" AND HORA_SALIDA = TIME("20:40");

-- 17.- Obtener los tipos de aviones y sus capacidades para aquellos en los que queden menos de 30 plazas libres para alguno de sus vuelos.

   SELECT TIPO, CAPACIDAD FROM AVIONES WHERE TIPO IN ( SELECT TIPO FROM VUELOS INNER JOIN RESERVAS ON VUELOS.NUM_VUELO = RESERVAS.NUM_VUELO WHERE PLAZAS_LIBRES < 30 );
   SELECT TIPO, CAPACIDAD FROM AVIONES WHERE TIPO IN ( SELECT TIPO FROM VUELOS INNER JOIN RESERVAS ON VUELOS.NUM_VUELO = RESERVAS.NUM_VUELO WHERE VUELOS.NUM_VUELO IN (SELECT DISTINCT NUM_VUELO FROM RESERVAS WHERE PLAZAS_LIBRES < 30 ) );

-- 18.- Recuperar los datos de los aviones cuya longitud sea mayor que la envergadura máxima.

   SELECT * FROM AVIONES WHERE LONGITUD > (SELECT MAX(ENVERGADURA) FROM AVIONES);

-- 19.- Recuperar las plazas libres que hay en cada uno de los vuelos Madrid-Londres para el 20/2/08.

   SELECT VUELOS.NUM_VUELO, RESERVAS.PLAZAS_LIBRES, VUELOS.ORIGEN, VUELOS.DESTINO FROM VUELOS INNER JOIN RESERVAS ON VUELOS.NUM_VUELO = RESERVAS.NUM_VUELO WHERE ORIGEN LIKE 'MADRID' AND DESTINO LIKE 'LONDRES' AND FECHA_SALIDA = "20/02/08";
