#!/usr/bin/python

import argparse
import random
import datetime

# use .mode tabs and .separator "\t" in sqlite3

parser = argparse.ArgumentParser(description='Generate data.')
parser.add_argument('num_samples', type=int, help='Number of samples')
args = parser.parse_args()

if __name__ == '__main__':

    Lugares = ["Espana", "Catalunya", "Tabarnia", "Francia", "Grecia", "Australia"]
    Nacionalidades = ["Espanyola", "Catalana", "Tabarnensa", "Francesa", "Griega", "Australiana"]
    Nombres = ["Cristina", "Pablo", "Bea", "Juan", "Igor", "Gabriela"]
    Niveles = ["Alto", "Medio", "Bajo"]

    with open('olimpiada.csv', 'w') as olimpiada_file:
        with open('deportista.csv', 'w') as deportista_file:
            with open('participa.csv', 'w') as participa_file:

                anyo_codigos = []
                deportista_codigos = []

                for i in range(args.num_samples):
                    anyo = 2018 - args.num_samples + i
                    seed1 = random.randint(0,len(Lugares) - 1)
                    lugar = "{}".format(Lugares[seed1])
                    print("{}\t{}".format(anyo, lugar), file=olimpiada_file)
                    anyo_codigos.append(anyo)

                    cod_dep = "{}".format(i)
                    nombre = "{}".format(Nombres[random.randint(0,len(Nombres) - 1)])
                    nacionalidad = Nacionalidades[seed1]
                    altura = 150 + random.randint(0, 50)
                    fecha_nac = datetime.date(random.randint(1969,2000), random.randint(1,12),random.randint(1,28))
                    nivel = random.choice(Niveles)

                    entrenador = "NULL"
                    if (len(deportista_codigos) > 0 and random.random() > 0.85):
                        entrenador = random.choice(deportista_codigos)

                    print("{}\t{}\t{}\t{}\t{}\t{}\t{}".format(cod_dep, nombre, nacionalidad, altura, fecha_nac, nivel, entrenador), file=deportista_file)
                    deportista_codigos.append(cod_dep)

                for i in anyo_codigos:
                    for j in deportista_codigos:
                        if (random.random() < 0.05):
                            medallas = random.randint(0, 4)
                            pruebas = medallas * random.randint(1, 3)
                            print("{}\t{}\t{}\t{}".format(i, j, medallas, pruebas), file=participa_file)
