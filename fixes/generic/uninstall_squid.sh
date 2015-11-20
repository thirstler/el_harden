#!/bin/bash
# SID: CCE-26977-9

if rpm -qa | grep -q squid; then
    yum erase squid &> /dev/null || echo -n "(error) "
fi

