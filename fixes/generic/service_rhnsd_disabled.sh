#!/bin/bash
# SID: CCE-26846-6

{
#
# Disable rhnsd for all run levels
#
/sbin/chkconfig --level 0123456 rhnsd off

#
# Stop rhnsd if currently running
#
/sbin/service rhnsd stop

} &>> ${RUNROOT}/run.log

