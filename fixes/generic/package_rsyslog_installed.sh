#!/bin/bash
# SID: CCE-26809-4

{
yum -q -y install rsyslog
} &>> ${RUNROOT}/run.log

