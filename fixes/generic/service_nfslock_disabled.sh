#!/bin/bash
# SID: CCE-27104-9

#
# Disable nfslock for all run levels
#
/sbin/chkconfig --level 0123456 nfslock off &> /dev/null

#
# Stop nfslock if currently running
#
/sbin/service nfslock stop &> /dev/null
