#!/bin/bash
# SID: CCE-27093-4

#
# Enable ntpd for all run levels
#
/sbin/chkconfig --level 0123456 ntpd on &> /dev/null

#
# Start ntpd if not currently running
#
/sbin/service ntpd start &> /dev/null
