#!/usr/bin/env bash
# mmartin..........updated 25/11/22

# needs ffmpeg installed
# needs ImageMagick installed for picture conversion

#################################################
##### MOVE FILES TO WORK ON INTO MPS FOLDER #####
#################################################

#cp -a /$1/. /$2/  #copy the whole dir from src to dest


#set -eo pipefail

#cd $2 #change dir to dest
cd ~/Downloads/mps


#convert *.mp4 / webm /opus /mkv /dff /flac /wma /ogg /m4a /wav to *.mp3

#find . -name "*.mp4" -exec bash -c 'var=${1%.mp4}; var=${var#*/};ffmpeg -i "${1#*/}" -vn -acodec libmp3lame -ac 2 -qscale:a 4 -ar 48000 "$dest/$var".mp3' - '{}' \;


trap '' 2

while true

 do
 clear
    echo "####################################"
    echo "	       PROGRAM MENU               "
    echo "####################################"
    echo "All files to be converted to be available in mps folder"
    echo    

    cd ~/Downloads/mps

    echo "1 - convert to mp3"
    echo "2 - convert to mp4"
    echo "3 - convert picture"
    echo "4 - cleanup"
    echo ""
    echo "q - exit program"
    echo ""
     
    echo "enter answer"
    read answer 
   	 case "$answer" in

       	 1 ) #convert to mp3

find . -name "*.mp4" -exec bash -c 'ffmpeg -i "$1" -vn -acodec libmp3lame -ac 2 -qscale:a 4 -ar 48000 "${1%.mp4}".mp3' - '{}' \;
find . -name "*.webm" -exec bash -c 'ffmpeg -i "$1" -vn -acodec libmp3lame -ac 2 -qscale:a 4 -ar 48000 "${1%.webm}".mp3' - '{}' \;
find . -name "*.opus" -exec bash -c 'ffmpeg -i "$1" -vn -acodec libmp3lame -ac 2 -qscale:a 4 -ar 48000 "${1%.opus}".mp3' - '{}' \;
find . -name "*.mkv" -exec bash -c 'ffmpeg -i "$1" -vn -acodec libmp3lame -ac 2 -qscale:a 4 -ar 48000 "${1%.mkv}".mp3' - '{}' \;
find . -name "*.dff" -exec bash -c 'ffmpeg -i "$1" -vn -acodec libmp3lame -ac 2 -qscale:a 4 -ar 48000 "${1%.dff}".mp3' - '{}' \;
find . -name "*.flac" -exec bash -c 'ffmpeg -i "$1" -vn -acodec libmp3lame -ac 2 -qscale:a 4 -ar 48000 "${1%.flac}".mp3' - '{}' \;
find . -name "*.ogg" -exec bash -c 'ffmpeg -i "$1" -vn -acodec libmp3lame -ac 2 -qscale:a 4 -ar 48000 "${1%.ogg}".mp3' - '{}' \;
find . -name "*.wma" -exec bash -c 'ffmpeg -i "$1" -vn -acodec libmp3lame -ac 2 -qscale:a 4 -ar 48000 "${1%.wma}".mp3' - '{}' \;
find . -name "*.m4a" -exec bash -c 'ffmpeg -i "$1" -vn -acodec libmp3lame -ac 2 -qscale:a 4 -ar 48000 "${1%.m4a}".mp3' - '{}' \; ;;
   
 	 	
        2 ) #convert webm/mkv/avi/flv/wmv to mp4
find . -name "*.webm" -exec bash -c 'ffmpeg -i "$1" -preset veryfast "${1%.webm}".mp4' - '{}' \;
find . -name "*.flv" -exec bash -c 'ffmpeg -i "$1" -preset veryfast "${1%.flv}".mp4' - '{}' \;
find . -name "*.webm" -exec bash -c 'ffmpeg -i "$1" -preset veryfast "${1%.webm}".mp4' - '{}' \;
find . -name "*.mkv" -exec bash -c 'ffmpeg -i "$1" -preset veryfast "${1%.mkv}".mp4' - '{}' \;
find . -name "*.avi" -exec bash -c 'ffmpeg -i "$1" -preset veryfast "${1%.avi}".mp4' - '{}' \; ;;

        3 ) #convert picture
echo "What picture?" 
read f
magick "$f.*" "${f%.*}.jpg" 
printf "\033[1;31mDone\033[0m\n"; ;;


       	4) # do the dangerous stuff
echo "Cleaning up" 
printf "\033[1;31mStart Cleanup including mp4?   ...[y/n]\033[0m\n";
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
find . -name "*.m4a" -exec bash -c 'var=${1%.m4a}; var=${var#*/}; rm "${1#*/}"' - '{}' \;

fi 

#printf "\033[1;31mCleaning Up Complete\033[0m\n"; 

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

fi

printf "\033[1;31mCleaning Up Complete\033[0m\n"; ;;



        q) exit ;;
        * ) echo "Please enter 1, 2, 3, 4 or q"; press_enter

  	 esac
   echo

 printf "enter return to continue"
   read input 
   
done
