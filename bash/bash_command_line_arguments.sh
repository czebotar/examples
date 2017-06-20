#!/bin/bash

die () {
    echo >&2 "$@"
    exit 1
}

[ "$#" -eq 3 ] || die "3 arguments required, $# provided"
echo "\$1 is the first commadn line argument, set at $1"
echo "\$2 is the first commadn line argument, set at $2"
echo "\$3 is the first commadn line argument, set at $3"

