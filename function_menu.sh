#!/bin/bash
###################################################################### 
#Copyright (C) 2022  Kris Occhipinti
#https://filmsbykris.com

#This program is free software: you can redistribute it and/or modify
#it under the terms of the GNU General Public License as published by
#the Free Software Foundation, either version 3 of the License, or
#(at your option) any later version.

#This program is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU General Public License for more details.

#You should have received a copy of the GNU General Public License
#along with this program.  If not, see <http://www.gnu.org/licenses/>.
###################################################################### 

#function 
ip() {
  ifconfig wlp3s0|grep inet|grep -v inet6|awk '{print $2}'
}

#function 
ssid(){
  iwgetid -r
}

#function 
date_format(){
  date +%Y-%m-%d
}

#function 
running_time(){
  uptime|cut -d\, -f1
}

#function 
hello(){
  echo "Hello World"
}

#function 
bye(){
  echo "Good-Bye"
}

quit(){
    echo "OK...going"
exit
}

#[[ "$1" ]] && $1 || eval $(grep '^function' $0|awk '{print $2}'|cut -d\( -f1|fzf --prompt "Selection a Function: " )

eval $(echo "ip\nssid\ndate_format\nrunning_time\nhello\nquit" |fzf)
