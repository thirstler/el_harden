#!/bin/bash
# SID: 

grep -q ^password /boot/grub/grub.conf || sed --follow-symlinks -Ei "s|^(default=.*)|\1\npassword --encrypted ${BOOTLOADER_PASSWORD}|" /boot/grub/grub.conf
