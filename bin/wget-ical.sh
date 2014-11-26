#!/bin/bash

# config date
FILEDATE=$(date +"%H:%M_%d-%m-%y")

# config files and url
case $1 in
    "EaD-Informatica-Gyn-2a.etapa")
	ICSFILE="$HOME/.orgcal/ead-informatica-gyn-2a.etapa_$FILEDATE.ics"
	ORGFILE="$HOME/.orgcal/ead-informatica-gyn-2a.etapa_$FILEDATE.org"
	URL="http://ead.go.gov.br/tecnicosead/calendar/export_execute.php?userid=208&authtoken=607935e86bc16a3e2baff354cc1b021965dfe56d&preset_what=all&preset_time=recentupcoming"
	;;
    "Google")
	ICSFILE="$HOME/.orgcal/google_$FILEDATE.ics"
	ORGFILE="$HOME/.orgcal/google_$FILEDATE.org"
	URL="https://www.google.com/calendar/ical/joaomanoel7%40gmail.com/private-e7e5d778acf1996008cf12b25ecba0fc/basic.ics"
	;;
    "Eadv6-03")
	ICSFILE="$HOME/.orgcal/eadv6-03_$FILEDATE.ics"
	ORGFILE="$HOME/.orgcal/eadv6-03_$FILEDATE.org"
	URL="http://saladeaula.nic.br/moodle/calendar/export_execute.php?userid=269&authtoken=ac79073700070e8a34d3831dcce48f2a6687d7b1&preset_what=all&preset_time=recentupcoming"
	;;
    *)
	if [ -z "$2" ]; then
	    echo -e "\nUsage: \n\t`basename $0` CALENDAR URL\n"
	    exit 1
	fi
	ICSFILE="$HOME/.orgcal/${1}_$FILEDATE.ics"
	ORGFILE="$HOME/.orgcal/${1}_$FILEDATE.org"
	URL="$2"
	;;
esac

# create dir
mkdir -p $HOME/.orgcal

# get ics file
wget -O $ICSFILE "$URL"

# convert ics file to org file
gawk -f $HOME/bin/ical2org.awk -v mycal="$1" < $ICSFILE > $ORGFILE
