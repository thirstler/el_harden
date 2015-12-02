#!/bin/bash
# SID: CCE-26486-1

{
# Include source function library.
. functions

add_mp_opt "/dev/shm" "nosuid"
} &>> ${LOGFILE}

