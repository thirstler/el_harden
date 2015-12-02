#!/bin/bash
# SID: CCE-26691-6

{
# Include source function library.
. /usr/share/scap-security-guide/functions
# Perform the remediation
fix_audit_watch_rule "/var/log/faillog" "wa" "logins"
fix_audit_watch_rule "/var/log/lastlog " "wa" "logins"
} &>> ${LOGFILE}

