#!/bin/bash

#
# Disable autofs for all run levels
#
/sbin/chkconfig --level 0123456 autofs off &> /dev/null

#
# Stop autofs if currently running
#
/sbin/service autofs stop &> /dev/null
