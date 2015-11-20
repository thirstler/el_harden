#!/bin/bash
# SID: CCE-27030-6

if rpm -qa | grep -q squid; then
    yum -y erase bind &> /dev/null || echo -n "(error) "
fi
