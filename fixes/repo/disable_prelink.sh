#!/bin/bash
# SID: CCE-27221-1

{
#
# Disable prelinking. Currently Fedora SSG content fails this check if the file
# is not present.
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
    ##
    # Need to populate the file if prelink is not installed
    echo 'PRELINKING=no' > /etc/sysconfig/prelink
    echo "prelink is not installed"
fi

} &>> ${RUNROOT}/${LOGFILE}

