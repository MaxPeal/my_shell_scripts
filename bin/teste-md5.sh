#!/bin/bash

if [ -z "$1" -o -n "$2" ]; then
    echo -e "\n  Uso: `basename $0` <arquivo-md5>\n"
    exit -1
fi

if [ ! -f "$1" ]; then
    echo -e "\n  Erro: arquivo '$1' não existe ou não é um arquivo regular!\n"
    exit -1
fi

MSG_OK=": OK"
MSG_NOT_OK=": FAILED"
cd `dirname $1`
md5sum -c `basename $1` > /tmp/teste-md5.txt 2>/dev/null
teste1="`nl /tmp/teste-md5.txt | tail -n 1 | awk '{ print $1 }'`"
teste2="`grep \"$MSG_OK\" /tmp/teste-md5.txt | nl | tail -n 1 | awk '{ print $1 }'`"

if [ "$teste1" == "$teste2" ]; then
    echo -e "\n  SUCESSO => A SOMA MD5 DO(S) ARQUIVO(S) CONFERE(M)!\n"
else
    let falhas=teste1-teste2
    grep "$MSG_NOT_OK" /tmp/teste-md5.txt > /tmp/md5_not_ok.txt
    echo -e "\n  NÃO SUCESSO => A SOMA MD5 DE $falhas ARQUIVO(S) NÃO CONFERE(M)!\n"
    echo -e "\n  LISTA DE ARQUIVOS COM A SOMA MD5 ERRADA => /tmp/md5_not_ok.txt\n"
fi
