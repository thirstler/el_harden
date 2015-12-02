#!/bin/bash
# SID: CCE-26696-5

{
echo "install tipc /bin/false" > /etc/modprobe.d/tipc.conf
} &>> ${LOGFILE}

