#!/bin/bash

help_and_exit()
{
    echo -e "\nUso:\n\t`basename $0` <arquivo_firefox_tarball> <arquivo_firefox_checksums>"
    echo -e "\nPS: Os arquivos devem estar no diretorio corrente.\n"
    exit $1
}

if [ -z "$1" -o "$1" = "-h" -o "$1" = "--help" ]; then
    help_and_exit 0
fi

if [ ! -f "$1" -o ! -f "$2" ]; then
    help_and_exit 1
fi

grep "$1" "$2" | grep 'sha1' | sed 's/ sha1 [0-9]\+ /  /' | sha1sum -c >/dev/null 2>&1
if [ "$?" != "0" ]; then
    echo -e "\nARQUIVO: \"$1\" ESTÁ CORROMPIDO!\n"
    exit 2
fi

echo -e "\nARQUIVO: \"$1\" ESTÁ OK!\n"
exit 0
