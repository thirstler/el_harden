#!/bin/bash
# SID: CCE-26951-4

{
chmod 0000 /etc/gshadow
} &>> ${RUNROOT}/${LOGFILE}

