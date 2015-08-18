#!/bin/bash

[ ! -d /tmp/cd ] && mkdir /tmp/cd

for (( i=21; i<=31; i++ )); do
	sudo mount -o loop \
		$HOME/linux/debian/5.0.3/amd64/cd/debian-503-amd64-CD-$i.iso \
		/tmp/cd
	echo -ne "\tcopiando CD $i ..."
	sudo cp -rfd /tmp/cd/* $HOME/linux/debian/5.0.3/amd64/debian/
	echo " pronto"
	sudo umount /tmp/cd
done

echo -ne "\talterando o dono e o grupo dos arquivos para joaomanoel ..."
sudo chown -R joaomanoel\: $HOME/linux/debian/5.0.3/amd64/debian/
echo " pronto"

echo -ne "\tdando permissao de escrita para joaomanoel nos arquivos ..."
chmod -R u+w $HOME/linux/debian/5.0.3/amd64/debian/
echo " pronto"


