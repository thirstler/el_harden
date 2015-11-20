#!/bin/bash
# SID: CCE-26864-9

#
# Disable rpcgssd for all run levels
#
/sbin/chkconfig --level 0123456 rpcgssd off &> /dev/null

#
# Stop rpcgssd if currently running
#
/sbin/service rpcgssd stop &> /dev/null
