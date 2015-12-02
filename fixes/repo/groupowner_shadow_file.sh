#!/bin/bash
# SID: CCE-26967-0

{
chgrp root /etc/shadow
} &>> ${LOGFILE}
