#!/usr/bin/env bash
export PATH="/opt/wine-osu/bin/:$PATH" #gonX's wine https://drive.google.com/drive/folders/17MVlyXixv7uS3JW4B-H8oS4qgLn7eBw5
export WINEARCH=win32
export WINEPREFIX="$HOME/.wineosu"
export LANG="fi_FI.UTF-8"
#export WINEFSYNC=1
# export LANG="ja_JP.UTF8"
# /usr/bin/xfconf-query
wine --version
#export STAGING_AUDIO_PERIOD=15000

#start osu!
cd $HOME/.wineosu/osu\!/
if [ $1 = "-cfg" ]
then
    echo Opening winecfg...
    winecfg
elif [ $1 = "-e" ]
then
    echo Executing your shit
    wine $2 $3 #Most likely wont need more args idk
else
    xfconf-query -c xfce4-notifyd -p /do-not-disturb -s true
    /usr/bin/xfconf-query -c xfwm4 -p /general/use_compositing -s false
    wine winediscordipcbridge.exe & 
    gamemoderun wine osu\!.exe "$" # | cat
    
    echo "osu is done running!!"
    /usr/bin/xfconf-query -c xfwm4 -p /general/use_compositing -s true
    xfconf-query -c xfce4-notifyd -p /do-not-disturb -s false
fi

