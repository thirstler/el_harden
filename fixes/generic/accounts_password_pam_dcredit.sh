#!/bin/bash
# SID: CCE-26374-9

{
: ${CRACKLIB_PASSWORD_DCREDIT:=-1}
. functions
add_pam_cracklib_opt "dcredit" "${CRACKLIB_PASSWORD_DCREDIT}" "/etc/pam.d/system-auth"
} &>> ${RUNROOT}/${LOGFILE}

