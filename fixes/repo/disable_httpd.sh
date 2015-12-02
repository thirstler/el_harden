#!/bin/bash
# SID: CCE-27075-1

# Why is this a 2-fer?
{
chkconfig httpd off
service httpd stop
} &>> ${LOGFILE}

