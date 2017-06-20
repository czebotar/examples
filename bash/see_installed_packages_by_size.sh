#!/bin/bash
# list Redhat packages by size 
rpm -qa --queryformat '%10{size} - %-25{name} \t %{version}\n' | sort -n
