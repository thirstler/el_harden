#!/bin/bash
# SID: CCE-27120-5

{
if rpm -qa | grep -q dhcp; then
    yum -y erase dhcp
fi
} &>> ${LOGFILE}
