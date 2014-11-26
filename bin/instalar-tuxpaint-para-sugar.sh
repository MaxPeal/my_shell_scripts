#!/bin/bash

# Install dependencies
sudo apt-get --yes install \
    cmake cmake-curses-gui cmake-data cmake-doc cmake-qt-gui \
    gperf gperf-ace libglib2.0-0 libglib2.0-bin libglib2.0-data \
    libglib2.0-dev libglib2.0-doc libgtk2.0-0 libgtk2.0-bin libgtk2.0-common \
    libgtk2.0-dev libgtk2.0-doc libgee2 libgee-dev gconf2 \
    gconf2-common libgconf-2-4 libgconf2-4 libgconf2-dev libgconf2-doc \
    libdbus-glib-1-2 libdbus-glib-1-dev libdbus-glib-1-doc libpango1.0-0 libpango1.0-dev \
    libpango1.0-doc librsvg2-2 librsvg2-bin librsvg2-common librsvg2-dev \
    python-dev python2.7-dev python-gobject python-gobject-2 python-gobject-2-dev \
    python-gobject-dev python-gtk2 python-gtk2-dev python-gtk2-doc python-gtk2-tutorial \
    python-gtkglext1 python-gtk-gnash python-gtksourceview2 python-gtkspell python-gtk-vnc \
    python-gtkmvc python-gtkmvc-doc python-cairo python-cairo-dev libpaper1 \
    libpaper-dev libpaper-utils libcairo2 libcairo2-dev libcairo2-doc \
    libcairo5c-0 libcairo-gobject2 libcairo-script-interpreter2 libfribidi0 libfribidi-dev \
    libsdl1.2debian libsdl1.2-dev libsdl-image1.2 libsdl-image1.2-dev libsdl-mixer1.2 \
    libsdl-mixer1.2-dev libsdl-ttf2.0-0 libsdl-ttf2.0-dev libsdl-pango1 libsdl-pango-dev

# Fetch sources
mkdir -p ~/dev/sugar/tuxpaint
cd ~/dev/sugar/tuxpaint
if [ ! -f "polyol-1.2.tar.gz" ]; then
	wget http://download.sugarlabs.org/sources/external/polyol/polyol-1.2.tar.gz
elif [ "2578ebc5fa21c93492cb73141b86e4a0233bd421" != "`sha1sum polyol-1.2.tar.gz | cut -d ' ' -f 1`" ]; then
	rm -f polyol-1.2.tar.gz
	wget http://download.sugarlabs.org/sources/external/polyol/polyol-1.2.tar.gz
fi
tar xzpvf polyol-1.2.tar.gz
if [ ! -f "tuxpaint-0.9.22.tar.gz" ]; then
	wget http://download.sugarlabs.org/sources/external/tuxpaint/tuxpaint-0.9.22.tar.gz
elif [ "1698aa148c7b2501aaeaad96653fdb4f21142285" != "`sha1sum tuxpaint-0.9.22.tar.gz | cut -d ' ' -f 1`" ]; then
	rm -f tuxpaint-0.9.22.tar.gz
	wget http://download.sugarlabs.org/sources/external/tuxpaint/tuxpaint-0.9.22.tar.gz
fi
tar xzpvf tuxpaint-0.9.22.tar.gz

# Build Polyol
cd ~/dev/sugar/tuxpaint/polyol-1.2
cmake -DCMAKE_INSTALL_PREFIX=$HOME/Activities/tuxpaint.activity && make && make install

# Build TuxPaint
cd ~/dev/sugar/tuxpaint/tuxpaint-0.9.22
PKG_CONFIG_PATH=$HOME/Activities/tuxpaint.activity/lib/pkgconfig make PREFIX=$HOME/Activities/tuxpaint.activity SUGAR=1
make PREFIX=$HOME/Activities/tuxpaint.activity SUGAR=1 install

# Link activity directory
cd ~/Activities/tuxpaint.activity
ln -s ~/dev/sugar/tuxpaint/tuxpaint-0.9.22/activity .
