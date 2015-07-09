#!/bin/bash

wget -c -r -np -nd -R 'index.html' \
    --accept-regex '^.*/firefox-.*\.pt-BR\.linux-x86_64\.(tar\.bz2|checksums|checksums\.asc)$' \
    'https://download-installer.cdn.mozilla.net/pub/firefox/nightly/latest-mozilla-aurora-l10n/'

gpg2 --verify firefox-*.pt-BR.linux-x86_64.checksums.asc firefox-*.pt-BR.linux-x86_64.checksums >/dev/null 2>&1
if [ "$?" != "0" ]; then
    echo -e "\nERRO: ARQUIVO BAIXADO DO FIREFOX DEVELOPER NAO PODE SER VERIFICADO!\n"
    exit 1
fi

grep firefox-*.pt-BR.linux-x86_64.tar.bz2 firefox-*.pt-BR.linux-x86_64.checksums | grep 'sha1' | sed 's/ sha1 [0-9]\+ /  /' | sha1sum -c >/dev/null 2>&1
if [ "$?" != "0" ]; then
    echo -e "\nERRO: ARQUIVO BAIXADO DO FIREFOX DEVELOPER ESTÁ CORROMPIDO!\n"
    exit 2
fi

echo -e "\nARQUIVO BAIXADO DO FIREFOX DEVELOPER ESTÁ OK!\n"
exit 0
