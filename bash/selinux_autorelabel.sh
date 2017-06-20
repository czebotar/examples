#!/bin/bash
# Set SELinux auto relabel on next boot, requires root or sudo
touch /.autorelabel
if [ -f /.autorelabel ]
 then
 logger "SELinux auto-relable set"
fi
