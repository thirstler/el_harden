#!/bin/bash
# SID: CCE-27014-0

: ${LOG_RETENTION_WEEKS:="12"}

##
# Set up log rotation
[ -f /etc/logrotate.conf.secfixbak ] || cp /etc/logrotate.conf /etc/logrotate.conf.secfixbak
cat << EOF > /etc/logrotate.conf
weekly
rotate ${LOG_RETENTION_WEEKS}
create
dateext
compress
include /etc/logrotate.d
/var/log/wtmp {
    monthly
    create 0664 root utmp
        minsize 1M
    rotate 1
}

/var/log/btmp {
    missingok
    monthly
    create 0600 root utmp
    rotate 1
}
EOF
