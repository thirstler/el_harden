#!/bin/bash
# SID: CCE-26741-9

{
: ${PAM_UNIX_REMEMBER:="24"}
var_password_pam_unix_remember="24"
if grep -q "remember=" /etc/pam.d/system-auth; then   
    sed -i --follow-symlink "s/\(remember *= *\).*/\1${PAM_UNIX_REMEMBER}/" /etc/pam.d/system-auth
else
    sed -i --follow-symlink "/^password[[:space:]]\+sufficient[[:space:]]\+pam_unix.so/ s/$/ remember=${PAM_UNIX_REMEMBER}/" /etc/pam.d/system-auth
fi

} &>> ${RUNROOT}/${LOGFILE}

