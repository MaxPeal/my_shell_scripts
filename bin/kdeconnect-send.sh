#!/bin/sh

for i in $@; do

	if [ ! -f "$i" -a ! -d "$i" ]; then
		continue
	fi

	echo -e "\nEnviando \"$i\" para SmartPhone ...\n"
	kdeconnect-send "$i"

done

exit 0
