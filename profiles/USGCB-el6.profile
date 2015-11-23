################################################################################
# Remediation profile configuration for the Fedora SSG USGCB profile

##
# We need a time-source.
NTP1_SOURCE="2.fedora.pool.ntp.org"

##
# Please give logs a home. This is NOT SSL protected by default
TARGET_LOG_HOST="127.0.0.1"

##
# Wait of n days required for password change
MINIMUM_AGE_LOGIN_DEFS="7"

##
# Retain system logs for n weeks:
LOG_RETENTION_WEEKS="12"

##
# Root permit ssh (one of "no" or "without-password"). Strict  "no" required
# for various policies but use of a strongly protected ssh-key is secure in
# most cases.
SSHD_PERMIT_ROOT_LOGIN="no"

##
# Password age warning
PASSWORD_WARN_AGE_LOGIN_DEFS=14

##
# Account expiration
DISABLE_POST_PW_EXPIRATION=30

##
# Cracklib settings
CRACKLIB_PASSWORD_RETRIES="3"
CRACKLIB_PASSWORD_DCREDIT="-1"
CRACKLIB_PASSWORD_UCREDIT="-1"
CRACKLIB_PASSWORD_OCREDIT="-1"
CRACKLIB_PASSWORD_LCREDIT="-1"
CRACKLIB_PASSWORD_DIFOK="3"
CRACKLIB_PASSWORD_MINLEN="14"

##
# Faillock, deny after n tries
PAM_FAILLOCK_DENY="3"

##
# Fedora SSG SCAP profile this rule list should be associated with
RUN_SCAP_PROFILE="usgcb-rhel6-server" # a valid profile name

##
# United States Government Configuration Baseline. SCAP rules for that.
RULE_LIST="ensure_redhat_gpgkey_installed \
security_patches_up_to_date \
package_aide_installed \
mount_option_nodev_nonroot_local_partitions \
mount_option_tmp_nodev \
mount_option_tmp_noexec \
mount_option_tmp_nosuid \
mount_option_dev_shm_nodev \
mount_option_dev_shm_noexec \
mount_option_dev_shm_nosuid \
mount_option_var_tmp_bind \
service_autofs_disabled \
kernel_module_cramfs_disabled \
kernel_module_freevxfs_disabled \
kernel_module_jffs2_disabled \
kernel_module_hfs_disabled \
kernel_module_hfsplus_disabled \
kernel_module_squashfs_disabled \
kernel_module_udf_disabled \
userowner_shadow_file \
groupowner_shadow_file \
file_permissions_etc_shadow \
file_owner_etc_group \
file_groupowner_etc_group \
file_permissions_etc_group \
file_owner_etc_gshadow \
file_groupowner_etc_gshadow \
file_permissions_etc_gshadow \
file_owner_etc_passwd \
file_groupowner_etc_passwd \
file_permissions_etc_passwd \
sticky_world_writable_dirs \
umask_for_daemons \
disable_users_coredumps \
sysctl_fs_suid_dumpable \
sysctl_kernel_exec_shield \
sysctl_kernel_randomize_va_space \
enable_selinux_bootloader \
selinux_state \
selinux_policytype \
securetty_root_login_console_only \
accounts_no_uid_except_zero \
no_empty_passwords \
accounts_password_minlen_login_defs \
accounts_maximum_age_login_defs \
accounts_password_warn_age_login_defs \
account_disable_post_pw_expiration \
accounts_password_pam_retry \
accounts_passwords_pam_faillock_deny \
accounts_password_pam_unix_remember \
set_password_hashing_algorithm_systemauth \
set_password_hashing_algorithm_logindefs \
accounts_umask_bashrc \
accounts_umask_cshrc \
accounts_umask_etc_profile \
accounts_umask_login_defs \
file_user_owner_grub_conf \
file_group_owner_grub_conf \
file_permissions_grub_conf \
bootloader_password \
disable_interactive_boot \
gconf_gnome_screensaver_idle_delay \
gconf_gnome_screensaver_idle_activation_enabled \
gconf_gnome_screensaver_lock_enabled \
gconf_gnome_screensaver_mode_blank \
set_system_login_banner \
gconf_gdm_enable_warning_gui_banner \
network_disable_zeroconf \
sysctl_net_ipv4_conf_default_send_redirects \
sysctl_net_ipv4_conf_all_send_redirects \
sysctl_net_ipv4_conf_all_accept_redirects \
sysctl_net_ipv4_conf_all_secure_redirects \
sysctl_net_ipv4_conf_all_log_martians \
sysctl_net_ipv4_conf_default_accept_source_route \
sysctl_net_ipv4_conf_default_accept_redirects \
sysctl_net_ipv4_conf_default_secure_redirects \
sysctl_net_ipv4_icmp_echo_ignore_broadcasts \
sysctl_net_ipv4_icmp_ignore_bogus_error_responses \
sysctl_net_ipv4_tcp_syncookies \
sysctl_net_ipv4_conf_all_rp_filter \
sysctl_net_ipv4_conf_default_rp_filter \
service_bluetooth_disabled \
kernel_module_bluetooth_disabled \
kernel_module_ipv6_option_disabled \
network_ipv6_disable_rpc \
sysctl_net_ipv6_conf_default_accept_ra \
sysctl_net_ipv6_conf_default_accept_redirects \
service_ip6tables_enabled \
service_iptables_enabled \
kernel_module_dccp_disabled \
kernel_module_sctp_disabled \
kernel_module_rds_disabled \
kernel_module_tipc_disabled \
package_rsyslog_installed \
service_rsyslog_enabled \
service_auditd_enabled \
bootloader_audit_argument \
audit_rules_time_adjtimex \
audit_rules_time_settimeofday \
audit_rules_time_stime \
audit_rules_time_clock_settime \
audit_rules_time_watch_localtime \
audit_rules_usergroup_modification \
audit_rules_networkconfig_modification \
audit_rules_mac_modification \
audit_rules_dac_modification_chmod \
audit_rules_dac_modification_chown \
audit_rules_dac_modification_fchmod \
audit_rules_dac_modification_fchmodat \
audit_rules_dac_modification_fchown \
audit_rules_dac_modification_fchownat \
audit_rules_dac_modification_fremovexattr \
audit_rules_dac_modification_fsetxattr \
audit_rules_dac_modification_lchown \
audit_rules_dac_modification_lremovexattr \
audit_rules_dac_modification_lsetxattr \
audit_rules_dac_modification_removexattr \
audit_rules_dac_modification_setxattr \
audit_rules_unsuccessful_file_modification \
audit_rules_privileged_commands \
audit_rules_media_export \
audit_rules_file_deletion_events \
audit_rules_sysadmin_actions \
audit_rules_kernel_module_loading \
audit_rules_immutable \
uninstall_xinetd \
uninstall_telnet_server \
package_rsh-server_removed \
uninstall_ypserv \
service_tftp_disabled \
uninstall_tftp-server \
service_kdump_disabled \
service_portreserve_disabled \
service_rhnsd_disabled \
service_crond_enabled \
service_atd_disabled \
sshd_allow_only_protocol2 \
sshd_set_idle_timeout \
sshd_set_keepalive \
sshd_disable_rhosts \
disable_host_auth \
sshd_disable_root_login \
sshd_disable_empty_passwords \
sshd_enable_warning_banner \
sshd_do_not_permit_user_env \
sshd_use_approved_ciphers \
disable_avahi \
disable_dhcp_server \
uninstall_dhcp_server \
service_ntpd_enabled \
ntpd_specify_remote_server \
package_sendmail_removed \
package_openldap-servers_removed \
service_nfslock_disabled \
service_rpcgssd_disabled \
service_rpcidmapd_disabled \
service_netfs_disabled \
service_rpcsvcgssd_disabled \
disable_dns_server \
uninstall_bind \
disable_vsftpd \
uninstall_vsftpd \
disable_httpd \
package_httpd_removed \
disable_dovecot \
package_dovecot_removed \
disable_smb_server \
require_smb_client_signing \
disable_squid \
uninstall_squid \
disable_snmpd"

export NTP1_SOURCE TARGET_LOG_HOST MINIMUM_AGE_LOGIN_DEFS LOG_RETENTION_WEEKS SSHD_PERMIT_ROOT_LOGIN PASSWORD_WARN_AGE_LOGIN_DEFS DISABLE_POST_PW_EXPIRATION CRACKLIB_PASSWORD_RETRIES CRACKLIB_PASSWORD_DCREDIT CRACKLIB_PASSWORD_UCREDIT CRACKLIB_PASSWORD_OCREDIT CRACKLIB_PASSWORD_LCREDIT CRACKLIB_PASSWORD_DIFOK CRACKLIB_PASSWORD_MINLEN PAM_FAILLOCK_DENY RUN_SCAP_PROFILE RULE_LIST

