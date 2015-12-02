#!/bin/bash
# SID: CCE-26687-4

{
if rpm -qa | grep -q vsftpd; then
    yum -y erase vsftpd
fi
} &>> ${LOGFILE}

