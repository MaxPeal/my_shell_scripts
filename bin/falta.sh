#!/bin/bash

[ "$1X" = "X" -o "$2X" != "X" ] && echo -e "\tuso: $0 diretorio\a" && exit 1
[ ! -d "$1" ] && echo -e "\t'$1' não é um diretório válido!\a" && exit 2

for i in `find $1 -name *.deb`; do
	if test "`file $i | cut -d ' ' -f 2`X" = "dataX";
	then
		echo -e "\tfaltando '$i'"
	fi
done


