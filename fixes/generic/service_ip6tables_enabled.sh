#!/bin/bash

#
# Enable ip6tables for all run levels
#
/sbin/chkconfig --level 0123456 ip6tables on &> /dev/null

#
# Start ip6tables if not currently running
#
/sbin/service ip6tables start &> /dev/null
