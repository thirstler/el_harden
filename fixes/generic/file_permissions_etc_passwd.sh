#!/bin/bash
# SID: CCE-26868-0

{
chmod 0644 /etc/passwd
} &>> ${RUNROOT}/${LOGFILE}

