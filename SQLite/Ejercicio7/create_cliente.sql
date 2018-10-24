DROP TABLE IF EXISTS CLIENTE;

CREATE TABLE CLIENTE(
       DNI NUMERIC(8) PRIMARY KEY,
       NOM TEXT,
       DIR TEXT,
       CIUDAD TEXT DEFAULT 'BILBAO',
       TF NUMERIC(9)
);