#!/bin/bash
# SID: CCE-26858-1

{
yum -y erase openldap-servers
} &>> ${RUNROOT}/run.log
