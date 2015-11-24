#!/bin/bash
# SID: CCE-27033-0

{
grep -q -E "^\*\s+hard\s+core\s+0$" /etc/security/limits.conf \
|| echo '*                hard    core            0' >> /etc/security/limits.conf
} &>> ${RUNROOT}/${LOGFILE}

