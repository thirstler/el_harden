#!/bin/bash
# SID: CCE-26971-2

# All you can really do is fail this for now. Fix is manual.

#awk -F: '$3 == 0 && $1 != "root" { print $1 }' /etc/passwd | xargs passwd -l
