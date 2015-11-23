#!/bin/bash
# SID: CCE-27062-9

{
yum -q -y erase rsh-server
} &>> ${RUNROOT}/run.log

