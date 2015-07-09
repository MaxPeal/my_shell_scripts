#!/bin/sh

# verifica se ja foi instalado o IRPF 2015
if [ -f "$HOME/ProgramasRFB/IRPF2015/irpf.jar" -a -f "$HOME/ProgramasRFB/IRPF2015/Uninstaller/uninstaller.jar" ]; then
    echo -e "\nO IRPF 2015 ja encontra-se instalado em \"$HOME/ProgramasRFB/IRPF2015\".\n"
    exit 0
fi

# verifica se o arquivo de instalacao do IRPF 2015 ja foi baixado
if [ ! -f "$HOME/ProgramasRFB/IRPF2015v1.2.jar" ]; then
    echo -e "\nBaixando o IRPF 2015 1.2:\n"
    wget -c -O "$HOME/ProgramasRFB/IRPF2015v1.2.jar" "http://www28.receita.fazenda.gov.br/publico/programas/IRPF/2015/PGDIRPF2015/Java/Solaris/IRPF2015v1.2.jar"
fi

# Instala o IRPF 2015
echo -e "\nInstalando o IRPF 2015 1.2:\n"
java -jar "$HOME/ProgramasRFB/IRPF2015v1.2.jar"

exit 0
