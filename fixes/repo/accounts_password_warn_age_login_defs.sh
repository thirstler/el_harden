#!/bin/bash
# SID: CCE-26988-6

{
: ${PASSWORD_WARN_AGE_LOGIN_DEFS:=14}

grep -q ^PASS_WARN_AGE /etc/login.defs && \
  sed -i "s/PASS_WARN_AGE.*/PASS_WARN_AGE     ${PASSWORD_WARN_AGE_LOGIN_DEFS}/g" /etc/login.defs
if ! [ $? -eq 0 ]; then
    echo "PASS_WARN_AGE      ${PASSWORD_WARN_AGE_LOGIN_DEFS}" >> /etc/login.defs
fi
} &>> ${LOGFILE}
