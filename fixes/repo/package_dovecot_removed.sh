#!/bin/bash
# SID: CCE-27039-7

{
if rpm -qa | grep -q dovecot; then
    yum -y remove dovecot
fi
} &>> ${LOGFILE}

