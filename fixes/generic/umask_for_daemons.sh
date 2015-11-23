#!/bin/bash
# SID: CCE-27031-4

{
var_umask_for_daemons="027"
grep -q ^umask /etc/init.d/functions && \
  sed -i "s/umask.*/umask $var_umask_for_daemons/g" /etc/init.d/functions
if ! [ $? -eq 0 ]; then
    echo "umask $var_umask_for_daemons" >> /etc/init.d/functions
fi
} &>> ${RUNROOT}/run.log

