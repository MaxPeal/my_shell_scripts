#!/bin/sh

cat >teste1.txt<<EOF
um
dois
três
quatro
cinco
seis
sete
oito
nove
dez
EOF

echo
echo "Primeiro Teste"
echo
sed '/um/,/cinco/ { # entre a linha "um" e a linha "cinco" ...
    /um/ b          # se for a linha "um", salte para o fim do script e
                    # processe a próxima linha (ou seja, não faça nada nesta)
    /cinco/ b       # se for a linha "cinco", salte para o fim do script e
                    # processe a próxima linha (ou seja, não faça nada nesta)
    s/^/---/        # nos outros casos, coloque '---' no começo da linha
}' teste1.txt

cat >teste2.txt<<EOF
um
dois
três
quatro
cinco
seis
sete
oito
nove
dez
EOF

echo
echo "Segundo Teste"
echo
sed '/um/,/cinco/ {                   # entre a linha "um" e a linha "cinco" ...
    /um/ s/^/<p class="text">\n\t/    # se for a linha "um", ponha <p class="text"> no início do bloco
    /um/ b
    /cinco/ s/^\(.*\)$/\t\1\n<\/p>/   # se for a linha "cinco", ponha </p> no fim do bloco
    /cinco/ b
    s/^/\t/                           # nos outros casos, ponha indentação somente
}' teste2.txt

cat >teste3.txt<<EOF
um

dois
três
quatro
cinco
seis

sete
oito
nove
dez

um

dois
três
quatro
cinco
seis

sete
oito
nove
dez

EOF

echo
echo "Terceiro Teste"
echo
sed -e '/um/,/^$/ {                 # entre a linha "um" e a próxima linha vazia ...
    /um/ s/^/<p class="titulo">\n/  # se for a linha "um", ponha <p class="text"> no início do bloco
    /um/ b                          # se for a linha "um", salte para o fim do script
    /^$/ s/^/<\/p>/                 # se for a próxima linha vazia, ponha </p> no fim do bloco
    /^$/ b                          # se for a próxima linha vazia, salte para o fim do script
                                    # nos outros casos, não faça nada
}' -e '/dois/,/^$/ {                # entre a linha "dois" e a próxima linha vazia ...
    /dois/ s/^/<p class="texto">\n/ # se for a linha "dois", ponha <p class="text"> no início do bloco
    /dois/ b                        # se for a linha "dois", salte para o fim do script
    /^$/ s/^/<\/p>/                 # se for a próxima linha vazia, ponha </p> no fim do bloco
    /^$/ b                          # se for a próxima linha vazia, salte para o fim do script
                                    # nos outros casos, não faça nada
}' -e '/sete/,/^$/ {                # entre a linha "sete" e a próxima linha vazia ...
    /sete/ s/^/<p class="nota">\n/  # se for a linha "sete", ponha <p class="text"> no início do bloco
    /sete/ b                        # se for a linha "sete", salte para o fim do script
    /^$/ s/^/<\/p>/                 # se for a próxima linha vazia, ponha </p> no fim do bloco
    /^$/ b                          # se for a próxima linha vazia, salte para o fim do script
                                    # nos outros casos, não faça nada
}' teste3.txt

