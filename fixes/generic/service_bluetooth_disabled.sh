#!/bin/bash
# SID: CCE-27081-9

#
# Disable bluetooth for all run levels
#
/sbin/chkconfig --level 0123456 bluetooth off &> /dev/null

#
# Stop bluetooth if currently running
#
/sbin/service bluetooth stop &> /dev/null
