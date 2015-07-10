#!/bin/sh
# _p_reposicoes.sh - levanta a caixa das letras de algarismos romanos de I (1) a X (10)

help_and_exit()
{
    echo -en "\nUso:\n\t`basename $0` [<texto>|<arquivo>]\n"
    echo -en "\nPS:\n\t Se não for informado nenhum texto ou arquivo, então será usada a entrada padrão do sistema\n\n"
    exit $1
}

sed_fun ()
{
    sed "s/\</\n/g" |\
    sed "h; s/\<\(I\|Ii\|Iii\|Iv\|V\|Vi\|Vii\|Viii\|Ix\|X\)\>/\1/; t troca;
        g; b fim;
        :troca; y/ivx/IVX/;
        :fim" |\
    sed ":i ; $!N ; s/\n// ; ti"
}

if [ "$1" = "-h" -o "$1" = "--help" ]; then
    help_and_exit 0
fi

if [ -z "$1" -o -f "$1" ]; then
    IFS=$'\n'
    for i in `cat $1`; do
        echo "$i" | sed_fun
    done
else
    echo "$1" | sed_fun
fi

exit 0
