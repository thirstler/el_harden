#!/bin/bash
# SID: CCE-27074-4

{
chkconfig dhcpd off
} &>> ${LOGFILE}
