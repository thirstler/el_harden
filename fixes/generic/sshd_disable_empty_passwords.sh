#!/bin/bash
# SID: CCE-26887-0

{
grep -q ^PermitEmptyPasswords /etc/ssh/sshd_config && \
  sed -i "s/PermitEmptyPasswords.*/PermitEmptyPasswords no/g" /etc/ssh/sshd_config
if ! [ $? -eq 0 ]; then
    echo "PermitEmptyPasswords no" >> /etc/ssh/sshd_config
fi
} &>> ${RUNROOT}/run.log

