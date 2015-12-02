#!/bin/bash
# SID: CCE-27567-7

{

echo 'exec /usr/bin/logger -p security.info "Control-Alt-Delete pressed"' > /etc/init/control-alt-delete.conf

} &>> ${LOGFILE}

