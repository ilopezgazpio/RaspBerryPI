#!/usr/bin/python

import argparse
import random
import datetime

# use .mode tabs and .separator "\t" in sqlite3

parser = argparse.ArgumentParser(description='Generate data.')
parser.add_argument('num_samples', type=int, help='Number of samples')
args = parser.parse_args()

if __name__ == '__main__':

    ciudades = ["Bilbao", "San Sebastian", "Vitoria"]
    with open('agencia.csv', 'w') as agencia_file:
        with open('cliente.csv', 'w') as cliente_file:
            with open('reserva.csv', 'w') as reserva_file:

                for i in range(args.num_samples):
                    codigo = i
                    nombre = "Agencia {}".format(i)
                    direccion = "{}".format(ciudades[random.randint(0,2)])
                    telefono = 900000000 + random.randint(0, 100000000)
                    print("{}\t{}\t{}\t{}".format(codigo, nombre, direccion, telefono), file=agencia_file)

                    nombre = "Persona {}".format(i)
                    direccion = "Direccion {}".format(i)
                    ciudad = "{}".format(ciudades[random.randint(0,2)])
                    DNI = random.randint(0, 99999999)
                    telefono = 900000000 + random.randint(0, 100000000)
                    fecha_nac = datetime.date(random.randint(1969,2000), random.randint(1,12),random.randint(1,28))
                    print("{}\t{}\t{}\t{}\t{}\t{}".format(DNI, nombre, direccion, ciudad, telefono, fecha_nac), file=cliente_file)

