#!/bin/bash
# SID: CCE-27283-1

{
: ${DISABLE_POST_PW_EXPIRATION:=30}

var_account_disable_post_pw_expiration="${DISABLE_POST_PW_EXPIRATION}"
grep -q ^INACTIVE /etc/default/useradd && \
  sed -i "s/INACTIVE.*/INACTIVE=$var_account_disable_post_pw_expiration/g" /etc/default/useradd
if ! [ $? -eq 0 ]; then
    echo "INACTIVE=$var_account_disable_post_pw_expiration" >> /etc/default/useradd
fi

} &>> ${RUNROOT}/run.log

