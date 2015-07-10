#!/bin/bash
sudo update-alternatives --remove x-mail-reader /usr/bin/icedove
sudo update-alternatives \
    --install /usr/bin/x-mail-reader x-mail-reader /usr/bin/icedove 100 \
    --slave /usr/share/man/man1/x-mail-reader.1.gz x-mail-reader.1.gz /usr/share/man/man1/icedove.1.gz
sudo update-alternatives --set x-mail-reader /usr/bin/icedove
exit 0
