#!/bin/bash
# fix a broken yum database

echo yum clean all
echo rm -f /var/lib/rpm/__db*
echo rpm --rebuilddb
echo yum update
