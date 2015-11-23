#!/bin/bash
# SID: 

{
if rpm -qa | grep -q tftp-server; then
    yum -y erase tftp-server
fi
} &>> ${RUNROOT}/run.log

