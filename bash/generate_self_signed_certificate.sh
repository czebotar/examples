#!/bin/bash
openssl req -new -newkey rsa:4096 -days 3650 -nodes -x509 \
-subj "/C=US/ST=WA/L=Richland/O=Org/OU=Team/CN=example.com/emailAddress=me@example.com" \
-keyout /tmp/example.com.key \
-out /tmp/example.com.cert
openssl x509 -dates -subject -noout -in /tmp/example.com.cert
