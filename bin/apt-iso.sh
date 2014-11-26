#!/bin/bash
[ ! -d "$1" ] && exit -1
sudo apt-cdrom	-d="$1" -m \
		-o APT::CDROM::NoMount="true" \
		-o Acquire::/cdrom/::Mount="$1" \
		-o Dir::Media::MountPath="$1" \
		add
