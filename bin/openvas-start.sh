#!/bin/bash

echo ""

# start redis-server.service
echo -e "Start redis-server.service ...\n"
sudo systemctl start redis-server.service
sudo rm -f /tmp/redis.sock
sudo ln -f -s /var/lib/redis/redis.sock /tmp/redis.sock

# start openvas-scanner.service
echo -e "Start openvas-scanner.service ...\n"
[ -r /etc/default/openvas-scanner ] && . /etc/default/openvas-scanner
[ "$SCANNER_ADDRESS" ] && DAEMONOPTS="--listen=$SCANNER_ADDRESS"
[ "$SCANNER_PORT" ]    && DAEMONOPTS="$DAEMONOPTS --port=$SCANNER_PORT"
sudo /usr/local/sbin/openvassd $DAEMONOPTS
sleep 300

# start openvas-manager.service
echo -e "Start openvas-manager.service ...\n"
[ -r /etc/default/openvas-manager ] && . /etc/default/openvas-manager
[ "$DATABASE_FILE" ]   && DAEMONOPTS="--database=$DATABASE_FILE"
[ "$MANAGER_ADDRESS" ] && DAEMONOPTS="$DAEMONOPTS --listen=$MANAGER_ADDRESS"
[ "$MANAGER_PORT" ]    && DAEMONOPTS="$DAEMONOPTS --port=$MANAGER_PORT"
sudo /usr/local/sbin/openvasmd $DAEMONOPTS

# start greenbone-security-assistant.service
echo -e "Start greenbone-security-assistant.service ...\n"
[ -r /etc/default/greenbone-security-assistant ] && . /etc/default/greenbone-security-assistant
[ "$GSA_ADDRESS" ] && DAEMONOPTS="--listen=$GSA_ADDRESS"
[ "$GSA_PORT" ] && DAEMONOPTS="$DAEMONOPTS --port=$GSA_PORT"
[ "$GSA_SSL_PRIVATE_KEY" ] && DAEMONOPTS="$DAEMONOPTS --ssl-private-key=$GSA_SSL_PRIVATE_KEY"
[ "$GSA_SSL_CERTIFICATE" ] && DAEMONOPTS="$DAEMONOPTS --ssl-certificate=$GSA_SSL_CERTIFICATE"
[ "$GSA_REDIRECT" ] && [ "$GSA_REDIRECT" == 1 ] && DAEMONOPTS="$DAEMONOPTS --redirect"
[ "$GSA_REDIRECT_PORT" ] && DAEMONOPTS="$DAEMONOPTS --rport=$GSA_REDIRECT_PORT"
[ "$MANAGER_ADDRESS" ] && DAEMONOPTS="$DAEMONOPTS --mlisten=$MANAGER_ADDRESS"
[ "$MANAGER_PORT" ] && DAEMONOPTS="$DAEMONOPTS --mport=$MANAGER_PORT"
sudo /usr/local/sbin/gsad $DAEMONOPTS

exit 0
