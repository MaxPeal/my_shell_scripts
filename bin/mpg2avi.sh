#!/bin/bash

if [ -z "$1" ]; then
    echo -e "\n\auso:\n\t`basename $0` nome_do_arquivo.mpg [-m|-t]\n"
    exit -1
fi

name_file=`basename $1 .mpg`
if [ "$name_file" == "$1" ]; then
    echo -e "\n\auso:\n\t`basename $0` nome_do_arquivo.mpg [-m|-t]"
    echo -e "\narquivo '$1' não possui extensão '.mpg'\n"
    exit -2
fi

if [ ! -f "$1" ]; then
    echo -e "\n\auso:\n\t`basename $0` nome_do_arquivo.mpg [-m|-t]"
    echo -e "\narquivo '$1' não existe\n"
    exit -3
fi

if [ -z "$2" ]; then
    prog="-m"
else
    prog="$2"
fi

if [ $prog != "-m" -a $prog != "-t" ]; then
    echo -e "\n\auso:\n\t`basename $0` nome_do_arquivo.mpg [-m|-t]"
    echo -e "\n'$prog' opção inválida\n"
    exit -4
fi

if [ "$prog" == "-m" ]; then
    mencoder "$1" -ovc xvid -oac mp3lame \
        -xvidencopts pass=1:me_quality=6:vhq=4:zones=0,w,1.0:aspect=16/9:par=vga11:noautoaspect \
        -lameopts vbr=0:cbr:br=384:aq=0 \
        -quiet -o "$name_file".avi
else
    transcode -x mpeg2 -i "$1" -w 2589,50 -b 128,0,2 --export_par 118,100 -y xvid -o "$name_file".avi --progress_meter 2 --progress_rate 25
fi
