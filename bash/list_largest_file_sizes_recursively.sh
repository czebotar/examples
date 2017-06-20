#!/bin/bash
cd /tmp
# Redirect the stderr of the find command to /dev/null, to ignore files without permissions
find . -printf '%s %p\n' 2>/dev/null | sort -nr | head
