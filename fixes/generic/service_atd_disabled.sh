#!/bin/bash
# SID: CCE-27249-2

#
# Disable atd for all run levels
#
/sbin/chkconfig --level 0123456 atd off &> /dev/null

#
# Stop atd if it's currently running
#
/sbin/service atd stop &> /dev/null
