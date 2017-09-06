#!/bin/bash
#
WORKDIR=/tmp
LOGFILE=/var/log/hosts_updater.log
LOCALDOMAIN=localdomain
LINETHRESHOLD=12000
DATE=`date  +%d-%b-%H_%M` 
TIMESTAMP=$(date +%s)
#
cd $WORKDIR
wget http://someonewhocares.org/hosts/zero/hosts --output-file=/dev/null --output-document=hosts_$TIMESTAMP
LINES=$(wc -l hosts_$TIMESTAMP | sed s/hosts_$TIMESTAMP//)
if [ "$LINES" -ge "$LINETHRESHOLD" ]; then
  echo -e "127.0.0.1\t$HOSTNAME.$LOCALDOMAIN $HOSTNAME"  > /tmp/newhost_file
  if [ -f "/etc/hosts.orig" ]; then
    cat /etc/hosts.orig >> /tmp/newhost_file
  fi
  sed s/0.0.0.0/127.0.0.1/g hosts_$TIMESTAMP >> /tmp/newhost_file
  DIFF=$(diff /etc/hosts /tmp/newhost_file) 
  if [ "$DIFF" != "" ] 
  then
    echo "$DATE  ->  Updating Host File" >> $LOGFILE
  cp -f /tmp/newhost_file /etc/hosts 
  chmod 644 /etc/hosts
  chown root.root /etc/hosts  
  service dnsmasq restart
  else
    echo "$DATE  ->  Host File IDENTICAL, not updating" >> $LOGFILE
  fi
  rm /tmp/newhost_file
else
  echo "$DATE  ->  $LINES NOT ENOUGH LINES, download failed?" >> $LOGFILE
fi
rm hosts_$TIMESTAMP 
