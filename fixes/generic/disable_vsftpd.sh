#!/bin/bash
# SID: CCE-26948-0

{
if service vsftpd status; then
    service vsftpd stop
fi
} &>> ${RUNROOT}/${LOGFILE}

