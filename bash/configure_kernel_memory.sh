#!/bin/bash
#set -x

# This script configures kernel memory parameters.
# (this is arbitrary and project based, change to taste)

# Determine sysctl file
FILE=/tmp/sysctl.conf.example
if [ -f /etc/sysctl.conf ]
then
  FILE=/etc/sysctl.conf
fi
if [ -f /etc/sysctl.d/99-sysctl.conf ]
then
  FILE=/etc/sysctl.d/99-sysctl.conf
fi
echo "Using $FILE"

# Get Physical memory
MEMORY_KB=`grep "MemTotal" /proc/meminfo | awk 'BEGIN { FS = " " } ; {print $2}'`
MEMORY_B=`expr $MEMORY_KB \* 1024`
MEMORY_MB=`expr $MEMORY_KB / 1024`
MEMORY_GB=`expr $MEMORY_MB / 1024`

# Calculate settings
KERN_shmmni=`expr 256 \* $MEMORY_GB`
KERN_msgmni=`expr 1024 \* $MEMORY_GB`
KERN_shmmax=$MEMORY_B
KERN_shmall=`expr 2 \* $MEMORY_B / 4096`
KERN_sem_Suffx=`expr 256 \* $MEMORY_GB`
KERN_sem="512 256000 32 $KERN_sem_Suffx"
KERN_msgmax="65536"
KERN_msgmnb="65536"

# Apply Settings to sysctl file
sed -i "s/^kernel.shmmni.*/kernel.shmmni=$KERN_shmmni/" $FILE && grep -q '^kernel.shmmni' $FILE || echo "kernel.shmmni=$KERN_shmmni" >> $FILE
sed -i "s/^kernel.msgmni.*/kernel.msgmni=$KERN_msgmni/" $FILE && grep -q '^kernel.msgmni' $FILE || echo "kernel.msgmni=$KERN_msgmni" >> $FILE
sed -i "s/^kernel.shmmax.*/kernel.shmmax=$KERN_shmmax/" $FILE && grep -q '^kernel.shmmax' $FILE || echo "kernel.shmmax=$KERN_shmmax" >> $FILE
sed -i "s/^kernel.shmall.*/kernel.shmall=$KERN_shmall/" $FILE && grep -q '^kernel.shmall' $FILE || echo "kernel.shmall=$KERN_shmall" >> $FILE
sed -i "s/^kernel.sem.*/kernel.sem=$KERN_sem/" $FILE && grep -q '^kernel.sem' $FILE || echo "kernel.sem=$KERN_sem" >> $FILE
sed -i "s/^kernel.msgmax.*/kernel.msgmax=$KERN_msgmax/" $FILE && grep -q '^kernel.msgmax' $FILE || echo "kernel.msgmax=$KERN_msgmax" >> $FILE
sed -i "s/^kernel.msgmnb.*/kernel.msgmnb=$KERN_msgmnb/" $FILE && grep -q '^kernel.msgmnb' $FILE || echo "kernel.msgmnb=$KERN_msgmnb" >> $FILE
sed -i "s/^kernel.randomize_va_space=.*/kernel.randomize_va_space=0/" $FILE && grep -q '^kernel.randomize_va_space' $FILE || echo "kernel.randomize_va_space=0" >> $FILE
sed -i "s/^vm.overcommit_memory=.*/vm.overcommit_memory=0/" $FILE && grep -q '^vm.overcommit_memory' $FILE || echo "vm.overcommit_memory=0" >> $FILE
sed -i "s/^vm.swappiness=.*/vm.swappiness=0/" $FILE && grep -q '^vm.swappiness' $FILE || echo "vm.swappiness=0" >> $FILE

