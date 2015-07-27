#!/bin/sh

for i in /usr/share/xsessions/*.desktop; do
    if egrep -q '^Exec=default$' "$i"; then
        continue
    fi
    sudo sed 's,^Exec=\(.*\)$,Exec=/usr/local/bin/start-xinitrc \1,' -i "$i"
done

exit 0
