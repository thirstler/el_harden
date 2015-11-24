#!/bin/bash
# SID: CCE-26953-0

{
chown root /etc/passwd
} &>> ${RUNROOT}/${LOGFILE}

