#!/bin/bash

if [ -n "$1" ]; then
	case "$1" in
	"-b")
		B="--block-size=1"
   	    ;;
	"-k")
	    B="--block-size=1k"
        ;;
	"-m")
	    B="--block-size=1m"
        ;;
	"-g")
        B="--block-size=1g"
    	;;
    "-h")
        B="-h"
    	;;
	*)
		echo -ne "\a\nuso: `basename $0` [<tamanho de bloco> <diretorio>]\n\n"
		echo -ne "\t<tamanho de bloco> pode ser:\n\t\"-b\" para bytes;\n\t\"-k\" para kilobytes;\n\t\"-m\" para megabytes;\n\t\"-g\" para gigabytes;\n\t\"-h\" para indicação do tamanho com uma letra no fim. (default)\n\n"
        usuario=`whoami`
        echo -ne "\t<diretorio> pode ser:\n\tqualquer pasta \"legivel\" do sistema pelo usuario \"$usuario\".\n\n"
		echo -ne "Saida com exit status = -1\n\n";
		exit -1;
    	;;
	esac
else
	B="-h"
fi

if [ -n "$2" ]; then
    if [ -e "$2" ]; then
        D="$2"
    else
		echo -ne "\a\nuso: `basename $0` [<tamanho de bloco> <diretorio>]\n\n"
		echo -ne "\t<tamanho de bloco> pode ser:\n\t\"-b\" para bytes;\n\t\"-k\" para kilobytes;\n\t\"-m\" para megabytes;\n\t\"-g\" para gigabytes;\n\t\"-h\" para indicação do tamanho com uma letra no fim. (default)\n\n"
        usuario=`whoami`
        echo -ne "\t<diretorio> pode ser:\n\tqualquer pasta \"legivel\" do sistema pelo usuario \"$usuario\".\n\n"
		echo -ne "Saida com exit status = -2\n\n";
		exit -2
    fi
else
    D="."
fi

unalias ls

for (( ; ; )) ; do
	clear;
	ls -l $B $D;
	sleep 1;
done
