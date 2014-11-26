#!/bin/bash

for i in \
    sugar-artwork-0.100.0 \
    sugar-datastore-0.100.1 \
    sugar-toolkit-gtk3-0.100.0 \
    sugar-runner-0.100.1 \
    sugar-0.100.2
do
    rm -rf $i
    tar xJf $i.tar.xz || exit 1
    cd $i
    ./configure CONFIG_SHELL=/bin/bash --prefix=/usr || exit 2
    make clean >/dev/null 2>&1
    sudo make uninstall >/dev/null 2>&1
    make || exit 3
    sudo make install || exit 4
    cd ..
done

exit 0