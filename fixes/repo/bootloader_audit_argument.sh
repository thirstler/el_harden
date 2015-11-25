#!/bin/bash
# SID: CCE-26785-6

{
/sbin/grubby --update-kernel=ALL --args="audit=1"
} &>> ${RUNROOT}/${LOGFILE}

