#!/bin/bash

if [ -z "$1" ]; then
	echo -e "\n\a\tUso: `basename $0` <arquivo de destino>\n";
	exit -1;
fi

if [ -e "$1" ]; then
	for ((i=0; i>=0; i++)); do
		echo -en "\tSobre-escrever "$1"? (S/N)";
		read r;
		if [ "$r" = "N" -o "$r" = "n" ]; then
			exit 0;
		elif [ "$r" = "S" -o "$r" = "s" ]; then
			break;
		fi
	done
fi
	
tccat -T 1,1,1 -L -i /dev/hda -t dvd -d 0 > "$1"

