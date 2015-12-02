#!/bin/bash

{
echo "install dccp /bin/false" > /etc/modprobe.d/dccp.conf
} &>> ${LOGFILE}

