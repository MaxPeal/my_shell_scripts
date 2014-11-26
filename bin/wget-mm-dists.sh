#!/bin/bash

[ -z "$1" ] && echo -e "\t\a$0 <diretorio>" && exit -1

SAVE="$PWD"
mkdir -p $1/debian-multimedia/dists
cd $1/debian-multimedia/dists

ftp="ftp://debian.las.ic.unicamp.br/debian-multimedia/dists"

for i in sid squeeze; do
	mkdir -p $i
	cd $i
	wget -r -T 10 -c -nd -nH -np -A "Release*","Contents-i386*" ${ftp}/${i}
	for ii in main non-free; do
		mkdir -p $ii
		cd $ii

		# binary-i386
		mkdir -p binary-i386
		cd binary-i386
		wget -T 10 -c -r -np -nd -nH ${ftp}/${i}/${ii}/binary-i386
		cd ..

                # source
                mkdir -p source
                cd source
                wget -T 10 -c -r -np -nd -nH ${ftp}/${i}/${ii}/source
		cd ..

		cd .. # cd $ii
	done;

	cd .. # cd $i
done;

cd $SAVE

