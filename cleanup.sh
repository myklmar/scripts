#!/bin/bash

#cleans old log files and runs autoremove and autoclean

#mmartin

echo
printf "\033[1;31mCleaning Up Starting\033[0m\n";
echo
sudo find /var/log -type f -name "*.gz" 
sudo find /var/log -type f -name "*.gz" -delete
sudo apt-get -f install
sudo apt-get autoremove 
sudo apt-get -y autoclean

#remove tmp files
sudo find /tmp/*
sudo rm -fr /tmp/*
echo
printf "\033[1;31mDeleting Temp Files       ...[OK]\033[0m\n";

#remove thumbnails
sudo rm -rf ~/.thumbnails/*
printf "\033[1;31mDeleting Thumbnails       ...[OK]\033[0m\n";

#empty Trash
printf "\033[1;32mLooking in the Trash.....\033[0m\n";
sudo find ~/.local/share/Trash/*
sudo find /root/.local/share/Trash/*
printf "\033[1;31mEmpty Trash?   ...[y/n]\033[0m\n";
read x
if [ "$x" = "y" ]
then  # do the dangerous stuff
sudo rm -rf ~/.local/share/Trash/* 
sudo rm -rf /root/.local/share/Trash/*
printf "\033[1;31mEMPTYNG TRASH           ...[OK]\033[0m\n";

fi
echo

#browser cache clean
printf "\033[1;31mEmpty Browser Cache?   ...[y/n]\033[0m\n";
read x
if [ "$x" = "y" ]
then  # do the dangerous stuff
sudo rm -rf ~/.mozilla/firefox/*.default/Cache/* #Firefox/Iceweasel
printf "\033[1;31mDeleting FIREFOX/ICEWEASEL Cache	...[OK]\033[0m\n";
sudo rm -rf ~/.cache/google-chrome/Default/Cache/* #Google Chrome
printf "\033[1;31mDeleting GOOGLE CHROME Cache		...[OK]\033[0m\n";

fi

echo
printf "\033[1;31mCLEANING FINISHED!\033[0m\n";
echo
