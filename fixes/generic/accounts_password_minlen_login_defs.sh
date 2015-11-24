#!/bin/bash
# SID:

: ${PASSWORD_MINLEN_LOGIN_DEFS:=14}

{
grep -q ^PASS_MIN_LEN /etc/login.defs && \
  sed -i "s/PASS_MIN_LEN.*/PASS_MIN_LEN     ${PASSWORD_MINLEN_LOGIN_DEFS}/g" /etc/login.defs
if ! [ $? -eq 0 ]; then
    echo "PASS_MIN_LEN      ${PASSWORD_MINLEN_LOGIN_DEFS}" >> /etc/login.defs
fi
} &>> ${RUNROOT}/${LOGFILE}

