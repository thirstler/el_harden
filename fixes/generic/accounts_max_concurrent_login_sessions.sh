#!/bin/bash
# SID: CCE-27033-0

{
: ${LIMITS_MAX_LOGINS:=10}

##
# Just zap the entry if it exists and readd

sed -Ei "/\*\s+hard\s+maxlogins\s+/d" /etc/security/limits.conf
echo "*                hard    maxlogins       ${LIMITS_MAX_LOGINS}" >> /etc/security/limits.conf

} &>> ${RUNROOT}/${LOGFILE}
