#!/bin/bash

TARGET=/tmp
BACKUPDIR=~/backup
TIMESTAMP=$(date +%s)
CURRENTDIR=$BACKUPDIR/$TIMESTAMP

export GZIP=-9
mkdir -p $CURRENTDIR 

tar czvf $CURRENTDIR/optdata.tgz $TARGET

