#!bin/bash
# mmartin
# 24/02/21

# Menu to show system info 


trap '' 2

while true

 do
 clear
    echo "####################################"
    echo "	    PROGRAM MENU"
    echo "####################################"
    echo
    echo "1 - display free disk space"
    echo "2 - display calendar"
    echo "3 - full info"
    echo "4 - uptime"
    echo ""
    echo "q - exit program"
    echo ""
     
    echo "enter answer"
    read answer
   	 case "$answer" in
       	 	1 ) duf ;;
       	 	2 ) cal ;;
        	3 ) systemInfo ;;
        	4) uptime -p | cut -c3- ;;
        	q) exit ;;
        	* ) echo "Please enter 1, 2, 3, 4 or q"; press_enter
  	 esac
   echo
   echo -e "enter return to continue \c"
   read input
   
done
