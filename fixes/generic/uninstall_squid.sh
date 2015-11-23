#!/bin/bash
# SID: CCE-26977-9

{
if rpm -qa | grep -q squid; then
    yum erase squid
fi
} &>> ${RUNROOT}/run.log

