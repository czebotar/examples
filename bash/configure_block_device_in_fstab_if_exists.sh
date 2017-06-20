#!/bin/bash
# configure and mount a block device in fstab, only once, and only if the device exists.

if [ -b /dev/vdd ]
then
  echo "Block Device /dev/vdd found, configuring..."
  UUID="$(blkid /dev/vdd | awk '{ print $2; }')"
  if grep --quiet $UUID /etc/fstab;
  then
    echo "UUID already exists in fstab..."
  else
    echo "$UUID 	/srv/data	auto	defaults	1 2" >> /etc/fstab
    mkdir -p /srv/data
    mount /srv/data
  fi
fi
