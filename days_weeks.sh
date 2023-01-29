#!/bin/bash
# mmartin......3/1/2023....Purpose:.Calculate days/weeks between two dates.
# 

red='\e[1;31m%s\e[0m\n'                                                                                                                                                      
green='\e[1;32m%s\e[0m\n'
yellow='\e[1;33m%s\e[0m\n'



trap '' 2

while true

 do
 clear
    echo "####################################"
printf  $yellow '	    PROGRAM MENU'  
    echo "####################################"
    echo
printf $yellow '1 - Calculate days/weeks between two dates'
    echo 
printf $green '2 - Calculate days left until event'
#echo "3 - full info"
#   echo "4 - uptime"
    echo ""
printf $red 'q - exit program'
    echo ""
     
    echo "enter answer"
    read answer
   	 case "$answer" in
       	 	
        1 )    #calculate days  	 	

    echo
    echo
    printf $yellow '    ENTER DATES IN FOLLOWING FORMAT: yyyy/mm/dd'
    printf $yellow '    -------------------------------------------'
    echo
    echo "Enter start date....." 
    read STARTDATE
    echo "Enter end date....." 
    read ENDDATE


diff=$(( ($(date -d "$ENDDATE" +%s) - $(date -d "$STARTDATE" +%s)) ))

days=$(($diff/(60*60*24)))

weeks=$(($days/7))

years=$(($days/365))

echo
echo "Days between the two dates are" "$days"
echo  "Weeks between the two dates are" "$weeks"
echo "(Oops..That's" "$years" "years!"")" ;;


        2 )     # calc days left

printf $yellow '    ENTER DATES IN FOLLOWING FORMAT: yyyy/mm/dd'
printf $yellow '    -------------------------------------------'
    echo
    echo "Enter target date....." 
    read MYDATE
    #echo "Enter end date....." 
    #read ENDDATE

printf $green 
echo "$(( ($(date -d "$MYDATE" +%s) - $(date -d "00:00" +%s)) / 86400 )) days until event"
 ;;


      	q) exit ;;
        	* ) echo "Please enter 1, 2, 3, 4 or q";
  	 esac

   echo
printf "enter return to continue"
   read input
   
done

   











   
