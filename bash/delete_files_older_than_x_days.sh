#!/bin/bash
echo "find /path/to/files* -mtime +5 -exec rm {} \;"

#BACKUPDIR=/tmp/backup
#clean up files older than 30 days, however leave files created on mondays for one year.
#find $BACKUPDIR -type f -mtime +30 -exec sh -c 'test $(date +%a -r "$1") = Mon || echo rm "$1"' -- {} \;
#find $BACKUPDIR -type f -mtime +365 -exec rm {} \;

