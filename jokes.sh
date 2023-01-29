#!/bin/bash
#mmartin.,29/01/23,    Purpose: print a random joke 
##############################################################################################################
# download 'jokes.txt' and place in same directory as 'jokes.sh' or direct script to location of 'jokes.txt'
##############################################################################################################

awk '
BEGIN{ srand() } 
rand() * NR < 1 { 
    line = $0 
} 
END { print line }' jokes.txt







exit


   
