#!/bin/sh

for i in /usr/share/xsessions/*.desktop; do
    if egrep -q '^[[:blank:]]*Exec[[:blank:]]*=[[:blank:]]*default[[:blank:]]*$' "$i"; then
        continue
    fi
    sudo sed 's,^[[:blank:]]*Exec[[:blank:]]*=[[:blank:]]*\(.*\)[[:blank:]]*$,Exec=/usr/local/bin/\1\.sh,' -i "$i"
done

exit 0
