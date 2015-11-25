#!/bin/bash
# SID: CCE-26875-5

{
var_selinux_policy_name="targeted"
grep -q ^SELINUXTYPE /etc/selinux/config && \
  sed -i "s/SELINUXTYPE=.*/SELINUXTYPE=$var_selinux_policy_name/g" /etc/selinux/config
if ! [ $? -eq 0 ]; then
    echo "SELINUXTYPE=$var_selinux_policy_name" >> /etc/selinux/config
fi
} &>> ${RUNROOT}/${LOGFILE}

