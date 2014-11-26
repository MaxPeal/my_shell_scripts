#!/bin/bash
# Modified for Yahoo weather by Peter Thorstenson
# Based on a script written by Peter Garceau
# Originally based on the RDF Feed Display Script by Hellf[i]re v0.1
# 
# This script is designed for the Yahoo Weather XML RSS.
# Just substitute "BRXX0201" with the code for your location
# 
# This script depends on curl.
# yum -y install curl
#
# Usage:
# .conkyrc:    ${execi [time] /path/to/script/rss-weather.sh}


#RSS Setup
#the URI to the xml page 
URI=http://xml.weather.yahoo.com/forecastrss?p=BRXX0099\&u=c

#number of lines to display
LINES=8

#Path to curl
EXEC="/usr/bin/curl -s"                

#Work Start
$EXEC $URI | sed -n -e '/<!\[CDATA\[/,/\]\]>/p' |  #print text between "<![CDATA[" and "]]>"
sed -e 's/<!\[CDATA\[//g' |                        #remove "<![CDATA[" to leave only clean html tags
sed -e 's/\]\]>//g' |                              #remove "]]>" for the same reason
sed -e 's/<[^>]*>//g' |                            #remove all html tags
head -n $(($LINES + 2)) |                          #trim off useless lines
tail -n $LINES
