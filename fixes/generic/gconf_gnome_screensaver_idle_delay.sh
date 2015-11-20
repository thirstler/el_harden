#!/bin/bash
# SID:

inactivity_timeout_value="15"
# Install GConf2 package if not installed
if ! rpm -q GConf2 &> /dev/null; then
  yum -y install GConf2 &> /dev/null
fi

# Set the idle time-out value for inactivity in the GNOME desktop to meet the
# requirement
gconftool-2 --direct \
            --config-source "xml:readwrite:/etc/gconf/gconf.xml.mandatory" \
            --type int \
            --set /desktop/gnome/session/idle_delay ${inactivity_timeout_value} &> /dev/null
