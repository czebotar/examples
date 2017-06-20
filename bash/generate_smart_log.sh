#!/bin/bash
smartctl -V >/dev/null 2>&1 || { echo "Error : smartctl missing, install smartmontools!" > /var/log/smartctl_sd$a.log; exit 1; }

for a in {a..z}; do
if [ -b /dev/sd$a ]
then
  smartctl --all /dev/sd$a > /var/log/smartctl_sd$a.log
fi
done

