#!/bin/bash
# mmartin
# 04/10/19
# script to show numberof days until certain event

#TIME_TODAY=$(date -d "00:00" +%s)

MAGENTA=$(tput setaf 5 && tput bold)
STAND=$(tput sgr0)
RED=$(tput setaf 1 && tput bold)

MYDATE=`zenity --calendar --title="Mykls Time" --text="pick a date" --width=300 --date-format="%a %d %B %Y"` 
echo
clear
echo
echo $RED "                   $MYDATE";

{
echo $MAGENTA"
        #####################################
        #                                   #
        #       "$(( ($(date -d "$MYDATE" +%s) - $(date -d "00:00" +%s)) / 86400 )) days until event"        #
        #                                   #
        #####################################"$STAND
}

#echo "$(( ($(date -d "$MYDATE" +%s) - $(date -d "00:00" +%s)) / 86400 )) days until event"
echo
echo
echo
exit


