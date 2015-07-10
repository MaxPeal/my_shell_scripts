#!/bin/bash

[ -z "$1" ] && exit -1
[ -z "$2" ] && exit -2
[ -z "$3" ] && exit -3

# passar como parametros: o nome dos arquivos, aid e sid conforme o dvd:
mencoder -of mpeg -o $1.mpg -oac copy -ovc copy -vobsubout $1 dvd:// -aid $2 -sid $3

# juntando os arquivos:
mkvmerge -o $1.mkv $1.mpg $1.sub

# recodificando o arquivo $1.mkv em $1.1.mpg:
mencoder -of mpeg -oac copy -ovc copy -o $1.1.mpg $1.mkv

# renomeando:
mv -f $1.1.mpg $1.mpg

# saindo:

