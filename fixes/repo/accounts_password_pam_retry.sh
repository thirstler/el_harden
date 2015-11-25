#!/bin/bash
# SID: CCE-27123-9 CCE-26374-9 CCE-26601-5 CCE-26409-3 CCE-26631-2 CCE-26615-5

{

: ${CRACKLIB_PASSWORD_RETRIES:="3"}
: ${CRACKLIB_PASSWORD_DCREDIT:="-1"}
: ${CRACKLIB_PASSWORD_UCREDIT:="-1"}
: ${CRACKLIB_PASSWORD_OCREDIT:="-1"}
: ${CRACKLIB_PASSWORD_LCREDIT:="-1"}
: ${CRACKLIB_PASSWORD_DIFOK:="3"}
: ${CRACKLIB_PASSWORD_MINLEN:="12"}

sed --follow-symlinks -Ei "/password\s+.+\s+pam_cracklib.so/d" /etc/pam.d/system-auth
sed --follow-symlinks -Ei "s/(password\s+sufficient\s+pam_unix.so .*)/password    required      pam_cracklib.so try_first_pass retry=${CRACKLIB_PASSWORD_RETRIES} minlen=${CRACKLIB_PASSWORD_MINLEN} dcredit=${CRACKLIB_PASSWORD_DCREDIT} ucredit=${CRACKLIB_PASSWORD_UCREDIT} ocredit=${CRACKLIB_PASSWORD_OCREDIT} lcredit=${CRACKLIB_PASSWORD_LCREDIT} difok=${CRACKLIB_PASSWORD_DIFOK}\n\1/" /etc/pam.d/system-auth

} &>> ${RUNROOT}/${LOGFILE}

