#!/bin/bash
# SID: CCE-27038-9

sed --follow-symlinks -i 's/\<nullok\>//g' /etc/pam.d/system-auth
