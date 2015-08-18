#!/bin/bash

echo ""

# stop redis-server.service
echo -e "Stop redis-server.service ...\n"
sudo systemctl stop redis-server.service
sudo rm -f /tmp/redis.sock

# stop openvas-scanner.service
echo -e "Stop openvas-scanner.service ...\n"
sudo killall -9 openvassd >/dev/null 2>&1

# stop openvas-manager.service
echo -e "Stop openvas-manager.service ...\n"
sudo killall -9 openvasmd >/dev/null 2>&1

# stop greenbone-security-assistant.service
echo -e "Stop greenbone-security-assistant.service ...\n"
sudo killall -9 gsad >/dev/null 2>&1

exit 0
