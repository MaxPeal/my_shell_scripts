#!/bin/bash

for i in /usr/share/applications/kali-*.desktop; do
    if egrep '^[[:blank:]]*Terminal[[:blank:]]*=[[:blank:]]*true[[:blank:]]*$' $i 1>/dev/null; then
        sudo sed "s/^Exec=\(.*\)$/Exec=mate-terminal -e \'\1\'/" -i $i
        sudo sed "s/^[[:blank:]]*Terminal[[:blank:]]*=[[:blank:]]*true[[:blank:]]*$/Terminal=false/" -i $i
    fi
    if egrep "'sh -c \"" $i 1>/dev/null; then
        sudo sed "s/'sh -c \"/'su -c \"/" -i $i
    fi
done

exit 0
