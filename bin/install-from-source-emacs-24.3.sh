sudo apt-get build-dep emacs23
gpg --verify emacs-24.3.tar.xz.sig emacs-24.3.tar.xz || exit 1
tar xJvf emacs-24.3.tar.xz
cd emacs-24.3
./configure --prefix=/usr --program-suffix=.mycp
make -j4 || make || exit 1
sudo make install || exit 1
sudo update-alternatives --install /usr/bin/emacs emacs /usr/bin/emacs.mycp 243
sudo update-alternatives --install /usr/bin/emacsclient emacsclient /usr/bin/emacsclient.mycp 243
sudo update-icon-caches /usr/share/icons/hicolor/
