-- Activate PRAGMA foreign_keys = ON; for cascade deletion

DROP TABLE IF EXISTS VUELOS;

CREATE TABLE VUELOS(
       NUM_VUELO TEXT PRIMARY KEY NOT NULL,
       ORIGEN TEXT,
       DESTINO TEXT,
       HORA_SALIDA DATETIME,
       TIPO_AVION TEXT REFERENCES AVIONES(TIPO) ON DELETE CASCADE
);

INSERT INTO VUELOS VALUES
("IB600"    ,"MADRID"	  ,"LONDRES",	time("10:30"), "320"),
("BA467"    ,"MADRID"	  ,"LONDRES",	time("20:40"), "73S"),
("IB0640"   ,"MADRID"	  ,"BARCELONA", time("06:45"), "320"),
("IB3742"   ,"MADRID"	  ,"BARCELONA", time("09:15"), "72S"),
("LH1349"   ,"COPENHAGUE" ,"FRANCFORT", time("10:20"), "320"),
("AF577"    ,"BILBAO"	  ,"PARIS",	time("10:10"), "737"),
("IB3709"   ,"DUBLIN" 	  ,"BARCELONA",	time("14:35"), "D9S"),
("IB778"    ,"BARCELONA"  ,"ROMA",	time("09:45"), "72S"),
("IB721"    ,"BARCELONA"  ,"SEVILLA",	time("16:40"), "72S"),
("IB327"    ,"MADRID" 	  ,"SEVILLA",	time("18:05"), "72S"),
("IB023"    ,"MADRID" 	  ,"TENERIFE",	time("21:20"), "72S"),
("IB368"    ,"MALAGA" 	  ,"BARCELONA",	time("22:25"), "D9S"),
("IB610"    ,"MALAGA" 	  ,"LONDRES",	time("15:05"), "73S"),
("IB510"    ,"SEVILLA" 	  ,"MADRID",	time("07:45"), "72S"),
("IB318"    ,"SEVILLA" 	  ,"MADRID",	time("10:45"), "72S");
