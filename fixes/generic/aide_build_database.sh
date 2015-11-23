#!/bin/bash
# SID: aide_build_database

{
rpm -qi aide || yum -y -q install aide

# Set up the custom AIDE rules
if ! grep -q '# Local additions' /etc/aide.conf; then
cat << EOF >> /etc/aide.conf

##############################################################################
# Local additions

# CA CM changes a lot. Apparently. Ideally it should be watch to some
# extent, but for now....
!/opt/CA

# Same with McAfee stuff
!/opt/McAfee

# Whatever
!/usr/lib/bmc

# Nagios tmp files need ignoring
!/usr/local/nagios/tmp

# Why is lastlog not ignored by default?
!/var/log/lastlog

# Netbackup files
!/usr/openv/var
EOF
fi

##
# Set up AIDE
if [ ! -f /var/lib/aide/aide.db.gz ]; then
    echo -n "initializing AIDE database..."
    aide --init
    mv /var/lib/aide/aide.db.new.gz /var/lib/aide/aide.db.gz
    echo "...done."
fi
} &>> ${RUNROOT}/run.log

