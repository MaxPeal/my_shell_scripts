#!/bin/bash

remove1="pacman -Rcns mate --noconfirm"
remove2="pacman -Rcn mate --noconfirm"

clean1="pacman -Scc --noconfirm"
clean2="pacman -Syy --noconfirm"

#install_cinnamon="pacman -S antergos-gnome-defaults-list cdrkit cinnamon cinnamon-session cinnamon-control-center cinnamon-desktop cinnamon-settings-daemon cinnamon-menus cinnamon-screensaver cinnamon-theme-nadia cjs empathy eog evince faenza-icon-theme file-roller gedit gnome-calculator gnome-disk-utility gnome-keyring gnome-screenshot gnome-system-monitor gnome-terminal gnome-themes-standard gst-libav gst-plugins-bad gst-plugins-base gst-plugins-good gst-plugins-ugly gst-vaapi gstreamer0.10-plugins gstreamer0.10-vaapi gvfs-mtp gvfs-smb hicolor-icon-theme libgnomeui muffin nemo network-manager-applet networkmanager-openvpn networkmanager-pptp telepathy totem transmission-gtk xdg-user-dirs-gtk xfburn xnoise zukitwo-themes lightdm lightdm-webkit-greeter lightdm-webkit-theme-antergos --noconfirm"
install_kde="pacman -S kde-meta-kdebase kde-meta-kdenetwork kdeplasma-applets-plasma-nm apper cdrdao digikam dvd+rw-tools emovix grub2-editor k3b kde-gtk-config kde-meta-kdeartwork kde-telepathy-meta kdeadmin-kuser kdegraphics-gwenview kdegraphics-ksnapshot kdegraphics-okular kdegraphics-thumbnailers kdemultimedia-ffmpegthumbs kdemultimedia-kmix kdepim-kmail kdepim-kontact kdeplasma-addons-applets-lancelot kdeplasma-addons-applets-notes kdesdk-dolphin-plugins kdesdk-kate kdeutils-ark kdeutils-kgpg kdeutils-kwallet kdeutils-sweeper kipi-plugins kwebkitpart kfaenza-icon-theme oxygen-gtk2 oxygen-gtk3 qt5-webkit transmission-qt ttf-bitstream-vera ttf-dejavu vlc webkitgtk xdg-user-dirs"

echo "Remove MATE, Clear PKG Cache, Install KDE..."

kde_config() {

echo "Configuring KDE.."
# Set KDE in .dmrc
	echo "[Desktop]" >  /home/${1}/.dmrc
	echo "Session=kde-plasma" >>  /home/${1}/.dmrc
	chown ${1}:users	/home/${1}/.dmrc

	# Download Flattr Icon Set
    cd  /usr/share/icons
    git clone https://github.com/NitruxSA/flattr-icons.git flattr-icons
    cd flattr-icons
    rm index.theme
    mv index.theme.kde index.theme
    sed -i 's|Example=x-directory-normal|Example=folder|g' index.theme
    sed -i 's|Inherits=Flattr|Inherits=KFaenza,Oxygen|g' index.theme
    rm -R .git

	# Get zip file from github, unzip it and copy all setup files in their right places.
	cd  /tmp
    wget -q "https://github.com/Antergos/kde-setup/archive/master.zip"
    unzip -o -qq  /tmp/master.zip -d  /tmp
    cp -R  /tmp/kde-setup-master/etc  /
    cp -R  /tmp/kde-setup-master/usr  /

	# Set User & Root environments
	cp -R  /etc/skel/.kde4  /home/${1}
    cp -R  /etc/skel/.config  /root

	## Set defaults directories
	su -c xdg-user-dirs-update ${1}

	# Fix Permissions
	chown -R ${1}:users /home/${1}
}

${remove1} || ${remove2};

${clean1} && ${clean2} && ${install_kde} && kde_config

#echo "Switch to LightDM"
#systemctl disable gdm && systemctl enable lightdm;

echo 'Done.'
exit 0;
