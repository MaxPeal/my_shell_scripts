#!/bin/bash

export FEDORA_DISTRO_DIR=$HOME/dev/fedora/fedora-chroot

function deinit_fedora_chroot ()
{
	cd $FEDORA_DISTRO_DIR

	sudo umount proc    >/dev/null 2>&1
	sudo umount sys     >/dev/null 2>&1
	sudo umount dev/shm >/dev/null 2>&1
	sudo umount dev/pts >/dev/null 2>&1
	sudo umount dev     >/dev/null 2>&1
	sudo umount tmp     >/dev/null 2>&1

	sudo rm -f $FEDORA_DISTRO_DIR/etc/hosts
	sudo rm -f $FEDORA_DISTRO_DIR/etc/resolv.conf
	sudo rm -f $FEDORA_DISTRO_DIR/etc/mtab
}

function init_fedora_chroot ()
{
	cd $FEDORA_DISTRO_DIR

	sudo mount --bind /proc    proc
	sudo mount --bind /sys     sys
	sudo mount --bind /dev     dev
	sudo mount --bind /dev/shm dev/shm
	sudo mount --bind /dev/pts dev/pts
	sudo mount --bind /tmp     tmp # to use X-Windows

	sudo cp -f /etc/hosts       $FEDORA_DISTRO_DIR/etc/
	sudo cp -f /etc/resolv.conf $FEDORA_DISTRO_DIR/etc/
	cat /etc/mtab | head -n 5 | tail -n 4 | sudo tee    $FEDORA_DISTRO_DIR/etc/mtab >/dev/null
	cat /etc/mtab | tail -n 3 | head -n 1 | sudo tee -a $FEDORA_DISTRO_DIR/etc/mtab >/dev/null

	xhost +local:`hostname`
}

function show_tips ()
{
	echo -e "\a\nTIPS:\n"
	echo -e "1) edit files and config baseurl:"
	echo -e "	/etc/yum.repos.d/fedora.repo"
	echo -e "	/etc/yum.repos.d/fedora-updates.repo"
	echo -e "	/etc/yum.repos.d/fedora-updates-testing.repo\n"
	echo -e "2) execute and re-execute:"
	echo -e "	rm -rf /var/cache/yum/x86_64/\$releasever"
	echo -e "	rm -f  /var/lib/rpm/*"
	echo -e "	rpm --initdb"
	echo -e "	yum --releasever=19 install fedora-release\n"
	echo -e "ENJOY HACKER !!!\n"
}

deinit_fedora_chroot
init_fedora_chroot
show_tips
sudo chroot $FEDORA_DISTRO_DIR /bin/bash --login
deinit_fedora_chroot
