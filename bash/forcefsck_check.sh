#!/bin/bash
touch /forcefsck
if [ -f /forcefsck ]
 then
 logger "forcefsck touched!"
fi

