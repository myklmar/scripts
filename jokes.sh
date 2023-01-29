#!/bin/bash
#mmartin.,(DATE),    Purpose: 

awk '
BEGIN{ srand() } 
rand() * NR < 1 { 
    line = $0 
} 
END { print line }' jokes.txt







exit


   
