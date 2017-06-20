#!/bin/bash

echo "/usr/bin/rsync -zavh /your/source/files /your/backup/location"

# -z  compress
# -v  verbose 
# -h  human readable
# -a  archive mode; equals -rlptgoD (no -H,-A,-X)

# -r recursive 
# -l copy symlinks 
# -p keep permissions 
# -t keep timestamps 
# -g keep groups 
# -o keep owner 
# -D recreate block devices (must be root)
