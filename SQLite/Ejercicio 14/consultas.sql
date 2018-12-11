-- 1.- Obtener los detalles de todos los proyectos de Londres.

   SELECT * FROM PROYECTOS WHERE CIUDAD LIKE 'LONDRES';

-- 2.- Obtener los números de proveedor que suministran piezas al proyecto J1 ordenados por codigo.

   SELECT CODIGO_PROVEEDOR FROM ENVIOS WHERE CODIGO_PROYECTO LIKE 'J1' ORDER BY CODIGO_PROVEEDOR;

-- 3.- Obtener todos los envíos en los cuales la cantidad está en el intervalo de 300 a 750.

   SELECT * FROM ENVIOS WHERE CANT BETWEEN 300 AND 750;

-- 4.- Obtener las tripletas S#/P#/J# tales que el proveedor, la pieza y el proyecto indicados estén todos en la misma ciudad (cosituados)

   SELECT *
   FROM ENVIOS INNER JOIN PIEZAS ON ENVIOS.CODIGO_PIEZA = PIEZAS.CODIGO INNER JOIN PROVEEDORES ON ENVIOS.CODIGO_PROVEEDOR = PROVEEDORES.CODIGO INNER JOIN PROYECTOS ON ENVIOS.CODIGO_PROYECTO = PROYECTOS.CODIGO
   WHERE PIEZAS.CIUDAD = PROVEEDORES.CIUDAD AND PROYECTOS.CIUDAD = PROVEEDORES.CIUDAD;

-- 5.- Obtener los números de la piezas suministradas por un proveedor de Londres a un proyecto de Londres.

   SELECT DISTINCT ENVIOS.CODIGO_PIEZA
   FROM ENVIOS INNER JOIN PROVEEDORES ON ENVIOS.CODIGO_PROVEEDOR = PROVEEDORES.CODIGO INNER JOIN PROYECTOS ON ENVIOS.CODIGO_PROYECTO = PROYECTOS.CODIGO
   WHERE PROVEEDORES.CIUDAD = PROYECTOS.CIUDAD;

-- 6.- Obtener el número total de proyectos a los cuales suministra piezas el proveedor S1.

   SELECT COUNT(*)
   FROM ENVIOS
   WHERE CODIGO_PROVEEDOR LIKE 'S1';

-- 7.- Obtener los números de las piezas suministradas a algún proyecto tales que la cantidad media de cada pieza en cada proyecto sea mayor que 320.

   SELECT DISTINCT ENVIOS.CODIGO_PIEZA
   FROM ENVIOS
   GROUP BY ENVIOS.CODIGO_PIEZA, ENVIOS.CODIGO_PROYECTO
   HAVING AVG(ENVIOS.CANT) > 320;

-- 8.- Obtener todos los envíos para los cuales la cantidad no sea nula.

   SELECT * FROM ENVIOS WHERE CANT IS NOT NULL;

-- 9.- Obtener los números de proyecto y ciudad en los cuales la segunda letra del nombre de la ciudad sea una 'o'.

   SELECT CODIGO, NOM FROM PROYECTOS WHERE CIUDAD LIKE '_O%';

-- 10.- Obtener los nombres de los proyectos a los cuales suministra piezas el proveedor S1.

   SELECT PROYECTOS.NOM FROM PROYECTOS INNER JOIN ENVIOS ON PROYECTOS.CODIGO = ENVIOS.CODIGO_PROYECTO WHERE ENVIOS.CODIGO_PROVEEDOR LIKE 'S1';

   SELECT NOM FROM PROYECTOS WHERE CODIGO IN (SELECT CODIGO_PROYECTO FROM ENVIOS WHERE CODIGO_PROVEEDOR LIKE 'S1');

-- 11.- Obtener los colores de las piezas suministradas por el proveedor S1.

   SELECT DISTINCT COLOR FROM ENVIOS INNER JOIN PIEZAS ON ENVIOS.CODIGO_PIEZA = PIEZAS.CODIGO AND ENVIOS.CODIGO_PROVEEDOR LIKE 'S1';

   SELECT DISTINCT COLOR FROM PIEZAS WHERE CODIGO IN (SELECT CODIGO_PIEZA FROM ENVIOS WHERE CODIGO_PROVEEDOR LIKE 'S1');

-- 12.- Obtener los números de las piezas suministradas a cualquier proyecto de Londres.

   SELECT DISTINCT ENVIOS.CODIGO_PIEZA FROM ENVIOS INNER JOIN PROYECTOS ON ENVIOS.CODIGO_PROYECTO = PROYECTOS.CODIGO WHERE CIUDAD LIKE 'LONDRES';

   SELECT DISTINCT CODIGO_PIEZA FROM ENVIOS WHERE CODIGO_PROYECTO IN (SELECT CODIGO FROM PROYECTO WHERE CIUDAD LIKE 'LONDRES');

-- 13.- Obtener los números de los proveedores cuyo estado sea inferior al del proveedor S1.

   SELECT CODIGO FROM PROVEEDORES WHERE ESTADO < (SELECT ESTADO FROM PROVEEDORES WHERE CODIGO LIKE 'S1');

-- 14.- Obtener los números de los proyectos a los cuales se suministra la pieza P1 en una cantidad promedio mayor que la cantidad máxima en la cual se suministra alguna pieza al proyecto J1.

   SELECT ENVIOS.CODIGO_PROYECTO
   FROM ENVIOS
   WHERE CODIGO_PIEZA LIKE 'P1'
   GROUP BY ENVIOS.CODIGO_PROYECTO
   HAVING AVG(ENVIOS.CANT) > (

   SELECT MAX(CANT)
   FROM ENVIOS
   WHERE CODIGO_PROYECTO LIKE 'J1'
   GROUP BY CODIGO_PIEZA

);

-- 15.- Obtener los números de pieza para aquellas piezas que sean distribuidas por algún distribuidor de Londres

   SELECT CODIGO_PIEZA FROM ENVIOS WHERE EXISTS ( SELECT * FROM PROVEEDORES WHERE ENVIOS.CODIGO_PROVEEDOR = PROVEEDORES.CODIGO AND CIUDAD LIKE 'LONDRES');
