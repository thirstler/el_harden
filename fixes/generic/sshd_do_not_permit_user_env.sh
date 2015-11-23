#!/bin/bash
# SID: CCE-27201-3

{
grep -q ^PermitUserEnvironment /etc/ssh/sshd_config && \
  sed -i "s/PermitUserEnvironment.*/PermitUserEnvironment no/g" /etc/ssh/sshd_config
if ! [ $? -eq 0 ]; then
    echo "PermitUserEnvironment no" >> /etc/ssh/sshd_config
fi
} &>> ${RUNROOT}/run.log

