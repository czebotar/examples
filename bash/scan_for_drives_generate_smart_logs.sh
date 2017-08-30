#!/bin/bash
PATH=$PATH:/usr/sbin
SMARTDATADIR=/var/log/smart
smartctl -V >/dev/null 2>&1 || { echo "Error: smartctl missing, install smartmontools!"; exit 1; }
mkdir -p $SMARTDATADIR
while read output; do
  DRIVE=$(echo $output | sed 's/\#.*$//')
  FILE=$(echo $DRIVE | sed 's/-d [a-zA-Z0-9]\+//'| tr -cd [:alnum:] | sed 's/dev//' )
  smartctl --all $DRIVE > $SMARTDATADIR/$FILE.log
done < <(smartctl --scan-open)

# grep -r -i errors $SMARTDATADIR

