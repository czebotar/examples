#!/bin/bash
echo ""
echo "Change only diretories to 755:"
echo ""
echo '        find /path/to/base/dir -type d -exec chmod 755 {} +'
echo ""
echo ""
echo "Change only files to 644::"
echo ""
echo '        find /path/to/base/dir -type f -exec chmod 644 {} +'
