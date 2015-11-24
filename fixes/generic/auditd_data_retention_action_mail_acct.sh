#!/bin/bash
# SID: CCE-27241-9

{
grep ^action_mail_acct /etc/audit/auditd.conf || echo 'action_mail_acct = root' >> /etc/audit/auditd.conf
} &>> ${RUNROOT}/${LOGFILE}
 
