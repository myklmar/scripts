#!/bin/bash
# mmartin....30/11/22......Purpose: check for installed programs........
# 



command -v ffmpeg >/dev/null 2>&1 || { echo >&2 "I require ffmpeg but it's not installed.  Aborting."; exit 1; }


command -v magick >/dev/null 2>&1 || { echo >&2 "I require ImageMagick but it's not installed.  Aborting."; exit 1; }


command -v kitty >/dev/null 2>&1 || { echo >&2 "I require kitty but it's not installed.  Aborting."; exit 1; }


printf "    All OK    "

exit


   
