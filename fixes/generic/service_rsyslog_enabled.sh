#!/bin/bash
# SID:

{
#
# Enable rsyslog for all run levels
#
/sbin/chkconfig --level 0123456 rsyslog on

##
# syslog config with configured destination log host
[ -f /etc/rsyslog.conf.secfixbak ] || cp /etc/rsyslog.conf /etc/rsyslog.conf.secfixbak
cat << EOF > /etc/rsyslog.conf
$ModLoad imuxsock
$ModLoad imklog
$ModLoad immark

$ActionFileDefaultTemplate RSYSLOG_TraditionalFileFormat

#$IncludeConfig /etc/rsyslog.d/*.conf

kern.info /var/log/messages
:msg, contains, "attackalert" ~

#### LOGHOST ####
# Configuration for primary syslog host
$WorkDirectory /var/lib/rsyslog
$ActionQueueFileName fwd_primary
$ActionQueueMaxDiskSpace 1g
$ActionQueueSaveOnShutdown on
$ActionQueueType LinkedList
$ActionResumeRetryCount -1
*.* @${TARGET_LOG_HOST}

local6.info ~
*.info;mail.none;authpriv.none;cron.none                /var/log/messages
authpriv.*                                              /var/log/secure
mail.*                                                  -/var/log/maillog
cron.*                                                  /var/log/cron
*.emerg                                                 *
uucp,news.crit                                          /var/log/spooler
local7.*                                                /var/log/boot.log
$template SpiceTmpl,"%TIMESTAMP%.%TIMESTAMP:::date-subseconds% %syslogtag% %syslogseverity-text%:%msg:::sp-if-no-1st-sp%%msg:::drop-last-lf%\n"
:programname, startswith, "spice-vdagent"       /var/log/spice-vdagent.log;SpiceTmpl
EOF


#
# Start rsyslog if not currently running
#
/sbin/service rsyslog start

} &>> ${RUNROOT}/${LOGFILE}

