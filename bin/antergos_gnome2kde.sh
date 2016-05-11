#!/bin/bash

remove1="pacman -Rcns gnome --noconfirm"
remove2="pacman -Rcn gnome --noconfirm"

clean1="pacman -Scc --noconfirm"
clean2="pacman -Syy --noconfirm"

install_kde="pacman -S --noconfirm \
	antergos-kde-setup \
	kde-meta-kdebase \
	kde-meta-kdenetwork \
	cdrdao \
	digikam \
	dvd+rw-tools \
	emovix \
	grub2-editor \
	k3b \
	kde-gtk-config \
	kdeadmin-kuser \
	kdegraphics-okular \
	kdegraphics-thumbnailers \
	kdemultimedia-kmix \
	kdesdk-kate \
	kdeutils-kgpg \
	kdeutils-sweeper \
	kipi-plugins \
	kwebkitpart \
	kfaenza-icon-theme \
	oxygen-gtk2 \
	qt5-webkit \
	transmission-qt \
	ttf-bitstream-vera \
	ttf-dejavu \
	vlc \
	webkitgtk \
	xdg-user-dirs"

kde_config() {
	# Download Flattr Icon Set
	mkdir -p /usr/local/git
	cd  /usr/local/git/
	git clone https://github.com/NitruxSA/flattr-icons.git flattr-icons
	cd flattr-icons
	mkdir -p /usr/local/share/icons/
	cp -R 'Flattr Dark' 'Flattr' /usr/local/share/icons/
	sed -i 's|^Inherits=$|Inherits=KFaenza,Oxygen|g' /usr/local/share/icons/Flattr{,\ Dark}/index.theme

	# Get zip file from github, unzip it and copy all setup files in their right places.
	#cd  /tmp
	#wget -q "https://github.com/Antergos/kde-setup/archive/master.zip"
	#unzip -o -qq  /tmp/master.zip -d  /tmp
	#cp -R  /tmp/kde-setup-master/etc  /
	#cp -R  /tmp/kde-setup-master/usr  /

	# Set Root Environment
	cp -R /etc/skel/.config /root
}

kde_config_user() {
	# Set KDE in .dmrc
	echo "[Desktop]" > /home/${1}/.dmrc
	echo "Session=kde-plasma" >> /home/${1}/.dmrc
	chown ${1}:users /home/${1}/.dmrc

	# Set User Environment
	cp -R  /etc/skel/.kde4 /home/${1}

	## Set defaults directories
	su -c xdg-user-dirs-update ${1}

	# Fix Permissions
	chown -R ${1}:users /home/${1}
}

echo -e "\nRemove GNOME ...\n"

${remove1} || ${remove2}

echo -e "\nClear PKG Cache ...\n"

${clean1} && ${clean2}

echo -e "\nInstall KDE...\n"

${install_kde}

echo -e "\nConfiguring KDE ...\n"

kde_config

IFS=$'\n'
for i in $(cat /etc/passwd | egrep '\/home\/.+:\/bin\/.*sh$' | sed 's,^.*/home/\(.\+\):/.\+$,\1,'); do
	if [ -d "/home/${i}" ]; then
		echo -e "\nConfiguring KDE for user ${i} ...\n"
		kde_config_user "${i}"
	fi
done

#echo -e "\nSwitch to LightDM ...\n"
#systemctl disable gdm && systemctl enable lightdm

echo -e '\nDone.\n'

exit 0
