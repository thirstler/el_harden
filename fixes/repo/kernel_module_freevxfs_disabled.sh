#!/bin/bash
# SID: CCE-26544-7

{
echo "install freevxfs /bin/false" > /etc/modprobe.d/freevxfs.conf
} &>> ${LOGFILE}

