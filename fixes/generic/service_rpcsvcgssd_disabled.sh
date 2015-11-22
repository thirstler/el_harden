#!/bin/bash
# SID: CCE-27122-1

#
# Disable rpcsvcgssd for all run levels
#
/sbin/chkconfig --level 0123456 rpcsvcgssd off &> /dev/null

#
# Stop rpcsvcgssd if currently running
#
/sbin/service rpcsvcgssd stop &> /dev/null

