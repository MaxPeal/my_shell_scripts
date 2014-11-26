#!/bin/bash

[ -n "$1" ] && ver="$1"
[ -z "$ver" ] && ver="23"
[ "$ver" != "23" -a "$ver" != "24" ] && ver="23"

[ -z "$name0" ] && name0="emacs${ver}"
[ -z "$name1" ] && name1="emacs.emacs${ver}.1.gz"
[ -z "$name2" ] && name2="emacs${ver}.png"
[ -z "$name3" ] && name3="emacs${ver}.png"
[ -z "$name4" ] && name4="emacs${ver}.png"
[ -z "$name5" ] && name5="emacs${ver}.png"
[ -z "$name6" ] && name6="emacs${ver}.png"
[ -z "$name7" ] && name7="emacs${ver}-document.svg"
[ -z "$name8" ] && name8="emacs${ver}.svg"


sudo update-alternatives \
    --install /usr/bin/emacs emacs /usr/bin/$name0 ${ver}0 \
    --slave /usr/share/man/man1/emacs.1.gz emacs.1.gz /usr/share/man/man1/$name1 \
    --slave /usr/share/icons/hicolor/128x128/apps/emacs-128x128.png emacs-128x128.png /usr/share/icons/hicolor/128x128/apps/$name2 \
    --slave /usr/share/icons/hicolor/16x16/apps/emacs-16x16.png emacs-16x16.png /usr/share/icons/hicolor/16x16/apps/$name3 \
    --slave /usr/share/icons/hicolor/24x24/apps/emacs-24x24.png emacs-24x24.png /usr/share/icons/hicolor/24x24/apps/$name4 \
    --slave /usr/share/icons/hicolor/32x32/apps/emacs-32x32.png emacs-32x32.png /usr/share/icons/hicolor/32x32/apps/$name5 \
    --slave /usr/share/icons/hicolor/48x48/apps/emacs-48x48.png emacs-48x48.png /usr/share/icons/hicolor/48x48/apps/$name6 \
    --slave /usr/share/icons/hicolor/scalable/mimetypes/emacs-document.svg emacs-document.svg /usr/share/icons/hicolor/scalable/mimetypes/$name7 \
    --slave /usr/share/icons/hicolor/scalable/apps/emacs.svg emacs.svg /usr/share/icons/hicolor/scalable/apps/$name8
