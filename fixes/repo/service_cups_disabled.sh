#!/bin/bash
# SID: CCE-26899-5

{
#
# Disable cups for all run levels
#
/sbin/chkconfig --level 0123456 cups off

#
# Stop cups if currently running
#
/sbin/service cups stop

} &>> ${LOGFILE}

