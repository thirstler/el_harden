#!/bin/bash
# SID: CCE-27195-7

# Install GConf2 package if not installed
if ! rpm -q GConf2 &> /dev/null; then
  yum -q -y install GConf2 &> /dev/null
fi

# Enable displaying of a login warning banner in the GNOME Display Manager's
# login screen
gconftool-2 --direct \
            --config-source "xml:readwrite:/etc/gconf/gconf.xml.mandatory" \
            --type bool \
            --set /apps/gdm/simple-greeter/banner_message_enable true &> /dev/null
             