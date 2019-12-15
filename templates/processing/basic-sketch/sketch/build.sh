#!/bin/bash

# set $DIR to be directory that script is in
CURRENTDIR="$( dirname "${BASH_SOURCE[0]}" )"
if [ $CURRENTDIR = "." ]
then
  DIR="$(pwd)"
else
  DIR="$(pwd)/$CURRENTDIR"
fi

# if out exists clean it
if [ -d $DIR/out ]
then
  rm -rf $DIR/out
fi

# if sketchtoot exists clean it
if [ ! -d $DIR/sketchtoot ]
then
  mkdir $DIR/sketchtoot
fi

# export executable
echo "Exporting..."
processing-java --sketch=$DIR --output=$DIR/out --export

# run sketch
$DIR/out/sketch

images=($DIR/sketchtoot/*.png)
if [ -e "${images[0]}" ]
then
  if [ ! -d $DIR/../../../../topost ]
  then
    mkdir $DIR/../../../../topost
  fi
  cp $DIR/sketchtoot/*.png $DIR/../../../../topost

  cd $DIR/../../../../ && npm run post

  rm -rf $DIR/../../../../topost

  # if imageslog exists clean it
  if [ ! -d $DIR/imageslog ]
  then
    mkdir $DIR/imageslog
  fi

  mv $DIR/sketchtoot/*.png $DIR/imageslog
fi


