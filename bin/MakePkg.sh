#!/bin/bash

[ ! -f "$1" ] && exit 1

. $HOME/.bash_aliases

for (( i=1; i>0; i++ )); do
   ext="`echo -n "$1" | cut -f 1-$i -d '.' --complement`"
   [ -z "$ext" ] && exit 1
   case "$ext" in
	"txz"|"tar.xz")
	    tar_par="xvvf"
	    ;;
	"tgz"|"tar.gz")
	    tar_par="xzvf"
	    ;;
	"tbz"|"tar.bz2")
	    tar_par="xjvf"
	    ;;
	*)
	    continue
	    ;;
   esac
	break
done

tar "$tar_par" "$1" || exit 1

save_path="$PWD" || exit 1

ext=".${ext}" || exit 1

pkg_dir="`basename "$1" "$ext"`" || exit 1

cd $pkg_dir || exit 1

CPL || exit 1

mk || exit 1

s mkdir -p /tmp/jmanoel/MYPKG || exit 1

s make DESTDIR=/tmp/jmanoel/MYPKG install || exit 1

s cd /tmp/jmanoel/MYPKG || exit 1

s /sbin/makepkg -l y -c y $save_path/$pkg_dir.txz || exit 1

cd $save_path || exit 1

s /sbin/installpkg $pkg_dir.txz || exit 1

s chown jmanoel\: $pkg_dir.txz || exit 1

#s rm -rf $pkg_dir || exit 1

mv $pkg_dir.txz $HOME/linux/slackware/pacotes/TXZs/ || exit 1


