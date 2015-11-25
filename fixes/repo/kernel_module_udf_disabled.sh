#!/bin/bash
# SID: CCE-26677-5

{
echo "install udf /bin/false" > /etc/modprobe.d/udf.conf
} &>> ${RUNROOT}/${LOGFILE}

