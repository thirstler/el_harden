#!/bin/bash
# SID: CCE-26601-5

{
: ${CRACKLIB_PASSWORD_UCREDIT:=-1}
. functions
add_pam_cracklib_opt "ucredit" "${CRACKLIB_PASSWORD_UCREDIT}" "/etc/pam.d/system-auth"
} &>> ${LOGFILE}

