#!/bin/bash
# SID: CCE-27079-3

{
if rpm -qa | grep -q ypserv; then
	yum -y remove ypserv
fi
}
