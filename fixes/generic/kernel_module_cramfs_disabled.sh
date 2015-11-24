#!/bin/bash

{
echo "install cramfs /bin/false" > /etc/modprobe.d/cramfs.conf
} &>> ${RUNROOT}/${LOGFILE}

