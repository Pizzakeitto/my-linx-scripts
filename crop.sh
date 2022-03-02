#!/bin/bash
#Barebones script that crops videos
#Made by Pizzakeitto, help from Bytzi :sunglasses:

#I also used this to learn how the cropping thing works
#https://superuser.com/questions/810471/remove-mp4-video-top-and-bottom-black-bars-using-ffmpeg

echo Detecting black bars...
lol=$( ffmpeg -i "$@" -vf cropdetect -f null - 2>&1 | grep -o 'crop=[^ ,]\+' | sed 's/.*=//g' | head -n 1 )
echo Found $lol

ffmpeg -i "$@" -vf crop=$lol -c:a copy "cropped_$@"