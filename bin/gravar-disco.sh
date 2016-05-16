#!/bin/bash

if [ -z "${3}" -o -n "${4}" ] || [ "${1}" != "-cd" -a "${1}" != "-dvd" ] || [ ! -f "${2}" ] || [ ! -r "${2}" ]
then
 	echo -e "\n  Uso: `basename $0` -cd|-dvd arquivo dispositivo\n"
	exit -1
fi

test ! -f "${2}.sha256" && \
	sha256sum "${2}" > "${2}.sha256"

if [ "${1}" = "-dvd" ]
then
	wodim dev=$3 speed=8 -v -eject -data "${2}"
else
	wodim dev=$3 speed=52 -v -eject -data "${2}"
fi

echo -e -n "\n\tINSIRA NOVAMENTE O CD/DVD QUE ACABOU DE GRAVAR ..."
echo -e -n "\n\tDEPOIS DIGITE <ENTER> PARA CONTINUAR ..."
read
sleep 30

if [ "$(cat $3 | sha256sum | sed 's/^\([a-f0-9]\{,65\}\).*$/\1/')" == "$(sed 's/^\([a-f0-9]\{,65\}\).*$/\1/' "${2}.sha256")" ]; then
	echo -e "\n\tA GRAVAÇÃO FOI UM SUCESSO!\n"
else
    echo -e "\n\tA GRAVAÇÃO FALHOU!\n"
fi

#dd if=$3 of="${2}.1"
#mv -f "${2}"   "${2}.orig"
#mv -f "${2}.1" "${2}"
#sha256sum -c "${2}.sha256"
