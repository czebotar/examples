#!/bin/bash
echo `which stress-ng` --cpu $((`cat /proc/cpuinfo | grep processor | wc -l` - 1)) --io 2 -vm 1 --vm-bytes $((`awk '/MemTotal/ {print $2}' /proc/meminfo` - 1000000))
