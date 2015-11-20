#!/bin/bash

# SID: CCE-27635-2

yum -y update &> /dev/null || echo "failed to install security updates"


