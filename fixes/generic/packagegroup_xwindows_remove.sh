#!/bin/bash
# SID:

{
yum groupremove "X Window System"
} &>> ${RUNROOT}/${LOGFILE}

