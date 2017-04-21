#!/bin/bash
# Make a file with an alpha-numeric randomized name, 12 characters long.
filename=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 12 | head -n 1).tmp
echo test data > /dev/shm/$filename
echo your random file is /dev/shm/$filename  

