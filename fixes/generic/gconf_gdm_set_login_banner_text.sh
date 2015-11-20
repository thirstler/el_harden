#!/bin/bash
# SID: CCE-27017-3

login_banner_text="WARNING: by logging in to this system you are agreeing to this site's terms and conditions."
# Install GConf2 package if not installed
if ! rpm -q GConf2 &> /dev/null; then
  yum -y install GConf2 &> /dev/null
fi

# Expand the login_banner_text value - there was a regular-expression
# matching various banners, needs to be expanded
banner_expanded=$(echo "$login_banner_text" | sed 's/\[\\s\\n\][*+]/ /g;s/\\//g;')

# Set the text shown by the GNOME Display Manager in the login screen
gconftool-2 --direct \
            --config-source "xml:readwrite:/etc/gconf/gconf.xml.mandatory" \
            --type string \
            --set /apps/gdm/simple-greeter/banner_message_text "${banner_expanded}" &> /dev/null
            