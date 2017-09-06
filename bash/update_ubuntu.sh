#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PATH"
apt-get -y autoremove
apt-get -y update
apt-get -y upgrade
apt-get -y dist-upgrade
#INSTVER="$(dpkg -l | grep linux-image | grep -v linux-image-extra | sort -r | awk 'BEGIN { FS = " " } ; {print $3; exit;}')"
INSTVER="$(dpkg -l | grep linux-image | grep -v linux-image-extra | awk 'BEGIN { FS = " " } ; {print $3;}' | sort -rn | head -1)"
RUNVER="$(cat /proc/version_signature | awk 'BEGIN { FS = " " } ; {print $2}')"
RUNVER="${RUNVER%-generic}"
if [ "$INSTVER" != "$RUNVER" ];then
  logger "System running Kernel ${RUNVER} & version ${INSTVER} is installed.  REBOOTING!"
 echo  /sbin/reboot
fi

