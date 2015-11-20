#!/bin/bash
# SID: CCE-27045-4

# Include source function library.
. functions

add_mp_opt "/opt" "nodev"
add_mp_opt "/usr" "nodev"
add_mp_opt "/var" "nodev"
add_mp_opt "/var/log" "nodev"
add_mp_opt "/var/log/audit" "nodev"
add_mp_opt "/boot" "nodev"
add_mp_opt "/home" "nodev"
