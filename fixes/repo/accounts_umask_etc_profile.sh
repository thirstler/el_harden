#!/bin/bash
# SID: CCE-26669-2

{
var_accounts_user_umask="077"
grep -q umask /etc/profile && \
  sed -i "s/umask.*/umask $var_accounts_user_umask/g" /etc/profile
if ! [ $? -eq 0 ]; then
    echo "umask $var_accounts_user_umask" >> /etc/profile
fi
} &>> ${LOGFILE}

