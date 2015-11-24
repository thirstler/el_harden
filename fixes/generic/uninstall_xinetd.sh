#!/bin/bash
# SID: CCE-27005-8

{
if rpm -qa | grep -q xinetd; then
	yum -y remove xinetd
fi
} &>> ${RUNROOT}/${LOGFILE}

