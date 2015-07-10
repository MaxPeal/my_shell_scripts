#!/bin/sh

# verifica se ja foi instalado o IRPF 2015
if [ ! -f $HOME/ProgramasRFB/IRPF2015/irpf.jar -o ! -f $HOME/ProgramasRFB/IRPF2015/Uninstaller/uninstaller.jar ]; then
    echo -e "\nAntes de executar este script, instale o IRPF 2015 em \"$HOME/ProgramasRFB/IRPF2015\".\n"
    exit 0
fi

# ajuda com o uso do script
if [ -z "$1" -o "$1" = "-h" ]; then
    echo -e "\nUso: `basename $0` <arquivo de configuracao de menus>\n"
    exit 0
fi

# verifica se o argumento $1 eh um arquivo existente e se tem permissao de escrita
if [ ! -r "$1" ]; then
    echo -e "\nErro: arquivo \"$1\" nao existe ou nao tem permissao de escrita.\n"
    exit 1
fi

# verifica se o arquivo $1 eh um arquivo de configuracao de menus
if ! grep '</Menu>' "$1" 1>/dev/null; then
    echo -e "\nErro: arquivo \"$1\" nao parece ser um arquivo de configuracao de menus.\n"
    exit 2
fi

# criacao dos diretorios
mkdir -p $HOME/.local/share/desktop-directories
mkdir -p $HOME/.config/menus/applications-merged

# configuracao das entradas de menus
if ! grep "<DirectoryDir>$HOME/.local/share/desktop-directories</DirectoryDir>" "$1" 1>/dev/null; then
    sed '1! G ; h ; $! d' "$1" | sed "0,/<\/Menu>/ { /<\/Menu>/ a \
        <DirectoryDir>$HOME/.local/share/desktop-directories</DirectoryDir>
    ;
    }" | sed '1! G ; h ; $! d' > "$1.tmp"
    mv "$1.tmp" "$1"
fi
if ! grep "<MergeDir>$HOME/.config/menus/applications-merged</MergeDir>" "$1" 1>/dev/null; then
    sed '1! G ; h ; $! d' "$1" | sed "0,/<\/Menu>/ { /<\/Menu>/ a \
        <MergeDir>$HOME/.config/menus/applications-merged</MergeDir>
    ;
    }" | sed '1! G ; h ; $! d' > "$1.tmp"
    mv "$1.tmp" "$1"
fi

# criacao do arquivo Programas-RFB-IRPF2015.menu
cat >$HOME/.config/menus/applications-merged/Programas-RFB-IRPF2015.menu <<EOF
<Menu>
    <Name>Applications</Name>
    <Menu>
        <Directory>Programas-RFB.directory</Directory>
        <Name>Programas RFB</Name>
        <Menu>
            <Directory>IRPF2015.directory</Directory>
            <Name>IRPF 2015</Name>
            <Include>
                <Filename>IRPF2015v1.2.desktop</Filename>
                <Filename>IRPF2015v1.2-Uninstall.desktop</Filename>
            </Include>
        </Menu>
    </Menu>
</Menu>
EOF

# criacao do arquivo Programas-RFB.directory
cat >$HOME/.local/share/desktop-directories/Programas-RFB.directory <<EOF
#! /usr/bin/env xdg-open
[Desktop Entry]
Name=Programas RFB
Comment=
Icon=/home/joaomanoel/ProgramasRFB/IRPF2015/RFB.png
Type=Directory
Encoding=UTF-8
EOF
chmod a+x $HOME/.local/share/desktop-directories/Programas-RFB.directory

# criacao do arquivo IRPF2015.directory
cat >$HOME/.local/share/desktop-directories/IRPF2015.directory <<EOF
#! /usr/bin/env xdg-open
[Desktop Entry]
Name=IRPF 2015
Comment=
Icon=/home/joaomanoel/ProgramasRFB/IRPF2015/RFB.png
Type=Directory
Encoding=UTF-8
EOF
chmod a+x $HOME/.local/share/desktop-directories/IRPF2015.directory

# criacao do arquivo IRPF2015v1.2.desktop
cat >$HOME/.local/share/applications/IRPF2015v1.2.desktop <<EOF
#! /usr/bin/env xdg-open
[Desktop Entry]
Version=1.0
Encoding=UTF-8
Type=Application
Name=IRPF 2015 1.2
Comment=Declaração do IRPF 2015 1.2
Icon=/home/joaomanoel/ProgramasRFB/IRPF2015/RFB.png
Exec=java -jar /home/joaomanoel/ProgramasRFB/IRPF2015/irpf.jar
Terminal=false
EOF
chmod a+x $HOME/.local/share/applications/IRPF2015v1.2.desktop

# criacao do arquivo IRPF2015v1.2-Uninstall.desktop
cat >$HOME/.local/share/applications/IRPF2015v1.2-Uninstall.desktop <<EOF
#! /usr/bin/env xdg-open
[Desktop Entry]
Version=1.0
Encoding=UTF-8
Type=Application
Name=Desinstalar o IRPF 2015 1.2
Comment=Desinstalador do IRPF 2015 1.2
Icon=/home/joaomanoel/ProgramasRFB/IRPF2015/RFB.png
Exec=java -jar /home/joaomanoel/ProgramasRFB/IRPF2015/Uninstaller/uninstaller.jar
Terminal=false
EOF
chmod a+x $HOME/.local/share/applications/IRPF2015v1.2-Uninstall.desktop

exit 0
