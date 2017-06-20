#!/bin/bash
for header in `cat *.log | grep checking | grep "\.\.\. no" | grep presence | sort -u |  awk '{ print $2; }'`; do yum provides */$header | grep " : " | grep -v "Repo        : "| grep -v "Filename    : "| grep -v "\.i686"; done
