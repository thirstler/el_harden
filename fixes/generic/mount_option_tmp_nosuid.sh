#!/bin/bash
# SID: CCE-26762-5

{
# Include source function library.
. functions

add_mp_opt "/tmp" "nosuid"
} &>> ${RUNROOT}/${LOGFILE}

