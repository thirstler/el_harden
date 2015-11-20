#!/bin/bash

# SID: package_aide_installed

yum -y install aide &> /dev/null || echo "failed to install AIDE package"
