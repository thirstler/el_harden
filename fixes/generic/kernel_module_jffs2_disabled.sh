#!/bin/bash
# SID: CCE-26670-0

{
echo "install jffs2 /bin/false" > /etc/modprobe.d/jffs2.conf
} &>> ${RUNROOT}/run.log

