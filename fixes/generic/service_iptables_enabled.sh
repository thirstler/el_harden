#!/bin/bash
# SID: CCE-27018-1

{
##
# Enable iptables for all run levels
#
/sbin/chkconfig --level 0123456 iptables on

#
# Start iptables if not currently running
#
/sbin/service iptables start

} &>> ${RUNROOT}/${LOGFILE}

