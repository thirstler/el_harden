#!/bin/bash
# SID: CCE-27013-2

{
: ${MINIMUM_AGE_LOGIN_DEFS:="7"}
grep -q ^PASS_MIN_DAYS /etc/login.defs && \
  sed -i "s/PASS_MIN_DAYS.*/PASS_MIN_DAYS     ${MINIMUM_AGE_LOGIN_DEFS}/g" /etc/login.defs
if ! [ $? -eq 0 ]; then
    echo "PASS_MIN_DAYS      ${MINIMUM_AGE_LOGIN_DEFS}" >> /etc/login.defs
fi

} &>> ${RUNROOT}/run.log

