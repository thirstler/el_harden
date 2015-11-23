#!/bin/bash
# SID: CCE-27055-3

{
#
# Disable tftp for all run levels
#
/sbin/chkconfig --level 0123456 tftp off

#
# Stop tftp if currently running
#
/sbin/service tftp stop

} &>> ${RUNROOT}/run.log

