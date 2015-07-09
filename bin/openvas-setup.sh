#!/bin/bash
test -e /var/lib/openvas/CA/cacert.pem  || openvas-mkcert -q
if (openssl verify -CAfile /var/lib/openvas/CA/cacert.pem \
    /var/lib/openvas/CA/servercert.pem |grep -q ^error); then
    openvas-mkcert -q -f
fi
openvas-nvt-sync
openvas-scapdata-sync
openvas-certdata-sync
if ! test -e /var/lib/openvas/CA/clientcert.pem || \
    ! test -e /var/lib/openvas/private/CA/clientkey.pem; then
    openvas-mkcert-client -n -i
fi
if (openssl verify -CAfile /var/lib/openvas/CA/cacert.pem \
    /var/lib/openvas/CA/clientcert.pem |grep -q ^error); then
    openvas-mkcert-client -n -i
fi

service openvas-manager stop 
service openvas-scanner stop 
openvassd
openvasmd --migrate
openvasmd --rebuild
killall openvassd
sleep 15
service openvas-scanner start
service openvas-manager start
service greenbone-security-assistant restart
if ! openvasmd --get-users | grep -q ^admin$ ; then
    openvasmd --create-user=admin
fi
