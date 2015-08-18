#!/bin/bash

if [ -z "$1" -o "$1" = "-h" -o "$1" = "--help" ]
then
	echo -e "\n\tUso: `basename $0` <numero>\n\n\t<numero> eh o numero da imagem iso de dvd que varia de 1 a 8\n"
	exit -1
fi

if [ -n "$2" ]
then
	echo -e "\n\tUso: `basename $0` <numero>\n\n\t<numero> eh o numero da imagem iso de dvd que varia de 1 a 8\n"
	exit -1
fi

if [ "$1" != "1" -a "$1" != "2" -a "$1" != "3" -a "$1" != "4" -a "$1" != "5" -a "$1" != "6" -a "$1" != "7" -a "$1" != "8" ]
then
	echo -e "\n\tUso: `basename $0` <numero>\n\n\t<numero> eh o numero da imagem iso de dvd que varia de 1 a 8\n"
	exit -1
fi

echo -n "Montando /home/joaomanoel/linux/debian/6.0.5/amd64/iso-dvd/debian-6.0.5-amd64-DVD-${1}.iso em /media/cdrom ... "
sudo mount -o loop,ro -t iso9660 /home/joaomanoel/linux/debian/6.0.5/amd64/iso-dvd/debian-6.0.5-amd64-DVD-${1}.iso /media/cdrom
echo "OK"
echo -n "Pressione <ENTER> para desmontar a imagem iso ... "
read enter
echo -n "Desmontando a imagem iso ... "
sudo umount /media/cdrom
echo "OK"
