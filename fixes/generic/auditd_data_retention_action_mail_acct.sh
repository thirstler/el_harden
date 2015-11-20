#!/bin/bash
# SID: CCE-27241-9

grep ^action_mail_acct /etc/audit/auditd.conf &> /dev/null || echo 'action_mail_acct = root' >> /etc/audit/auditd.conf 
