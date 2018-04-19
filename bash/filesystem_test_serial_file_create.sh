#!/bin/bash
testdir=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 4 | head -n 1)
mkdir $testdir
cd $testdir
for number in {1..1000}; do
filename=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 24 | head -n 1)
echo $filename $filename > $filename
done
