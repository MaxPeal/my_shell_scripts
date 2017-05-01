#!/bin/sh -e
cd ~
rm -f .emacs.d .emacs
ln -s Projetos/my_dot_files/.emacs__LINUX__ .emacs
ln -s .emacs.d__EMACS__ .emacs.d
exec /usr/bin/emacs25-lucid $@
