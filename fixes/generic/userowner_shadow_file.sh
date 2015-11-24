#!/bin/bash
# SID: CCE-26947-2

{
chown root /etc/shadow
} &>> ${RUNROOT}/${LOGFILE}

