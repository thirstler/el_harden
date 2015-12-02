#!/bin/bash
# SID: CCE-27270-8

{
find -type f -name .rhosts -exec rm -f '{}' \;
rm -f /etc/hosts.equiv &> /dev/null
} &>> ${LOGFILE}

