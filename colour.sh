#!/bin/bash
# mmartin.........29/11/22.....Purpose: print text in colour


#Below are the color init strings for the basic file types. A color init
# string consists of one or more of the following numeric codes:
# Attribute codes:
# 00=none 01=bold 04=underscore 05=blink 07=reverse 08=concealed
# Text color codes:
# 30=black 31=red 32=green 33=yellow 34=blue 35=magenta 36=cyan 37=white
# Background color codes:
# 40=black 41=red 42=green 43=yellow 44=blue 45=magenta 46=cyan 47=white


red='\e[1;31m%s\e[0m\n'  cyan='\e[1;36m%s\e[0m\n'                                                                                                                                                      
green='\e[1;32m%s\e[0m\n'
yellow='\e[1;33m%s\e[0m\n'
magenta='\e[1;35m%s\e[0m\n' 
blue='\e[1;34m%s\e[0m\n' 
white='\e[7;37m%s\e[0m\n' 
revmag='\e[7;35m%s\e[0m\n' 
backred='\e[1;41m%s\e[0m\n' 



printf $red 'This is red'
printf $green 'This is green'
printf $yellow 'This is yellow'
printf $magenta 'This is magenta'
printf $blue 'This is blue'
printf $cyan 'This is cyan'
echo
printf $white 'This is reverse white'
printf $revmag 'This is reverse magenta'
echo
printf $backred 'This is background red'





exit


   
