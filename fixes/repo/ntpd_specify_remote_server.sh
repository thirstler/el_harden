#!/bin/bash
# SID: CCE-27098-3

{
: ${NTP1_SOURCE:="time.ssa.gov"}
: ${NTP2_SOURCE:="0.rhel.pool.ntp.org iburst"}

##
# Configure with selected time server
[ -f /etc/ntp.conf.secfixbak ] || cp /etc/ntp.conf /etc/ntp.conf.secfixbak
cat << EOF > /etc/ntp.conf
tinker panic 0
driftfile /var/lib/ntp/drift
restrict default kod nomodify notrap nopeer noquery
restrict -6 default kod nomodify notrap nopeer noquery
restrict 127.0.0.1
restrict -6 ::1
includefile /etc/ntp/crypto/pw
keys /etc/ntp/keys
server ${NTP1_SOURCE}
server ${NTP2_SOURCE}
EOF
} &>> ${LOGFILE}

