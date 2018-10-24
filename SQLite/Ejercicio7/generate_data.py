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
    destinos = ["Londres", "Portugal", "Madrid", "Nueva York"]
    with open('agencia.csv', 'w') as agencia_file:
        with open('cliente.csv', 'w') as cliente_file:
            with open('reserva.csv', 'w') as reserva_file:

                agencia_codigos = []
                cliente_dnis = []

                for i in range(args.num_samples):
                    codigo = i
                    nombre = "Agencia {}".format(i)
                    direccion = "{}".format(ciudades[random.randint(0,2)])
                    telefono = 900000000 + random.randint(0, 100000000)
                    print("{}\t{}\t{}\t{}".format(codigo, nombre, direccion, telefono), file=agencia_file)
                    agencia_codigos.append(codigo)

                    nombre = "Persona {}".format(i)
                    direccion = "Direccion {}".format(i)
                    ciudad = "{}".format(ciudades[random.randint(0,2)])
                    DNI = random.randint(10000000, 99999999)
                    telefono = 900000000 + random.randint(0, 100000000)
                    fecha_nac = datetime.date(random.randint(1969,2000), random.randint(1,12),random.randint(1,28))
                    print("{}\t{}\t{}\t{}\t{}\t{}".format(DNI, nombre, direccion, ciudad, telefono, fecha_nac), file=cliente_file)
                    cliente_dnis.append(DNI)

                codigo_viaje = 0
                for i in agencia_codigos:
                    for j in cliente_dnis:
                        if (random.random() < 0.2):
                            codigo_viaje += 1
                            destino = destinos[random.randint(0,3)]
                            fecha_salida = datetime.date(2018, random.randint(1,12),random.randint(1,28))
                            importe = random.randint(200, 10000)
                            señal = importe / 2
                            print("{}\t{}\t{}\t{}\t{}\t{}\t{}".format(j, i, destino, codigo_viaje, fecha_salida, importe, señal), file=reserva_file)
