#!/bin/bash

if [ "$1" = "debian" ]; then
	sudo apt-get clean && \
	sudo apt-get update && \
	sudo apt-get --yes dist-upgrade
elif [ "$1" = "fedora" ]; then
	sudo yum clean all && \
	sudo yum makecache && \
	sudo yum check && \
	sudo yum --assumeyes upgrade
	#sudo yum --assumeyes update
	#sudo yum --assumeyes update-minimal
else
	echo -en "\aUso:\n\t`basename $0` <debian | fedora>\n"
fi
