#!/bin/bash
# SID: 

{
yum -q -y erase ypbind
} &>> ${RUNROOT}/${LOGFILE}

