#!/bin/bash

if [[ $# != 1 ]];
then
  echo "Usage: new-processing.sh <sketchname>"
  exit 1
fi

SKETCHNAME=$1

# set $DIR to be directory that script is in
CURRENTDIR="$( dirname "${BASH_SOURCE[0]}" )"
if [ $CURRENTDIR = "." ]
then
  DIR="$(pwd)"
else
  DIR="$(pwd)/$CURRENTDIR"
fi

cp -r $DIR/../templates/processing/basic-sketch $DIR/../sketchbook/processing/$SKETCHNAME
