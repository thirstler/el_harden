#!/bin/bash
# SID: CCE-26631-2

{
: ${CRACKLIB_PASSWORD_LCREDIT:=-1}
. functions
add_pam_cracklib_opt "lcredit" "${CRACKLIB_PASSWORD_LCREDIT}" "/etc/pam.d/system-auth"
} &>> ${RUNROOT}/${LOGFILE}

