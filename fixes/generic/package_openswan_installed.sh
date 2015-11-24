#!/bin/bash
# SID: CCE-27626-1

{

yum -q -y install openswan

} &>> ${RUNROOT}/${LOGFILE}

