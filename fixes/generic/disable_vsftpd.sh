#!/bin/bash
# SID: CCE-26948-0

if service vsftpd status &>/dev/null; then
	service vsftpd stop &> /dev/null
fi
