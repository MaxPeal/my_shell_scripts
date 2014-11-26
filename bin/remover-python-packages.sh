#!/bin/bash

if [ -z "$1" -o "$1" = "-h" -o "$1" = "--help" ]; then
    echo -e "\a\n\tMUITO CUIDADO AO USAR ESTE PROGRAMA!!!"
    echo -e "\a\n\tESSE PROGRAMA APAGA TODOS OS PACOTES PYTHON NO DIRETORIO INFORMADO!!!"
    echo -e "\a\n\tUSO: `basename $0` <diretorio>"
    echo -e "\a\n\t<diretorio> = diretorio raiz dos pacotes python a ser removidos"
    echo -e "\a\n\tEX: remover-python-packages.sh /usr/lib/python2.7/site-packages\n"
    exit 0
fi

for i in `find "$1" -type f -regex '^.*\/installed-files.txt$' -exec egrep '\.\.\/\.\.' '{}' \;`; do
    fi=`echo "$i" | awk -F '../../../..' '{ print "/usr" $2 }'`
    sudo rm -f $fi
done

sudo rm -rf "$1"
sudo mkdir -p "$1"

exit 0
