#!/bin/bash

[ -z "$1" ] && exit 1
[ -z "$2" ] && exit 2
[ -z "$3" ] && exit 3
[ -z "$4" ] && exit 4

# passar como parametros: o nome dos arquivos, aid e sid conforme o dvd:
mencoder -of mpeg -o $1.mpg -oac copy -ovc copy -vobsubout $1 dvd://$2 -aid $3 -sid $4

# juntando os arquivos:
mkvmerge -o $1.mkv $1.mpg $1.sub

# recodificando o arquivo $1.mkv em $1.1.mpg:
mencoder -of mpeg -oac copy -ovc copy -o "${1}\+sub.mpg" $1.mkv
