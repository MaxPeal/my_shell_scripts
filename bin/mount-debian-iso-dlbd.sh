#!/bin/bash

if [ -z "$1" -o "$1" = "-h" -o "$1" = "--help" ]
then
	echo -e "\n\tUso: `basename $0` <numero>\n\n\t<numero> eh o numero da imagem iso de bluray dupla camada que no caso deve ser 1\n"
	exit -1
fi

if [ -n "$2" ]
then
	echo -e "\n\tUso: `basename $0` <numero>\n\n\t<numero> eh o numero da imagem iso de bluray dupla camada que no caso deve ser 1\n"
	exit -1
fi

if [ "$1" != "1" ]
then
	echo -e "\n\tUso: `basename $0` <numero>\n\n\t<numero> eh o numero da imagem iso de bluray dupla camada que no caso deve ser 1\n"
	exit -1
fi

echo -n "Montando /opt/debian/debian-6.0.5-amd64-DLBD-${1}.iso em /media/cdrom ... "
sudo mount -o loop,ro -t iso9660 /opt/debian/debian-6.0.5-amd64-DLBD-${1}.iso /media/cdrom
echo "OK"
echo -n "Pressione <ENTER> para desmontar a imagem iso ... "
read enter
echo -n "Desmontando a imagem iso ... "
sudo umount /media/cdrom
echo "OK"
