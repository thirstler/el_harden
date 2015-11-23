#!/bin/bash
# SID:

{
yum -q -y erase setroubleshoot
} &>> ${RUNROOT}/run.log
