#!/bin/bash
# SID: CCE-26844-1

{
: ${PAM_FAILLOCK_DENY:="3"}
AUTH_FILES[0]="/etc/pam.d/system-auth"
AUTH_FILES[1]="/etc/pam.d/password-auth"

for pamFile in "${AUTH_FILES[@]}"
do
    ##
    # Just clear faillock configuration and add it again
    sed -i --follow-symlink "/pam_faillock.so/d"  $pamFile
    sed -Ei --follow-symlink "s/^(auth.*sufficient.*pam_unix.so.*)/auth        required      pam_faillock.so preauth silent deny=${PAM_FAILLOCK_DENY} unlock_time=604800 fail_interval=900\n\1/" $pamFile
    sed -i --follow-symlink "/^auth.*sufficient.*pam_unix.so.*/a auth        [default=die] pam_faillock.so authfail deny=${PAM_FAILLOCK_DENY} unlock_time=604800 fail_interval=900" $pamFile
    sed -i --follow-symlink "/^account.*required.*pam_unix.so/i account     required      pam_faillock.so" $pamFile
done

} &>> ${RUNROOT}/${LOGFILE}

