#!/bin/bash

cd /tmp
MYARRAY=($(ls -d */))
for file in "${MYARRAY[@]}"
do
:
echo $file
done

