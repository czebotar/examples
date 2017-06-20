#!/bin/bash
echo list devices:
echo wodim --devices
echo
echo Get drive capabilities
echo "wodim -prcap dev=/dev/sr1"
echo
echo burn iso:
echo  "wodim -eject -tao speed=0 dev=/dev/sr1 -v -data /path/to/your.iso"
