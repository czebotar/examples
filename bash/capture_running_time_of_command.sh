#!/bin/bash
START=$(date +%s.%N)
sleep 30
END=$(date +%s.%N)
DIFF=$(echo "$END - $START" | bc)
DIFFINT=${DIFF%.*}
echo $DIFFINT
if [ $DIFFINT -lt "5" ]
then
echo Command was faster than 5 seconds at $DIFF
else
echo Command was SLOWER than 5 seconds at $DIFF
fi
