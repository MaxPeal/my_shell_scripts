#!/bin/bash

if [ -z "$2" ]; then
	echo -e "\a\tUsage: `basename $0` ext1 ext2"
	exit 1
fi

IFS=$'\n'

for i in `find . -type f -regex "^.*\.$1\.$2"`; do

	cd "`dirname "$i"`"
	newfile="`basename "$i" ".$1.$2"`.$2"
	oldfile="`basename "$i"`"
	mv -i "$oldfile" "$newfile"
	cd ..

done

exit 0
