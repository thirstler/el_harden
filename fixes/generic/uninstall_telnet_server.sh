#!/bin/bash
# SID: CCE-27073-6

{
if rpm -qa | grep -q telnet-server; then
	yum -y erase telnet-server
fi
} &>> ${RUNROOT}/${LOGFILE}

