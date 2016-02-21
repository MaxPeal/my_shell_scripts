#!/bin/sh

if [ -z "$1" -o -n "$2" ]
then
    echo "\a\nUso:\n\t$(basename "$0") <nome_do_tema>\n"
    exit 1
fi

# gsettings, dconf-editor, ...
gsettings set org.gnome.desktop.interface cursor-theme "$1"

# gconftool, gconf-editor, ...
gconftool -t string -s /desktop/gnome/peripherals/mouse/cursor_theme "$1"

# Xorg
[ -f ~/.Xresources ] && \
    sed "s/^[[:blank:]]*Xcursor[\*.]theme:[[:blank:]]*[^[:blank:]]\+$/Xcursor.theme: $1/" -i ~/.Xresources
[ -f ~/.Xdefaults ] && \
    sed "s/^[[:blank:]]*Xcursor[\*.]theme:[[:blank:]]*[^[:blank:]]\+$/Xcursor.theme: $1/" -i ~/.Xdefaults

# XFreeDesktop
cat <<EOF >~/.icons/default/index.theme
[Icon Theme]
Inherits=$1
EOF

exit 0
