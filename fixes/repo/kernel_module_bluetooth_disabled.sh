#!/bin/bash
# SID: CCE-26763-3

{
echo "install bluetooth /bin/false" > /etc/modprobe.d/bluetooth.conf
} &>> ${LOGFILE}

