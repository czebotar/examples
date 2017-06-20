#!/bin/bash

# AWK example 
cat /etc/passwd | awk 'BEGIN { FS = ":" } ; {print $1}'

#SED Example
sed -i 's/^PREFIX=.*/PREFIX='$PERFEXPERT_INSTALLPATH'\/test/' /tmp/config.mk
