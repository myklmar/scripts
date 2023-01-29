#!/bin/bash
# mmartin.10/01/22    Purpose: Make app from website
# 
# declare colours
red='\e[1;31m%s\e[0m\n'                                                                                                                                                      
green='\e[1;32m%s\e[0m\n'
yellow='\e[1;33m%s\e[0m\n'

#check if destination exists, if not then create
[ -d ~/Programs/WebApps ] || mkdir ~/Programs/WebApps/

clear
echo
printf $yellow '    Name of app...'
read x
app=$x
echo
printf $yellow "    Address of site...https://"
read w
echo

desktop_file="$HOME/Desktop/app.desktop"
icon=emblem-web

printf $green 'Installing '${app}' to Programs/WebApps...'

echo "[Desktop Entry]
Terminal=false
Type=Application
Name=${app}
Exec=firefox -- '$w'
Icon=${icon}" > "$desktop_file"

chmod +x "$desktop_file"

#mv ${app} ~/Programs/WebApps/${app}
#mv $desktop_file ~/Programs/WebApps/${app}
#mv $HOME/Desktop/app.desktop ~/Programs/WebApps
mv $desktop_file ${app}.desktop
#mv $desktop_file ~/Programs/WebApps/'${app}.desktop'
mv ${app}.desktop ~/Programs/WebApps/


echo
printf $red 'Done'



exit


   
