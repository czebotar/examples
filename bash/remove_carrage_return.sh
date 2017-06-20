#!/bin/bash
# Example of removing carriage return
sudo dmidecode -s bios-version > /dev/null
echo "BIOS Version:" | tr -d '\n'
sudo dmidecode -s bios-version
