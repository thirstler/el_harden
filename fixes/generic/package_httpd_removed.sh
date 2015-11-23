#!/bin/bash
# SID: CCE-27133-8

{
if rpm -qa | grep -q httpd; then
    yum -y remove httpd
fi
} &>> ${RUNROOT}/run.log

