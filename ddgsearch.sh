#!/bin/bash
#mmartin..........25/10/22
# duckduckgo search 
# alias=sr

if [[ $(echo "$*") ]]; then
    searchterm="$*"
else
read -r -p "Enter your search term: " searchterm
fi

searchterm=$(echo "$searchterm" | sed -e 's/\ /+/g')
lynx -accept_all_cookies=on https://www.duckduckgo.com/html?q="$searchterm"


exit


   



exit


   
