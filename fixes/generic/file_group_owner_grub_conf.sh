#!/bin/bash
# SID: CCE-27022-3 CCE-26949-8

{
chgrp root /boot/grub/grub.conf
} &>> ${RUNROOT}/${LOGFILE}

