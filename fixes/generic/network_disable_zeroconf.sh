#!/bin/bash

sed -i "/^NOZEROCONF\=/d" /etc/sysconfig/network
echo "NOZEROCONF=yes" >> /etc/sysconfig/network
