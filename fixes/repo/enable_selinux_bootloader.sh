#!/bin/bash
# SID: CCE-26956-3

{
sed --follow-symlinks -i "s/selinux=0//gI" /etc/grub.conf
sed --follow-symlinks -i "s/enforcing=0//gI" /etc/grub.conf
} &>> ${LOGFILE}

