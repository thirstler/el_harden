#!/bin/bash
# SID: CCE-26856-5

{
chgrp root /etc/passwd
} &>> ${RUNROOT}/run.log

