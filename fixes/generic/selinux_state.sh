#!/bin/bash
# SID: CCE-26969-6

var_selinux_state="enforcing"
grep -q ^SELINUX= /etc/selinux/config && \
  sed -i "s/SELINUX=.*/SELINUX=$var_selinux_state/g" /etc/selinux/config
if ! [ $? -eq 0 ]; then
    echo "SELINUX=$var_selinux_state" >> /etc/selinux/config
fi
