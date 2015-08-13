#!/usr/bin/python2
# -*- coding: utf-8 -*-


import sys
from datetime import date


def print_help():

    print "Uso: escala.py data_inicio data_fim"
    print "Aonde: data_inicio < data_fim"
    return None


if __name__ == '__main__':

    try:
        data_inicio = sys.argv[1]
    except:
        print_help()
        sys.exit(1)

    try:
        data_fim = sys.argv[2]
    except:
        print_help()
        sys.exit(1)

    if (not data_inicio) or (not data_fim):
        print_help()
        sys.exit(1)

    data_inicio = data_inicio.split("/")
    data_fim = data_fim.split("/")

    try:
        data_inicio = date(
            int(data_inicio[2]),
            int(data_inicio[1]),
            int(data_inicio[0])
        )
    except:
        print_help()
        sys.exit(2)

    try:
        data_fim = date(int(data_fim[2]), int(data_fim[1]), int(data_fim[0]))
    except:
        print_help()
        sys.exit(2)

    if data_inicio >= data_fim:
        print_help()
        sys.exit(3)

    escala = []
    for data_ord in range(data_inicio.toordinal(), data_fim.toordinal()+1, 3):
        escala.append(date.fromordinal(data_ord))

    for data in escala:
        print data.strftime('%d %B %Y')

    sys.exit(0)
