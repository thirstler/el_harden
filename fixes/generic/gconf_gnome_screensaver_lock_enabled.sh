#!/bin/bash
# SID: CCE-26235-2

# Install GConf2 package if not installed
if ! rpm -q GConf2 &> /dev/null; then
  yum -y install GConf2 &> /dev/null
fi

# Set the screensaver locking activation in the GNOME desktop when the
# screensaver is activated
gconftool-2 --direct \
            --config-source "xml:readwrite:/etc/gconf/gconf.xml.mandatory" \
            --type bool \
            --set /apps/gnome-screensaver/lock_enabled true &> /dev/null
