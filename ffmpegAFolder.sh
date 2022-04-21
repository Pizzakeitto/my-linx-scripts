#!/bin/bash
# This was made possible using Stack Overflow <3 and some other sites
# (because idk how to make scripts (im a noob))
# 
# https://stackoverflow.com/a/26109838
# https://linuxconfig.org/how-to-use-ffmpeg-to-convert-multiple-media-files-at-once-on-linux
# https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html


srcExt=$1
destExt=$2

srcDir=$3
destDir=$4

opts=$5

for filename in "$srcDir"/*.$srcExt; do

        basePath=${filename%.*}
        baseName=${basePath##*/}
	
	# echo "${baseName%.flac}"
	# echo "$filename"        
	ffmpeg -i "$filename" $opts "$destDir"/"${baseName%.flac}"."$destExt"

done

echo "Conversion from ${srcExt} to ${destExt} complete!"
