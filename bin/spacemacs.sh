#!/bin/sh -e
cd ~
rm -f .emacs.d .emacs
ln -s .emacs.d__SPACEMACS__ .emacs.d
exec /usr/bin/emacs25-lucid $@
