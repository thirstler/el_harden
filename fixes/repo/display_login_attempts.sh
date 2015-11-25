#!/bin/bash
# SID:

{
if ! grep -qE "session\s+required\s+pam_lastlog.so\sshowfailed$" /etc/pam.d/system-auth; then
    sed -i --follow-symlinks '/pam_limits.so/a session\t    required\t  pam_lastlog.so showfailed' /etc/pam.d/system-auth
fi
} &>> ${RUNROOT}/${LOGFILE}
