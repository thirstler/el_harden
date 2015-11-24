#!/bin/bash
# SID:

{
yum -q -y erase setroubleshoot
} &>> ${RUNROOT}/${LOGFILE}
