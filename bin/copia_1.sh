#!/bin/bash

[ ! -d /tmp/iso-cd ] && mkdir /tmp/iso-cd

for (( i=1; i<=6; i++ )); do
	sudo mount -o loop \
		$HOME/linux/debian/5.0.4/amd64/iso-cd/debian-update-5.0.4-amd64-CD-$i.iso \
		/tmp/iso-cd
	echo -ne "\tcopiando CD $i ..."
	sudo cp -rfd /tmp/iso-cd/* $HOME/linux/debian/5.0.4/amd64/debian/
	echo " pronto"
	sudo umount /tmp/iso-cd
done

echo -ne "\talterando o dono e o grupo dos arquivos para joaomanoel ..."
sudo chown -R joaomanoel\: $HOME/linux/debian/5.0.4/amd64/debian/
echo " pronto"

echo -ne "\tdando permissao de escrita para joaomanoel nos arquivos ..."
chmod -R u+w $HOME/linux/debian/5.0.4/amd64/debian/
echo " pronto"


