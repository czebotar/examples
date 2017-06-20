#!/bin/bash
cat ~/.ssh/id_rsa.pub | ssh root@192.168.1.1 "mkdir -p ~/.ssh && cat >>  ~/.ssh/authorized_keys"
