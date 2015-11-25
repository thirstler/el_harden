#!/bin/bash
# SID: CCE-26940-7

{
yum -q -y install screen
} &>> ${RUNROOT}/${LOGFILE}
