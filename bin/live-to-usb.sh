#!/bin/bash
case "$1" in
	"-i")
		sudo umount "$5" 2>/dev/null; sleep 2;
		sudo livecd-iso-to-disk --reset-mbr --overlay-size-mb "$3" --label 'FEDORA' --unencrypted-home --home-size-mb "$4" "$2" "$5"
		;;
	"-l")
		sudo /run/initramfs/live/LiveOS/livecd-iso-to-disk --reset-mbr --overlay-size-mb "$2" --unencrypted-home --home-size-mb "$3" /run/initramfs/livedev "$4"
		;;
	*)
		echo -e "\nUso:\n\t`basename $0` -i isofile overlay_mb home_mb device\n"
		echo -e "\nOu:\n\t`basename $0` -l overlay_mb home_mb device\n"
		exit 1
esac
exit 0
