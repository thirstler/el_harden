#!/bin/bash
# SID: CCE-27222-9

{
: ${AID_REPORT_ADDRESS:=""}

if [[ "${AID_REPORT_ADDRESS}" == "" ]]; then
    CRON_OUTPUT='&> /dev/null'
else 
    CRON_OUTPUT='| mail -s "AID Report (${hostname}) ${AID_REPORT_ADDRESS} 2> /dev/null"' 
fi

grep -q '/usr/sbin/aide --check' /etc/crontab || echo "05 4 * * * root /usr/sbin/aide --check ${CRON_OUTPUT}" >> /etc/crontab
} &>> ${LOGFILE}

