#!/bin/bash
grep -q 'blacklist iTCO_wdt' /etc/modprobe.d/blacklist.conf || echo "blacklist iTCO_wdt" >> /etc/modprobe.d/blacklist.conf
cat /etc/modprobe.d/blacklist.conf
