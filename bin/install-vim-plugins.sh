#!/bin/sh

# install pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -so ~/.vim/autoload/pathogen.vim https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim

# install plugins
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
git clone https://github.com/vim-scripts/mru.vim.git
git clone https://github.com/majutsushi/tagbar
git clone https://github.com/xolox/vim-easytags.git
git clone https://github.com/xolox/vim-misc.git
git clone https://github.com/scrooloose/syntastic.git
git clone https://github.com/Valloric/YouCompleteMe.git
git clone https://github.com/SirVer/ultisnips.git
git clone https://github.com/honza/vim-snippets.git
git clone --recursive https://github.com/davidhalter/jedi-vim.git
git clone https://github.com/tmhedberg/SimpylFold.git
git clone https://github.com/nvie/vim-pyunit.git
git clone https://github.com/mcrute/nose-machineout.git
git clone https://github.com/fholgado/minibufexpl.vim.git
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
git clone https://github.com/xolox/vim-session.git
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/jmcantrell/vim-virtualenv.git
git clone https://github.com/cwood/vim-django.git
git clone https://github.com/tpope/vim-surround.git
git clone https://github.com/tpope/vim-repeat.git
hg clone https://bitbucket.org/ns9tks/vim-l9
hg clone https://bitbucket.org/ns9tks/vim-fuzzyfinder

# configure plugins
cd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
#./install.py --clang-completer --system-libclang --system-boost --omnisharp-completer --gocode-completer --tern-completer
#cd ~/.vim/bundle/YouCompleteMe/third_party/ycmd/
#rm *.dll *.dll.a
#mkdir -pv cpp/build && cd cpp/
#patch -p2 < cygwin64.BoostParts.patch #fix boost for cygwin64. Might not be necessary in future YCM released
#cd build/
#/mingw64/bin/cmake -G"MSYS Makefiles" -DCMAKE_BUILD_TYPE=Release -DUSE_PYTHON2=ON -DPYTHON_LIBRARY=/mingw64/lib/libpython2.7.dll.a -DPYTHON_INCLUDE_DIR=/mingw64/include/python2.7 -Dgtest_disable_pthreads=ON -DUSE_SYSTEM_LIBCLANG=ON -DUSE_SYSTEM_BOOST=ON ..
#/mingw64/bin/mingw32-make.exe -j1 # replace with make -j <num-of-cores> for speed.
