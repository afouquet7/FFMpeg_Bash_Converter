#!/usr/bin/env bash

#
# Script Name: FFMpeg_Converter_h264.command
#
# Author: Alex Fouquet
# Date : 25.07.2019
#
# Description: The following script converts .mov files in to h264.mp4 files, with ffmpeg.
#
#
# Run Information: to run this script just duble click it
#
#
# Error Log: Any errors or output associated with the script will be displayed in termianl
#

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  TARGET="$(readlink "$SOURCE")"
  if [[ $TARGET == /* ]]; then
    echo "SOURCE '$SOURCE' is an absolute symlink to '$TARGET'"
    SOURCE="$TARGET"
  else
    DIR="$( dirname "$SOURCE" )"
    echo "SOURCE '$SOURCE' is a relative symlink to '$TARGET' (relative to '$DIR')"
    SOURCE="$DIR/$TARGET" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
  fi
done
echo "SOURCE is '$SOURCE'"
RDIR="$( dirname "$SOURCE" )"
DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
if [ "$DIR" != "$RDIR" ]; then
  echo "DIR '$RDIR' resolves to '$DIR'"
fi
echo "DIR is '$DIR'"

cd "$DIR"
#until this line bash is getting the location of script and setting it as current directory


for i in *.mov; #this loops through files in the directory and feeds it to ffmpeg
do

  ffmpeg -i "$i" -vcodec libx264 -pix_fmt yuv420p "${i%}h264.mp4";

done

  echo "your video files have been converted cheers!"
