#!/bin/bash

# install pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# install plugins
cd ~/.vim/bundle
git clone https://github.com/tpope/vim-scriptease.git
git clone https://github.com/majutsushi/tagbar.git
hg clone https://bitbucket.org/ns9tks/vim-l9
hg clone https://bitbucket.org/ns9tks/vim-fuzzyfinder
git clone https://github.com/vim-scripts/mru.vim.git
git clone https://github.com/fholgado/minibufexpl.vim.git
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/jistr/vim-nerdtree-tabs.git
git clone https://github.com/sjl/gundo.vim.git
git clone https://github.com/cschlueter/vim-mustang.git
git clone https://github.com/godlygeek/csapprox.git
git clone https://github.com/jmanoel7/vim-colors.git
git clone https://github.com/jmanoel7/vim-utils.git
git clone https://github.com/vim-scripts/TaskList.vim.git
git clone https://github.com/edsono/vim-matchit.git
git clone https://github.com/Raimondi/delimitMate.git
git clone https://github.com/jmanoel7/vim-games.git
git clone https://github.com/vim-scripts/tComment.git
git clone https://github.com/mattn/emmet-vim.git
git clone https://github.com/sukima/xmledit.git
git clone https://github.com/rstacruz/sparkup.git
git clone https://github.com/honza/vim-snippets.git
git clone https://github.com/SirVer/ultisnips.git
git clone https://github.com/tpope/vim-surround.git
git clone https://github.com/Valloric/YouCompleteMe.git
#git clone https://github.com/rkulla/pydiction.git
#git clone https://github.com/davidhalter/jedi-vim.git
#git clone https://github.com/ervandew/supertab.git
git clone https://github.com/xolox/vim-easytags.git
git clone https://github.com/xolox/vim-misc.git
git clone https://github.com/xolox/vim-shell.git
git clone https://github.com/xolox/vim-notes.git
git clone https://github.com/xolox/vim-session.git
git clone https://github.com/scrooloose/syntastic.git
git clone https://github.com/kevinw/pyflakes-vim.git
git clone https://github.com/vim-scripts/pep8.git
git clone https://github.com/tpope/vim-fugitive.git
git clone https://github.com/cosminadrianpopescu/vim-sql-workbench.git
git clone https://github.com/tmhedberg/SimpylFold.git
git clone https://github.com/hynek/vim-python-pep8-indent.git
git clone https://github.com/jmcantrell/vim-virtualenv.git
git clone https://github.com/cwood/vim-django.git
git clone https://github.com/jmcomets/vim-pony.git
git clone https://github.com/jamessan/vim-gnupg.git
git clone https://github.com/jmanoel7/conque.git
git clone https://github.com/tpope/vim-rails.git
git clone https://github.com/tpope/vim-rake.git
git clone https://github.com/tpope/vim-projectionist.git
git clone https://github.com/tpope/vim-bundler.git
git clone https://github.com/tpope/vim-abolish.git
git clone https://github.com/tpope/vim-repeat.git

exit 0
