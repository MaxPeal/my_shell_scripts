#!/bin/bash

if [ -n "$2" ]; then
	echo -ne "\auso: `basename $0` [<tamanho de bloco>]\n"
	exit 1;
fi

if [ -n "$1" ]; then
	case "$1" in
	"-k"|"-h")
		B="$1"
	;;
	"-b")
		B="--block-size=1"
	;;
	"-m")
		B="--block-size=1048576"
	;;
	"-g")
		B="--block-size=1073741824"
	;;
	*)
		echo -ne "\auso: `basename $0` [<tamanho de bloco>]\n"
		echo -ne "\a\t<tamanho de bloco> deve ser:\n\t\"-b\" para bytes\n\t\"-k\" para kilobytes\n\t\"-m\" para megabytes\n\t\"-g\" para gigabytes\n\t\"-h\" para indicação do tamanho com uma letra no fim (default)\n"
		exit 2;
	;;
	esac
else
	B="-h"
fi

unalias df

for (( ; ; )) ; do
	clear;
	df $B;
	sleep 1;
done


