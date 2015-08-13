#!/bin/sh
sed '1! G ; h ; $! d' ~/.config/menus/mate-applications.menu | sed "0,/<\/Menu>/ { /<\/Menu>/ a \
    <DirectoryDir>$HOME/.local/share/desktop-directories</DirectoryDir>
;
}" | sed '1! G ; h ; $! d' > ~/.config/menus/mate-applications.menu.tmp
sed '1! G ; h ; $! d' ~/.config/menus/mate-applications.menu.tmp | sed "0,/<\/Menu>/ { /<\/Menu>/ a \
    <MergeDir>$HOME/.config/menus/applications-merged</MergeDir>
;
}" | sed '1! G ; h ; $! d' > ~/.config/menus/mate-applications.menu
rm -f ~/.config/menus/mate-applications.menu.tmp
exit 0
