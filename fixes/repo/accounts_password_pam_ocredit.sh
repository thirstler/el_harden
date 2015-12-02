#!/bin/bash
# SID: CCE-26409-3

{
: ${CRACKLIB_PASSWORD_OCREDIT:=-1}
. functions
add_pam_cracklib_opt "ocredit" "${CRACKLIB_PASSWORD_OCREDIT}" "/etc/pam.d/system-auth"
} &>> ${LOGFILE}

