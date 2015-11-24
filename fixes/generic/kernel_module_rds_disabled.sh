#!/bin/bash
# SID: CCE-26239-4

{
echo "install rds /bin/false" > /etc/modprobe.d/rds.conf
} &>> ${RUNROOT}/${LOGFILE}

