#!/bin/bash
# SID: CCE-26404-4

{
echo "install squashfs /bin/false" > /etc/modprobe.d/squashfs.conf
} &>> ${LOGFILE}

