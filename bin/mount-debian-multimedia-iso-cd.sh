#!/bin/bash

if [ -z "$1" -o "$1" = "-h" -o "$1" = "--help" ]
then
	echo -e "\n\tUso: `basename $0` <numero>\n\n\t<numero> eh o numero da imagem iso de dvd que varia de 1 a 3\n"
	exit -1
fi

if [ -n "$2" ]
then
	echo -e "\n\tUso: `basename $0` <numero>\n\n\t<numero> eh o numero da imagem iso de dvd que varia de 1 a 3\n"
	exit -1
fi

if [ "$1" != "1" -a "$1" != "2" -a "$1" != "3" ]
then
	echo -e "\n\tUso: `basename $0` <numero>\n\n\t<numero> eh o numero da imagem iso de dvd que varia de 1 a 3\n"
	exit -1
fi

echo -n "Montando /home/joaomanoel/linux/debian/multimedia/dmo-squeeze-main-amd64-CD-1.iso em /media/cdrom ... "

if [ "$1" = "1" ]
then
	sudo mount -o loop,ro -t iso9660 /home/joaomanoel/linux/debian/multimedia/dmo-squeeze-main-amd64-CD-1.iso /media/cdrom
elif [ "$1" = "2" ]
then
	sudo mount -o loop,ro -t iso9660 /home/joaomanoel/linux/debian/multimedia/dmo-squeeze-non-free-amd64-CD-1.iso /media/cdrom

else
	sudo mount -o loop,ro -t iso9660 /home/joaomanoel/linux/debian/multimedia/dmo-squeeze-main-source-CD-1.iso /media/cdrom
fi

echo "OK"
echo -n "Pressione <ENTER> para desmontar a imagem iso ... "
read enter
echo -n "Desmontando a imagem iso ... "
sudo umount /media/cdrom
echo "OK"
