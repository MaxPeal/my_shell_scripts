#!/bin/sh
# _p_reposicoes.sh - diminui a caixa das letras das palavras de até
#                    3 letras ou da palavra 'para'

help_and_exit()
{
    echo -en "\nUso:\n\t`basename $0` [<texto>|<arquivo>]\n"
    echo -en "\nPS:\n\t Se não for informado nenhum texto ou arquivo, então será usada a entrada padrão do sistema\n\n"
    exit $1
}

sed_fun ()
{
    sed "s/\</\n/g" |\
    sed "h; s/\<\(O\|Os\|A\|As\|À\|Às\|E\|Em\|Do\|Dos\|Da\|Das\|De\|Um\|Uns\|Uma\|Umas\|Dum\|Duns\|Duma\|Dumas\|Prum\|Pruns\|Pruma\|Prumas\|Pra\|Pras\|Pro\|Pros\|Para\|Até\)\>/\1/; t troca;
        g; b fim;
        :troca; y/ABCDEFGHIJKLMNOPQRSTUVWXYZÁÀÃÂÄÉÈẼÊËÍÌĨÎÏÓÒÕÔÖÚÙŨÛÜÝỲỸŶŸÇ/abcdefghijklmnopqrstuvwxyzáàãâäéèẽêëíìĩîïóòõôöúùũûüýỳỹŷÿç/;
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
