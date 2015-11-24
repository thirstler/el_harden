#!/bin/bash
# SID:

{
. functions
add_pam_cracklib_opt "maxrepeat" "3" "/etc/pam.d/system-auth"
} &>> ${RUNROOT}/${LOGFILE}

