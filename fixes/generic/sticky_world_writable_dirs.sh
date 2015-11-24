#!/bin/bash
# SID: CCE-26840-9

{
df --local -P | awk {'if (NR!=1) print $6'} \
| xargs -I '{}' find '{}' -xdev -type d \
\( -perm -0002 -a ! -perm -1000 \) 2>/dev/null \
| xargs chmod a+t || echo "no world writable files found?"
} &>> ${RUNROOT}/${LOGFILE}

