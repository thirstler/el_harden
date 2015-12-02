#!/bin/bash
# SID: CCE-26610-6

{
# Include source function library.
. /usr/share/scap-security-guide/functions
# Perform the remediation
fix_audit_watch_rule "/var/run/utmp" "wa" "session"
fix_audit_watch_rule "/var/log/btmp" "wa" "session"
fix_audit_watch_rule "/var/log/wtmp" "wa" "session"
} &>> ${LOGFILE}

