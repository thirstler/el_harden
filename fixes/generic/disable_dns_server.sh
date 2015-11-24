#!/bin/bash
# SID: CCE-26873-0

# Why is this a 2-fer?
{
service named stop
chkconfig named off
} &>> ${RUNROOT}/${LOGFILE}

