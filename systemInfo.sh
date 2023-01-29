#!/usr/bin/env bash

# mmartin..........11/02/16

#### Program to give system information ####

set -eo 

#### COLOR SETTINGS ####
BLACK=$(tput setaf 0 && tput bold)
RED=$(tput setaf 1 && tput bold)
GREEN=$(tput setaf 2 && tput bold)
YELLOW=$(tput setaf 3 && tput bold)
BLUE=$(tput setaf 4 && tput bold)
MAGENTA=$(tput setaf 5 && tput bold)
CYAN=$(tput setaf 6 && tput bold)
WHITE=$(tput setaf 7 && tput bold)
BLACKbg=$(tput setab 0 && tput bold)
REDbg=$(tput setab 1 && tput bold)
GREENbg=$(tput setab 2 && tput bold)
YELLOWbg=$(tput setab 3 && tput bold)
BLUEbg=$(tput setab 4 && tput dim)
MAGENTAbg=$(tput setab 5 && tput bold)
CYANbg=$(tput setab 6 && tput bold)
WHITEbg=$(tput setab 7 && tput bold)
STAND=$(tput sgr0)

clear

### try to just show small section or complete###
#function press_enter
#{
#    echo ""
#   echo -n "Press Enter to continue"
#  read
#    clear
#}

#selection=
#until [ "$selection" = "0" ]; do
#    echo ""
#    echo "PROGRAM MENU"
#    echo "1 - display free disk space"
#    echo "2 - display free memory"
#    echo "3 - run full"
#   echo ""
#    echo "0 - exit program"
#    echo ""
#    echo -n "Enter selection: "
#    read selection
#    echo ""
#    case $selection in
#        1 ) df ;;
#        2 ) free ;;
#        3 )  ;;
#        0 ) exit ;;
#        * ) echo "Please enter 1, 2, 3 or 0"; press_enter
#   esac
#done


#### script info
{
echo  $MAGENTA"
                 ###########################################
                 #                                         #
		 #           System Utils script 	   #
		 #           Written by: myklmar           #
		 #      Mail: myklmar@gmail.com            #
		 #        Date created: 11 Feb 2016	   #
		 #                                         #
		 ###########################################"$STAND
}

sleep 2 && clear



#### $declarations ####
{
TITLE="SYSTEM INFORMATION"
CURRENT_TIME=$(date +"%c")
TIME_STAMP="Updated on $CURRENT_TIME by $USER"
#DEFAULT_ROUTE=$(ip route show default | awk '/default/ {print $3}')
#IFACE=$(ip route show | awk '(NR == 2) {print $3}')
MYIP=$(ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p' )
PUBLIC_IP=$(wget -q -O - http://icanhazip.com/ | tail)
#ETH=$(ifconfig | awk '/enp/ { print $1": " $5 }')
#WLAN=$(ifconfig | awk '/wlan/ { print $1": " $5 }')
KERNEL=$(uname -srv)
DISTRO=$(cat /etc/os-release | head -n 2)
VERSION=$(cat /etc/lsb-release | tail -n 1)
UPTIME=$(uptime | awk '{print $2" "$3}' | tr "," " ")
MEMORYmem=$(free -mt | awk '/Mem/{print "Total: " $2 "Mb\tUsed: " $3 "Mb\tFree: " $4 "Mb"}')
MEMORYswap=$(free -mt | awk '/Swap/{print "Total: " $2 "Mb\tUsed: " $3 "Mb\tFree: " $4 "Mb"}')
CPU_MODEL=`cat /proc/cpuinfo | grep 'model name' | cut -d: -f2 | awk 'NR==1'`
CPU_CORES=`lscpu | grep 'CPU(s)' | cut -d: -f2 | awk 'NR==1' | tr -d " "`
CPU_ARCHI=`lscpu | grep 'Architecture' | cut -d: -f2 | awk 'NR==1' | tr -d " "`
HOSTNAME=`hostname`
GPU=$(lspci | grep -i vga | cut -c35-75)
AUDIO=$(lspci | grep -i 'Audio Device' | sed -n '2p' | cut -c8-     )
#TMUXLS=$(tmux list-sessions | wc -l)
FREE1=$(df -h -t ext4 --output=source,size,used,pcent,avail) #| grep -vE '^Filesystem|tmpfs|/dev/sda|/dev/sdb' | awk '{ print "MAIN: "$2 "...Used:"$5 " ...Available:" $4 }')
FREE3=$(df -h /dev/sdb1 --output=source,size,used,pcent,avail,target) # | grep -vE '^Filesystem|tmpfs|udev|none|/dev/sda1|/dev/sdb' | awk '{ print "MULTIMEDIA: "$2 "...Used:"$5"...Available: " $4 }')
FREE2=$(df -H -t vfat --output=source,size,used,pcent,avail) #| grep -vE '^Filesystem|tmpfs|udev|none|/dev/sdg1|/dev/sda1' | awk '{ print "MUSIC: "$2 "...Used:"$5 "...Available: " $4 }')
}

#### system information chart ####
{
echo ""
echo "                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
echo "                      "$WHITE"$TITLE "for $HOSTNAME""
echo ""
echo ""
echo "              $TIME_STAMP"$STAND
echo "                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" 
echo ""
echo "+----------------+"
echo "|     Kernel     |" $RED$KERNEL$STAND
echo "+----------------+"
echo "|     Distro     |" $YELLOW$DISTRO$STAND
echo "|                |" $YELLOW$VERSION$STAND
echo "+----------------+"
echo "|     Uptime     |" $GREEN$UPTIME$STAND
echo "+----------------+"
echo "|     Memory     |" $BLUE$MEMORYmem$STAND
echo "+----------------+"
echo "|      Swap      |" $CYAN$MEMORYswap$STAND
echo "+----------------+"
echo "|    CPU Model   |" $BLUE$CPU_MODEL$STAND
echo "+----------------+"
echo "|    CPU Cores   |" $CYAN$CPU_CORES$STAND
echo "+----------------+"
echo "|CPU Architecture|" $GREEN$CPU_ARCHI$STAND
echo "+----------------+"
echo "|   Hostname     |" $YELLOW$HOSTNAME$STAND
echo "+----------------+"
echo "|     GPU        |" $MAGENTA$GPU$STAND
echo "+----------------+"
echo "|     AUDIO      |" $RED$AUDIO$STAND
echo "+----------------+"
echo "|    DISC SPACE  |" $CYAN$FREE1$STAND
echo "|                |" $CYAN$FREE2$STAND
echo "|                |" $CYAN$FREE3$STAND
echo "+----------------+"
echo "| Public IP      |" $GREEN$PUBLIC_IP$STAND
echo "+----------------+"
echo "|   My Lan IP    |" $GREEN$MYIP$STAND
echo "|+---------------+"
echo
echo
echo


}








exit


   
