#!/bin/bash
# SID: CCE-27222-9

{
grep -q '/usr/sbin/aide --check' /etc/crontab || echo "05 4 * * * root /usr/sbin/aide --check" >> /etc/crontab
} &>> ${RUNROOT}/${LOGFILE}

