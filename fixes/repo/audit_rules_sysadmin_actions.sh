#!/bin/bash
# SID: CCE-26662-7

{
# Include source function library.
. /usr/share/scap-security-guide/functions
# Perform the remediation
fix_audit_watch_rule "/etc/sudoers" "wa" "actions"
} &>> ${LOGFILE}
