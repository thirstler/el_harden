#!/bin/bash
# SID: CCE-27221-1

{
#
# Disable prelinking altogether
#
if rpm -q prelink &> /dev/null; then

    if grep -q "^PRELINKING.*" /etc/sysconfig/prelink; then
        sed -i 's/PRELINKING.*/PRELINKING=no/g' /etc/sysconfig/prelink
    else
        echo -e "\n# Set PRELINKING=no per security requirements" >> /etc/sysconfig/prelink
        echo "PRELINKING=no" >> /etc/sysconfig/prelink
    fi
    #
    # Undo previous prelink changes to binaries
    #
    /usr/sbin/prelink -ua
else
    echo "prelink is not installed"
fi

} &>> ${RUNROOT}/${LOGFILE}
