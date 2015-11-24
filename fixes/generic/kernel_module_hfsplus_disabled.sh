#!/bin/bash
# SID: CCE-26361-6

{
echo "install hfsplus /bin/false" > /etc/modprobe.d/hfsplus.conf
} &>> ${RUNROOT}/${LOGFILE}

