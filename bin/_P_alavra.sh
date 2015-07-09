#!/bin/sh
# _P_alavra.sh - levanta a caixa da primeira letra de cada palavra,
#                convertendo o resto de cada palavra para minúsculas.

help_and_exit()
{
    echo -en "\nUso:\n\t`basename $0` [<texto>|<arquivo>]\n"
    echo -en "\nPS:\n\t Se não for informado nenhum texto ou arquivo, então será usada a entrada padrão do sistema\n\n"
    exit $1
}

sed_fun ()
{
    sed "s/\</\n/g" |\
    sed "y/ABCDEFGHIJKLMNOPQRSTUVWXYZÁÀÃÂÄÉÈẼÊËÍÌĨÎÏÓÒÕÔÖÚÙŨÛÜÝỲỸŶŸÇ/abcdefghijklmnopqrstuvwxyzáàãâäéèẽêëíìĩîïóòõôöúùũûüýỳỹŷÿç/;
        h; s/^\([[:blank:]]*[[:lower:]]\).*/\1/;
        y/abcdefghijklmnopqrstuvwxyzáàãâäéèẽêëíìĩîïóòõôöúùũûüýỳỹŷÿç/ABCDEFGHIJKLMNOPQRSTUVWXYZÁÀÃÂÄÉÈẼÊËÍÌĨÎÏÓÒÕÔÖÚÙŨÛÜÝỲỸŶŸÇ/;
        x; s/^[[:blank:]]*[[:lower:]]//; H ; g ; s/\n//" |\
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
