#!/bin/bash
# SID: CCE-26800-3

{
echo "install hfs /bin/false" > /etc/modprobe.d/hfs.conf
} &>> ${RUNROOT}/run.log

