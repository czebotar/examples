#!/bin/bash
RPMFILE=your-rpm-here.1.2.3.ELX.rpm
rpm2cpio $RPMFILE | cpio -idmv
