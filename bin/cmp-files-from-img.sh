#!/bin/bash
if [ -z "$2" -o -n "$3" ]; then
	exit 0
fi
if [ ! -f "$1" ] || [ ! -r "$1" ]; then
	exit 0
fi
if [ ! -f "$2" ] || [ ! -r "$2" ]; then
	exit 0
fi
sudo mkdir /mnt/img.0
sudo mkdir /mnt/img.1
sudo mount -o loop "$1" /mnt/img.0
sudo mount -o loop "$2" /mnt/img.1
for i in `find /mnt/img.0/ -type f`; do
	arquivo=`echo "$i" | awk -F '/mnt/img.0/' '{print $2}'`
	echo -e -n "\nCOMPARANDO: \"$arquivo\" ... "
	resultado=`cmp "/mnt/img.0/$arquivo" "/mnt/img.1/$arquivo"`
	if [ -z "$resultado" ]; then
		echo -e "OK\n"
	else
		echo -e "NOT OK\n"
	fi
done
sudo umount /mnt/img.0
sudo umount /mnt/img.1
sudo rmdir /mnt/img.0
sudo rmdir /mnt/img.1
