#!/bin/bash

help_and_exit()
{
    echo -e "\nUso:\n\t`basename $0` <versao_do_nodejs>"
    echo -e "\nPS: Os arquivos serao baixados para o diretorio corrente.\n"
    exit $1
}

if [ -z "$1" -o "$1" = "-h" -o "$1" = "--help" ]; then
    help_and_exit 0
fi

wget -c \
    "http://nodejs.org/dist/${1}/node-${1}-linux-x64.tar.gz" \
    "http://nodejs.org/dist/${1}/node-${1}.tar.gz" \
    "http://nodejs.org/dist/${1}/SHASUMS.txt.asc"
if [ "$?" != "0" ]; then
    echo -e "\n\tERRO: ARQUIVOS NAO PODEM SER BAIXADOS!\n"
    exit 1
fi

gpg2 --verify SHASUMS.txt.asc >/dev/null 2>&1
if [ "$?" != "0" ]; then
    echo -e "\n\tERRO: ARQUIVOS BAIXADOS NAO PODEM SER VERIFICADOS!\n"
    exit 1
fi

grep -e "node-${1}.tar.gz" -e "node-${1}-linux-x64.tar.gz" SHASUMS.txt.asc | sha1sum -c >/dev/null 2>&1
if [ "$?" != "0" ]; then
    echo -e "\n\tERRO: ALGUM(NS) ARQUIVO(S) BAIXADO(S) ESTA(AO) CORROMPIDO(S)!\n"
    exit 1
fi

echo -e "\n\tSUCESSO: TODOS OS ARQUIVOS BAIXADOS ESTAO OK!\n"

exit 0
