#!/usr/bin/env bash
# mmartin..........updated 25/11/22

# needs ffmpeg installed
# needs ImageMagick installed for picture conversion

#################################################
##### MOVE FILES TO WORK ON INTO MPS FOLDER #####
#################################################

RED=$(tput setaf 1 && tput bold)
GREEN=$(tput setaf 2 && tput bold)
YELLOW=$(tput setaf 3 && tput bold)
BLUE=$(tput setaf 4 && tput bold)
MAGENTA=$(tput setaf 5 && tput bold)
CYAN=$(tput setaf 6 && tput bold)
WHITEbg=$(tput setab 7 && tput bold)
STAND=$(tput sgr0)


#cd $2 #change dir to dest
#cd ~/Downloads/mps


#What program does.
#converts *.mp4 / webm /opus /mkv /dff /flac /wma /ogg /m4a /wav to *.mp3

#find . -name "*.mp4" -exec bash -c 'var=${1%.mp4}; var=${var#*/};ffmpeg -i "${1#*/}" -vn -acodec libmp3lame -ac 2 -qscale:a 4 -ar 48000 "$dest/$var".mp3' - '{}' \;



#checking to see if needed programs installed.

command -v ffmpeg >/dev/null 2>&1 || { echo >&2 "I require ffmpeg but it's not installed. Please install and then return..""$RED""$WHITEbg""Aborting.""$STAND";
 exit 1; }
command -v magick >/dev/null 2>&1 || { echo >&2 "I require ImageMagick but it's not installed. Please install then return..""$RED""$WHITEbg""Aborting.""$STAND"; exit 1; }
#command -v kitty >/dev/null 2>&1 || { echo >&2 "$RED""$WHITEbg""kitty required but it's not installed. Please install and then return..ABORTING.""$STAND"; exit 1; }



trap '' 2

while true

 do
 clear
    echo "####################################"
    echo "$BLUE""	    PROGRAM MENU                  ""$STAND"
    echo "####################################"
    echo    
    echo "   Move files to be converted into Downloads/mps folder"
    echo  "   Don't worry, if it does't exist, I've already created it for you." 
    echo "   Move the files and press your option."
    echo

    [ -d ~/Downloads/mps ] || mkdir ~/Downloads/mps

    cd ~/Downloads/mps || exit

    echo "$CYAN""  1 - convert to mp3""$STAND"
    echo "$GREEN""  2 - convert to mp4""$STAND"
    echo "$YELLOW""  3 - convert pictures""$STAND"
    echo "$BLUE""  4 - convert books""$STAND"
    echo "$MAGENTA""  5 - cleanup""$STAND"
    echo ""
    echo "$RED""  q - exit program""$STAND"
    echo ""
     
    echo "enter answer"
    read answer 
   	case "$answer" in

       	 1 ) #convert various formats to mp3

find . -name "*.mp4" -exec bash -c 'ffmpeg -i "$1" -vn -acodec libmp3lame -ac 2 -qscale:a 4 -ar 48000 "${1%.mp4}".mp3' - '{}' \;
find . -name "*.webm" -exec bash -c 'ffmpeg -i "$1" -vn -acodec libmp3lame -ac 2 -qscale:a 4 -ar 48000 "${1%.webm}".mp3' - '{}' \;
find . -name "*.opus" -exec bash -c 'ffmpeg -i "$1" -vn -acodec libmp3lame -ac 2 -qscale:a 4 -ar 48000 "${1%.opus}".mp3' - '{}' \;
find . -name "*.mkv" -exec bash -c 'ffmpeg -i "$1" -vn -acodec libmp3lame -ac 2 -qscale:a 4 -ar 48000 "${1%.mkv}".mp3' - '{}' \;
find . -name "*.dff" -exec bash -c 'ffmpeg -i "$1" -vn -acodec libmp3lame -ac 2 -qscale:a 4 -ar 48000 "${1%.dff}".mp3' - '{}' \;
find . -name "*.flac" -exec bash -c 'ffmpeg -i "$1" -vn -acodec libmp3lame -ac 2 -qscale:a 4 -ar 48000 "${1%.flac}".mp3' - '{}' \;
find . -name "*.ogg" -exec bash -c 'ffmpeg -i "$1" -vn -acodec libmp3lame -ac 2 -qscale:a 4 -ar 48000 "${1%.ogg}".mp3' - '{}' \;
find . -name "*.wma" -exec bash -c 'ffmpeg -i "$1" -vn -acodec libmp3lame -ac 2 -qscale:a 4 -ar 48000 "${1%.wma}".mp3' - '{}' \;
find . -name "*.m4a" -exec bash -c 'ffmpeg -i "$1" -vn -acodec libmp3lame -ac 2 -qscale:a 4 -ar 48000 "${1%.m4a}".mp3' - '{}' \; 
find . -name "*.wav" -exec bash -c 'ffmpeg -i "$1" -vn -acodec libmp3lame -ac 2 -qscale:a 4 -ar 48000 "${1%.wav}".mp3' - '{}' \; ;;   

 	 	
        2 ) #convert webm/mkv/avi/flv/wmv to mp4
find . -name "*.webm" -exec bash -c 'ffmpeg -i "$1" -preset veryfast "${1%.webm}".mp4' - '{}' \;
find . -name "*.flv" -exec bash -c 'ffmpeg -i "$1" -preset veryfast "${1%.flv}".mp4' - '{}' \;
find . -name "*.webm" -exec bash -c 'ffmpeg -i "$1" -preset veryfast "${1%.webm}".mp4' - '{}' \;
find . -name "*.mkv" -exec bash -c 'ffmpeg -i "$1" -preset veryfast "${1%.mkv}".mp4' - '{}' \;
find . -name "*.avi" -exec bash -c 'ffmpeg -i "$1" -preset veryfast "${1%.avi}".mp4' - '{}' \; ;;




        3 ) #convert pictures
while true

do
clear
echo
echo "$BLUE""     Picture Format Conversion"
echo "   ----------------------------""$STAND"
echo "   (Don't forget to move pics to mps folder!)"
echo
echo
echo "$GREEN""   1 - convert to jpg""$STAND"
echo "$YELLOW""   2 - convert jpg to gif""$STAND"
echo "$CYAN""   3 - convert jpg to webp""$STAND"
echo ""     
echo "$RED""   l - exit section""$STAND"

echo "enter answer"
    read answera
   	case "$answera" in


        1)  #convert to jpg

find . -name "*.png" -exec bash -c 'magick "$1" "${1%.png}".jpg' - '{}' \;
find . -name "*.gif" -exec bash -c 'magick "$1" "${1%.gif}".jpg' - '{}' \;
find . -name "*.webp" -exec bash -c 'magick "$1" "${1%.webp}".jpg' - '{}' \;
find . -name "*.bmp" -exec bash -c 'magick "$1" "${1%.bmp}".jpg' - '{}' \; ;;


        2)  #convert jpeg to gif

echo "$CYAN""Making a gif...it'll be ready soon!""$STAND"
magick *.jpg images.gif ;;


        3)  #convert jpg to webp

find . -name "*.png" -exec bash -c 'magick "$1" "${1%.png}".webp' - '{}' \;
find . -name "*.gif" -exec bash -c 'magick "$1" "${1%.gif}".webp' - '{}' \;
find . -name "*.jpg" -exec bash -c 'magick "$1" "${1%.jpg}".webp' - '{}' \;
find . -name "*.bmp" -exec bash -c 'magick "$1" "${1%.bmp}".webp' - '{}' \; ;;

          
         l) convert

break 3 ;;
   
     esac

echo "$YELLOW""enter return to continue""$STAND"
 read input 

done ;;



        4)  #Convert all .epub files in the current directory to .pdf files. Requires calibre (ebook-convert) Loop through all files in the current directory

clear
echo
echo "$CYAN""  Book Format Conversion"
echo "---------------------------------""$STAND"
echo "$YELLOW""   1 - books to pdf""$STAND"
echo "$RED""   l - exit section""$STAND"

 echo "enter answer"
    read answer 
  
if [ "$answer" = "1" ]
then  
for file in *.azw3 *.epub *.mobi
do
    # Get the filename without the .extension
    filename="${file%.*}"
    
    # Convert the .file to a .pdf file using calibre's ebook-convert command
    ebook-convert "$file" "$filename.pdf"

echo
echo "$GREEN""All available book files converted to .pdf files!""$STAND";
echo
done
fi

if [ "$answer" = "l" ]
then

echo "$BLUE""Returning to main program""$STAND";
sleep 2
fi

;;

       	5) # do the dangerous stuff 
echo "$MAGENTA""Cleaning up" "$STAND"
echo    ""
echo "$RED""   Start Cleanup including mp4?   ...[y/n]..""$STAND";
read x 
if [ "$x" = "y" ]
then  

find . -name "*.mp4" -exec bash -c 'var=${1%.mp4}; var=${var#*/}; rm "${1#*/}"' - '{}' \;
find . -name "*.webm" -exec bash -c 'var=${1%.webm}; var=${var#*/}; rm "${1#*/}"' - '{}' \;
find . -name "*.opus" -exec bash -c 'var=${1%.opus}; var=${var#*/}; rm "${1#*/}"' - '{}' \;
find . -name "*.mkv" -exec bash -c 'var=${1%.mkv}; var=${var#*/}; rm "${1#*/}"' - '{}' \;
find . -name "*.dff" -exec bash -c 'var=${1%.dff}; var=${var#*/}; rm "${1#*/}"' - '{}' \;
find . -name "*.flac" -exec bash -c 'var=${1%.flac}; var=${var#*/}; rm "${1#*/}"' - '{}' \;
find . -name "*.ogg" -exec bash -c 'var=${1%.ogg}; var=${var#*/}; rm "${1#*/}"' - '{}' \;
find . -name "*.wma" -exec bash -c 'var=${1%.wma}; var=${var#*/}; rm "${1#*/}"' - '{}' \;
find . -name "*.wav" -exec bash -c 'var=${1%.wav}; var=${var#*/}; rm "${1#*/}"' - '{}' \;

fi 

if [ "$x" = "n" ]
then
find . -name "*.webm" -exec bash -c 'var=${1%.webm}; var=${var#*/}; rm "${1#*/}"' - '{}' \;
find . -name "*.opus" -exec bash -c 'var=${1%.opus}; var=${var#*/}; rm "${1#*/}"' - '{}' \;
find . -name "*.mkv" -exec bash -c 'var=${1%.mkv}; var=${var#*/}; rm "${1#*/}"' - '{}' \;
find . -name "*.dff" -exec bash -c 'var=${1%.dff}; var=${var#*/}; rm "${1#*/}"' - '{}' \;
find . -name "*.flac" -exec bash -c 'var=${1%.flac}; var=${var#*/}; rm "${1#*/}"' - '{}' \;
find . -name "*.ogg" -exec bash -c 'var=${1%.ogg}; var=${var#*/}; rm "${1#*/}"' - '{}' \;
find . -name "*.wma" -exec bash -c 'var=${1%.wma}; var=${var#*/}; rm "${1#*/}"' - '{}' \;
find . -name "*.m4a" -exec bash -c 'var=${1%.m4a}; var=${var#*/}; rm "${1#*/}"' - '{}' \;
find . -name "*.wav" -exec bash -c 'var=${1%.wav}; var=${var#*/}; rm "${1#*/}"' - '{}' \;

fi

echo    ""
echo "$MAGENTA""  Cleaning completed  ""$STAND"; ;;



        q) echo "LEAVING PROGRAM"
exit ;;
        * ) echo "Please enter 1, 2, 3, 4, 5, or q"; press_enter

  	 esac
   echo

#echo "$YELLOW" "enter return to continue""$STAND"
#read input 
   
done

#23/1/23
