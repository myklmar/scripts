#! /bin/bash
# crossword solver
# mmartin

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

E_NOPATT=71	#no pattern exit error
DICT=/usr/share/dict/american-english
echo
if [ -z "$1" ]	#check to see if command line argument is there.
then
echo 
echo
echo

#echo -e "\033[1;31mHow To Use\033[0m\n";
echo $RED "HOW TO USE" $STAND
echo "Type cword (followed by your known letters and unknown spaces)"
echo "using the following \"pattern,\""
#echo "using our  "$0" \"pattern,\""
echo
echo $BLUE "     XXX..X.X..."$STAND;
echo
echo "The x's represent known letters,"
echo "and the periods are unknown letters (blanks)."
echo "Letters and periods can be in any position."
echo "For example, try:   cword w...i....n"
echo
exit $E_NOPATT
fi

echo							
echo $RED "Answers could be..."$STAND;
echo
grep ^"$1"$ "$DICT"
# ^ = start of word regular expression anchor
# $= end of word anchor
echo
echo
exit $?