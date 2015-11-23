#!/bin/bash
# SID: CCE-27087-6

{
chkconfig avahi-daemon off
} &>> ${RUNROOT}/run.log
