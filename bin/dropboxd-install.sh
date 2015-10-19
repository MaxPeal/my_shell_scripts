#!/bin/sh

maq=$(uname -m)

if [ "$maq" = "i686" -o "$maq" = "i586" -o "$maq" = "i486" -o "$maq" = "i386" ]; then
    cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86" | tar xzf -
elif [ "$maq" = "x86_64" ]; then
    cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
else
    echo -e "\n\a\tSorry, but dropbox not available for you machine.\n"
fi

exit 0
