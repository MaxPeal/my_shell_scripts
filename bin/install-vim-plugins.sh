#!/bin/sh


################################################################################
## Install Pathogen
################################################################################

mkdir -p ~/.vim/autoload ~/.vim/bundle ~/.vim/sessions ~/.vim/tags_dir
curl -so ~/.vim/autoload/pathogen.vim https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim


################################################################################
## Install Plugins
################################################################################

cd ~/.vim/bundle
git clone https://github.com/jmanoel7/vim-colors.git
git clone https://github.com/Lokaltog/vim-powerline.git
git clone https://github.com/kien/ctrlp.vim.git
git clone https://github.com/jmanoel7/vim-utils.git
git clone https://github.com/jmanoel7/vim-games.git
git clone https://github.com/jamessan/vim-gnupg.git
git clone https://github.com/tpope/vim-scriptease.git
git clone https://github.com/dhruvasagar/vim-table-mode.git
git clone https://github.com/vim-latex/vim-latex.git
git clone http://github.com/mattn/emmet-vim/
git clone https://github.com/vim-scripts/L9.git vim-l9
git clone https://github.com/vim-scripts/FuzzyFinder vim-fuzzyfinder
git clone https://github.com/vim-scripts/mru.vim.git
git clone https://github.com/majutsushi/tagbar
git clone https://github.com/xolox/vim-easytags.git
git clone https://github.com/xolox/vim-misc.git
git clone https://github.com/scrooloose/syntastic.git
git clone https://github.com/SirVer/ultisnips.git
git clone https://github.com/honza/vim-snippets.git
git clone --recursive https://github.com/davidhalter/jedi-vim.git
git clone https://github.com/tmhedberg/SimpylFold.git
git clone https://github.com/nvie/vim-pyunit.git
git clone https://github.com/mcrute/nose-machineout.git
git clone https://github.com/tpope/vim-fugitive.git
git clone git://github.com/tpope/vim-repeat.git
git clone git://github.com/tpope/vim-surround.git
git clone https://github.com/Raimondi/delimitMate.git
git clone https://github.com/vim-scripts/TaskList.vim.git
git clone https://github.com/xolox/vim-misc.git vim-misc-xolox
git clone https://github.com/xolox/vim-shell.git
git clone https://github.com/xolox/vim-notes.git
git clone https://github.com/vim-voom/vim-voom.github.com.git
git clone https://github.com/vim-scripts/utl.vim.git
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/jmcantrell/vim-virtualenv.git
git clone https://github.com/cwood/vim-django.git
git clone https://github.com/ervandew/supertab.git
git clone https://github.com/vim-scripts/OmniCppComplete.git
git clone https://github.com/vim-scripts/SQLComplete.vim.git
git clone https://github.com/Rip-Rip/clang_complete.git
git clone https://github.com/amiorin/vim-project.git
git clone https://github.com/xolox/vim-session.git
git clone https://github.com/artur-shaik/vim-javacomplete2.git
git clone https://github.com/mikelue/vim-maven-plugin.git
git clone https://github.com/vim-scripts/txt2tags-menu.git
curl -so- https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/conque/conque_2.3.tar.gz | tar xz && mv -f conque_2.3 Conque-Shell


################################################################################
## Configure Plugins
################################################################################

## jedi-vim
pip2 install -U jedi

## vim-pyunit
pip2 install -U nose vim_bridge mock
mkdir -p /tmp/vim-plugin-build
cd /tmp/vim-plugin-build
git clone https://github.com/mcrute/nose-machineout.git
cd nose-machineout
python2 ./setup.py install
cd ~
rm -rf /tmp/vim-plugin-build

## Vim-JDE
#chmod a+x ~/.vim/bundle/Vim-JDE/plugin/vjde/readtags

## YouCompleteMe
#cd ~/.vim/bundle/YouCompleteMe
#git submodule update --init --recursive
#./install.py --clang-completer --system-libclang --system-boost --omnisharp-completer --gocode-completer --tern-completer
#cd ~/.vim/bundle/YouCompleteMe/third_party/ycmd/
#rm *.dll *.dll.a
#mkdir -pv cpp/build && cd cpp/
#patch -p2 < cygwin64.BoostParts.patch #fix boost for cygwin64. Might not be necessary in future YCM released
#cd build/
#/mingw64/bin/cmake -G"MSYS Makefiles" -DCMAKE_BUILD_TYPE=Release -DUSE_PYTHON2=ON -DPYTHON_LIBRARY=/mingw64/lib/libpython2.7.dll.a -DPYTHON_INCLUDE_DIR=/mingw64/include/python2.7 -Dgtest_disable_pthreads=ON -DUSE_SYSTEM_LIBCLANG=ON -DUSE_SYSTEM_BOOST=ON ..
#/mingw64/bin/mingw32-make.exe -j1 # replace with make -j <num-of-cores> for speed.


exit 0
