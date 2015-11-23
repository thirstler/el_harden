#!/bin/bash
# SID: CCE-26870-6

{
#
# Disable rpcidmapd for all run levels
#
/sbin/chkconfig --level 0123456 rpcidmapd off

#
# Stop rpcidmapd if currently running
#
/sbin/service rpcidmapd stop

} &>> ${RUNROOT}/run.log

