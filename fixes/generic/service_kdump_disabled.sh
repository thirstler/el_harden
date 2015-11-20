#!/bin/bash
# SID: CCE-26850-8

#
# Disable kdump for all run levels
#
/sbin/chkconfig --level 0123456 kdump off &> /dev/null

#
# Stop kdump if currently running
#
/sbin/service kdump stop &> /dev/null
