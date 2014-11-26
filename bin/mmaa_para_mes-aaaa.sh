#!/bin/bash

# mmaa_para_mes-aaaa.sh
# muda a data fornecida do formato numerico 'mmaa'
# [ mm = mes com dois digitos ; aa = ano com dois digitos ]
# para o formato alfa-numerico 'mes-aaaa'
# [ mes = nome do mes por extenso ; aaaa = ano com 4 digitos ]

# verificando o parametro
if [ -z "$1" -o "$1" = "-h" -o "$1" = "--help" ]; then
    echo -e "Uso: `basename $0` mmaa"
    echo -e "mmaa:"
    echo -e "        mm=mês com dois digitos"
    echo -e "        aa=ano com dois digitos"
    exit 0
elif [ -z $(echo "$1" | grep 1[0-2][0-9][0-9]) ] && \
     [ -z $(echo "$1" | grep 0[1-9][0-9][0-9]) ]; then
    echo -e "Uso: `basename $0` mmaa"
    echo -e "mmaa:"
    echo -e "        mm=mês com dois digitos"
    echo -e "        aa=ano com dois digitos"
    exit -1
fi

# encontrando o mes
mes=$(echo "$1" | cut -b 1-2 | sed 's/01/janeiro/;
                              s/02/fevereiro/;
                              s/03/março/;
                              s/04/abril/;
                              s/05/maio/;
                              s/06/junho/;
                              s/07/julho/;
                              s/08/agosto/;
                              s/09/setembro/;
                              s/10/outubro/;
                              s/11/novembro/;
                              s/12/dezembro/')

# encontrando o ano
if [ $(echo "$1" | cut -b 3-4) -gt $(date +%y) ]; then
    aaaa="19$(echo "$1" | cut -b 3-4)"
else
    aaaa="20$(echo "$1" | cut -b 3-4)"
fi

# imprimindo 'mes-aaaa'
echo "$mes-$aaaa"
