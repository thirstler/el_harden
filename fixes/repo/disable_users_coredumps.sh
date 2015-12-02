#!/bin/bash
# SID: CCE-27033-0

{
: ${LIMITS_CORE:=0}

##
# Just zap the entry if it exists and readd

sed -Ei "/\*\s+hard\s+core\s+/d" /etc/security/limits.conf
echo "*                hard    core            ${LIMITS_CORE}" >> /etc/security/limits.conf

} &>> ${LOGFILE}


