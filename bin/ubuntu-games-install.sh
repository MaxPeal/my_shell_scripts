#!/bin/bash
wget -q -O - 'http://archive.ubuntugames.org/ubuntugames.key' | sudo apt-key add -
echo "deb http://archive.ubuntugames.org ubuntugames main" | sudo tee /etc/apt/sources.list.d/ubuntugames.list
echo "deb-src http://archive.ubuntugames.org ubuntugames main" | sudo tee -a /etc/apt/sources.list.d/ubuntugames.list
sudo apt-get update
exit 0
