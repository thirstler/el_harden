#!/bin/bash

{
# SID: package_aide_installed

yum -y install aide || echo "failed to install AIDE package"
} &>> ${LOGFILE}

