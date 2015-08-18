#!/bin/bash

if [ ! -f "$1" -o -z "$2" ]; then
	echo "usage: `basename $0` <file> <url>"
	exit -1
fi

echo '#!/bin/bash' > ./wget-files.sh
IFS=$'\n'
for i in `cat $1`; do
	echo "wget -c \"${2}`echo "$i" | \
		sed -e 's/\[TXT\]/\[ \]/g' - | \
		awk -F '[ ]' '{print $2}' | \
		cut -d ']' -f 2 | \
		awk -F '..-...-....' '{print $1}' | \
		sed -e 's/^[[:blank:]]*//' - | \
		sed -e 's/[[:blank:]]*$//' -`\"" >> ./wget-files.sh
done
chmod +x ./wget-files.sh
