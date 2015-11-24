#!/bin/bash
# SID: CCE-26615-5

{
: ${CRACKLIB_PASSWORD_DIFOK:=3}
. functions
add_pam_cracklib_opt "difok" "${CRACKLIB_PASSWORD_DIFOK}" "/etc/pam.d/system-auth"
} &>> ${RUNROOT}/${LOGFILE}

