#!/bin/sh
curl -C - -o ~/TeXLive/iso/README.html http://ctan.mirrors.hoobly.com/systems/texlive/Images/README.html
curl -C - -o ~/TeXLive/iso/texlive2015.iso.sha256 http://ctan.mirrors.hoobly.com/systems/texlive/Images/texlive2015.iso.sha256
curl -C - -o ~/TeXLive/iso/texlive2015.iso http://ctan.mirrors.hoobly.com/systems/texlive/Images/texlive2015.iso
exit 0
