#!/bin/bash
# SID:

{
sudo -q -y yum groupremove "X Window System"
} &>> ${RUNROOT}/run.log

