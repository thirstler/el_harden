#!/bin/bash
# SID: 

{
yum -q -y erase ypbind
} &>> ${RUNROOT}/run.log

