#!/bin/bash
# This script will capture webcam images and name them incrementally
# the name is is passed in by argument
# images are stored in ~/argument
## Setup variables
DIR=~/$1
NAME="$1"

## Setup image directory
mkdir -p $DIR
#
## Setup image index file
if [ ! -f $DIR/index.txt ]; then
    echo "Creating index file"
    touch $DIR/index.txt
    echo "1" > $DIR/index.txt
fi
#
## Get index
typeset -i index=$(cat $DIR/index.txt)
echo index: $index
#
## Take picture
fswebcam --no-banner $DIR/$NAME$index.jpg

## Increment and write index
((index++))
echo $index > $DIR/index.txt 
