#!/bin/bash

# This script will make a transparent logo using imagemagick 
# It will proceed to make examples using the known system fonts
# Use the test html page to tweak the colors and font 
# BACKGROUNDCOLOR is not part of the logo, but of the host page 

#Logo Text
export LOGOTEXT="My Organization Name"

#font
export LOGOFONT="Times-Roman"
export POINTSIZE="50"

#colors
export FONTCOLOR="#1C140D"
export SHADOWCOLOR="#E97F02"
export BACKGROUNDCOLOR="#EEEEEE"

#files
export LOGOFILE="my_logo.png"
export TESTHTML="test.html"
export WORKDIR="/tmp/logo"
mkdir -p $WORKDIR

convert -size 800x120 xc:white -font $LOGOFONT -transparent white -pointsize $POINTSIZE -fill "$SHADOWCOLOR" -annotate +20+80 "$LOGOTEXT" -fill "$FONTCOLOR" -annotate +22+82 "$LOGOTEXT" -trim +repage $WORKDIR/$LOGOFILE
echo " <head> <meta http-equiv=\"refresh\" content=\"3\"> </head> <body style=\"background-color:$BACKGROUNDCOLOR;\"> <img src =$WORKDIR/$LOGOFILE></body><div style=\"color:$FONTCOLOR\"><br><br>Available Fonts:<br>"  > $WORKDIR/$TESTHTML
for font in $( convert -list font | grep "Font:" | sed -e 's/Font://' ) 
do 
  convert -size 800x120 xc:white -font $font -transparent white -pointsize 20 -fill "$SHADOWCOLOR" -annotate +20+80 $font -fill "$FONTCOLOR" -annotate +21+81 $font -trim +repage $WORKDIR/$font.png 2> /dev/null 
  echo "<img src=$WORKDIR/$font.png><br>" >> $WORKDIR/$TESTHTML
done
echo "Load file:////$WORKDIR/$TESTHTML in your browser"
