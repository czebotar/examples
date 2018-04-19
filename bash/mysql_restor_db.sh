#!/bin/bash
# Backup a database  
#
mysqldump -h hostname -u user --password=password databasename > filename 
# 
# Restore a database
#
#mysql -h hostname -u user --password=password databasename < filename
