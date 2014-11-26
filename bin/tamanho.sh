#!/bin/bash

if [ -z "$1" ]; then
	echo -ne "\auso: `basename $0` <arquivo> [<tamanho de bloco>]\n"
	exit 1;
elif [ ! -f "$1" ]; then
	echo -ne "\a\tnome de arquivo \"$1\" inválido\n"
	exit 1;
fi

if [ -n "$2" ]; then
	case "$2" in
	"-b"|"-k"|"-m"|"-h")
		B="$2"
	;;
	*)
		echo -ne "\auso: `basename $0` <arquivo> [<tamanho de bloco>]\n"
		echo -ne "\a\t<tamanho de bloco> deve ser:\n\t\"-b\" para bytes\n\t\"-k\" para kilobytes\n\t\"-m\" para megabytes\n\t\"-h\" para indicação do tamanho com uma letra no fim (default)\n"
		exit 2;
	;;
	esac
else
	B="-h"
fi

for ((;;)) ; do
	clear;
	du $B "$1";
	sleep 2;
done
