#!/bin/bash
testdir=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 4 | head -n 1)
mkdir $testdir
cd $testdir
for number in {1..100}; do
filename=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 24 | head -n 1); echo $filename $filename > $filename &
filename2=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 24 | head -n 1); echo $filename2 $filename2 > $filename2 &
filename3=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 24 | head -n 1); echo $filename3 $filename3 > $filename3 &
filename4=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 24 | head -n 1); echo $filename4 $filename4 > $filename4 &
filename5=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 24 | head -n 1); echo $filename5 $filename5 > $filename5 &
filename6=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 24 | head -n 1); echo $filename6 $filename6 > $filename6 &
done
