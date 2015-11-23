#!/bin/bash
# SID: CCE-27040-5

{
grep -q ^SINGLE /etc/sysconfig/init && \
  sed -i "s/SINGLE.*/SINGLE=\/sbin\/sulogin/g" /etc/sysconfig/init
if ! [ $? -eq 0 ]; then
    echo "SINGLE=/sbin/sulogin" >> /etc/sysconfig/init
fi
} &>> ${RUNROOT}/run.log

