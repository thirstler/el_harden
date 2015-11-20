#!/bin/bash
# SID: CCE-27058-7

#
# Enable auditd for all run levels
#
/sbin/chkconfig --level 0123456 auditd on &> /dev/null

#
# Start auditd if not currently running
#
/sbin/service auditd start &> /dev/null
