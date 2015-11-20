#!/bin/bash
# SID: CCE-27075-1

chkconfig httpd off &> /dev/null
service httpd stop &> /dev/null
