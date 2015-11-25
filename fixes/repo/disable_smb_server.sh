#!/bin/bash
# SID: CCE-27143-7

{
chkconfig smb off
} &>> ${RUNROOT}/${LOGFILE}

