#!/bin/bash
# SID: CCE-26332-7

{
if rpm -qa | grep -q net-snmp; then
	yum -q -y remove net-snmp &> /dev/null
fi
} &>> ${RUNROOT}/${LOGFILE}

