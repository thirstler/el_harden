#!/bin/bash
# SID:

{
echo "install usb-storage /bin/false" > /etc/modprobe.d/usb-storage.conf
} &>> ${RUNROOT}/${LOGFILE}
