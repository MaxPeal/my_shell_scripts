#!/bin/bash
sudo systemctl start docker
echo -e "nameserver 8.8.8.8\nnameserver 8.8.4.4" | sudo tee /etc/resolv.conf
exit 0
