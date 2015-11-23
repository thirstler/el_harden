#!/bin/bash
# SID: CCE-27289-8

{
DIRS="/bin /usr/bin /usr/local/bin /sbin /usr/sbin /usr/local/sbin"
for dirPath in $DIRS; do
    find $dirPath -perm /022 -exec chmod go-w '{}' \;
done
} &>> ${RUNROOT}/run.log

