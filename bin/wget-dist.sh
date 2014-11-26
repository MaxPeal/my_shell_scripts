#!/bin/bash

pwd_orig="`pwd`"
ftp="ftp://br.archive.ubuntu.com/ubuntu/dists"

if [ -n "$1" ]; then
	mkdir -p $1
	cd $1
fi

if [ -n "$2" ]; then
	dist="$2"
else
	dist="maverick"
fi

if [ -n "$3" ]; then
	arch="$3"
else
	arch="amd64"
fi

for i in $dist{,-backports,-proposed,-security,-updates}; do

	mkdir -p $i
	cd $i

	for f in Contents-$arch.gz Release Release.gpg; do
		if [ "$4" == "-t" ]; then
			touch $f
		else
			wget -c $ftp/$i/$f
		fi
	done

	for ii in main multiverse restricted universe; do

		mkdir -p $ii
		cd $ii

		mkdir -p binary-$arch
		cd binary-$arch
		for f in Packages.gz Release; do
			if [ "$4" == "-t" ]; then
				touch $f
			else
				wget -c $ftp/$i/$ii/binary-$arch/$f
			fi
		done
		cd ..

		mkdir -p source
		cd source
		for f in Sources.gz Release; do
			if [ "$4" == "-t" ]; then
				touch $f
			else
				wget -c $ftp/$i/$ii/source/$f
			fi
		done
		cd ..

		if [ "$i" == "$dist" -o "$i" == "$dist-proposed" ]; then

			mkdir -p i18n
			cd i18n
			for f in Translation-pt_BR.gz Translation-pt.gz; do
				if [ "$4" == "-t" ]; then
					touch $f
				else
					wget -c $ftp/$i/$ii/i18n/$f
				fi
			done
			cd ..

		fi

		cd ..

	done

	cd ..

done

cd $pwd_orig


