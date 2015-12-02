#!/bin/bash
# SID: CCE-26906-8 CCE-26332-7

{
chkconfig snmpd off
if rpm -qa | grep -q net-snmp; then
    yum -y remove net-snmp
fi
} &>> ${LOGFILE}

