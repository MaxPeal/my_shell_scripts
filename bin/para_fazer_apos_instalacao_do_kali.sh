#/bin/bash
sudo sed -e 's/Exec=sh -c service/Exec=sh -c sudo service/' -i /usr/share/applications/kali-*.desktop
