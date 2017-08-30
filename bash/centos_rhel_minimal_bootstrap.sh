#!/bin/bash
#
# CENTOS / RHEL Minimal install bootstrap script.
#
# This script will make a DISABLED local repo from a local install source (usb or cdrom) in order to bootstrap a "minimal" install
# This will allow yum to resolve dependencies installing ssh and git in an minimal environment without access to external repos.
#
# If the USB drive of sufficient smallness is not found, look for optical drives, if they are not found, the script exits.
#
# define the max size of your boot USB, make new entry if necessary
# Will try to mount a device SMALLER than the USBSIZE, which is your USB drive.
# If the device mounts and the README exists, copy packages over, install packages, create a local repo.

export GIG8=8500000000
export GIG16=16500000000
export GIG32=32500000000
export GIG64=64500000000

# Default is a 16 gig Drive.  
export USBSIZE=$GIG16

for letter in {a..z}
do
  if [ -b /dev/sd$letter ]
  then
    if [ "$USBSIZE" -gt "$(blockdev --getsize64 /dev/sd$letter)" ]
    then
      echo Looks like our USB drive is /dev/sd$letter
      MOUNTLOCATION=/dev/sd"$letter"1
    fi
  fi
done

if [ -z ${MOUNTLOCATION+x} ] 
then 
  # drive not found, lets look for a cdrom
  blkid /dev/sr0
  if [ $? -eq 0 ]
  then
    MOUNTLOCATION=/dev/sr0
    echo Looks like an optical disk is inserted in /dev/sr0
  else
    blkid /dev/cdrom
    if [ $? -eq 0 ]
    then
      MOUNTLOCATION=/dev/cdrom
      echo Looks like an optical disk is inserted in /dev/cdrom
    fi
  fi
fi

if [ -z ${MOUNTLOCATION+x} ] 
then 
  echo "Local RHEL/CENTOS USB or Optical Disc not found"
  break
fi

mkdir /mnt/rpms
mount $MOUNTLOCATION /mnt/rpms

if [ -f /mnt/rpms/README ]
then
cat << EOF > /etc/yum.repos.d/install.repo
[local]
name=Install Packages
baseurl=file:///srv/install_repo
enabled=0
gpgcheck=0
EOF
  echo "Copying Packages... Please wait"
  cp -a /mnt/rpms/Packages /srv
  mv /srv/Packages /srv/install_repo
  chown -R root.root /srv/install_repo
  cd /srv/install_repo
  yum -y install deltarpm*
  yum -y install python-deltarpm*
  yum -y install createrepo*
  createrepo /srv/install_repo
  chmod -R o-w+r /srv/install_repo
  yum clean all
  yum --enablerepo local install -y openssh-clients git
  sed -i --follow-symlinks 's/^SELINUX=.*/SELINUX=disabled/g' /etc/sysconfig/selinux
  setenforce 0
else
  echo -e "\n \n \n RHEL/CENTOS packages not found.  DVD or USB disk inserted?\n \n \\n \n \n"
fi

umount /mnt/rpms
rmdir /mnt/rpms
