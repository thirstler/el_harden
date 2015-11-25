#!/bin/bash
# SID: CCE-27034-8

{
var_accounts_user_umask="077"
grep -q umask /etc/csh.cshrc && \
  sed -i "s/umask.*/umask $var_accounts_user_umask/g" /etc/csh.cshrc
if ! [ $? -eq 0 ]; then
    echo "umask $var_accounts_user_umask" >> /etc/csh.cshrc
fi
} &>> ${RUNROOT}/${LOGFILE}

