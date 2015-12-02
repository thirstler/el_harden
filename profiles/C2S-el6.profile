################################################################################
# Remediation profile configuration for the Fedora SSG C2S profile
PROFILE_NAME="C2S-el6"
PROFILE_OS_MATCH="rhel-6"

##
# We need a time-source. C2S wants two sources for some reason.
NTP1_SOURCE="2.fedora.pool.ntp.org"
NTP2_SOURCE="3.fedora.pool.ntp.org"

##
# Please give logs a home. This is NOT SSL protected by default
TARGET_LOG_HOST="127.0.0.1"

##
# Set to a valid user or email address to establish the destination for AIDE
# reports. Defaults to "" which will send reports and output  to /dev/null.
# You'll want to set this to be part of a working IDS.
#AID_REPORT_ADDRESS=""

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
# OpenSCAP configuration.
RUN_SCAP_PROFILE="C2S" # a valid profile name
SCAP_XCCDF_FILE="/usr/share/xml/scap/ssg/content/ssg-rhel6-xccdf.xml"

##
# C2S benchmark aped from the CIS bench.
RULE_LIST="ensure_redhat_gpgkey_installed \
package_aide_installed \
disable_prelink \
aide_build_database \
aide_periodic_cron_checking \
mount_option_nodev_nonroot_local_partitions \
mount_option_tmp_nodev \
mount_option_tmp_noexec \
mount_option_tmp_nosuid \
mount_option_dev_shm_nodev \
mount_option_dev_shm_noexec \
mount_option_dev_shm_nosuid \
mount_option_var_tmp_bind \
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
file_permissions_binary_dirs \
sticky_world_writable_dirs \
umask_for_daemons \
disable_users_coredumps \
sysctl_fs_suid_dumpable \
sysctl_kernel_exec_shield \
sysctl_kernel_randomize_va_space \
enable_selinux_bootloader \
selinux_state \
selinux_policytype \
package_setroubleshoot_removed \
package_mcstrans_removed \
no_direct_root_logins \
accounts_no_uid_except_zero \
no_empty_passwords \
accounts_minimum_age_login_defs \
accounts_password_minlen_login_defs \
accounts_maximum_age_login_defs \
accounts_password_warn_age_login_defs \
account_disable_post_pw_expiration \
accounts_passwords_pam_faillock_deny \
accounts_password_pam_unix_remember \
set_password_hashing_algorithm_systemauth \
accounts_umask_bashrc \
accounts_umask_etc_profile \
file_user_owner_grub_conf \
file_group_owner_grub_conf \
file_permissions_grub_conf \
bootloader_password \
require_singleuser_auth \
disable_interactive_boot \
set_system_login_banner \
gconf_gdm_enable_warning_gui_banner \
gconf_gdm_set_login_banner_text \
sysctl_net_ipv4_conf_default_send_redirects \
sysctl_net_ipv4_conf_all_send_redirects \
sysctl_net_ipv4_conf_all_accept_source_route \
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
rsyslog_send_messages_to_logserver \
ensure_logrotate_activated \
service_auditd_enabled \
bootloader_audit_argument \
auditd_data_retention_space_left_action \
auditd_data_retention_admin_space_left_action \
auditd_data_retention_action_mail_acct \
audit_rules_time_adjtimex \
audit_rules_time_settimeofday \
audit_rules_time_stime \
audit_rules_time_watch_localtime \
audit_rules_usergroup_modification \
audit_rules_networkconfig_modification \
audit_rules_mac_modification \
audit_rules_login_events \
audit_manual_session_edits \
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
package_rsh_removed \
no_rsh_trust_files \
uninstall_ypserv \
package_ypbind_removed \
uninstall_tftp-server \
package_tftp_removed \
service_rhnsd_disabled \
service_crond_enabled \
service_atd_disabled \
sshd_allow_only_protocol2 \
sshd_set_idle_timeout \
sshd_disable_rhosts \
disable_host_auth \
sshd_disable_root_login \
sshd_disable_empty_passwords \
sshd_enable_warning_banner \
sshd_use_approved_ciphers \
packagegroup_xwindows_remove \
disable_avahi \
service_cups_disabled \
uninstall_dhcp_server \
service_ntpd_enabled \
ntpd_specify_remote_server \
package_openldap-servers_removed \
uninstall_vsftpd \
package_httpd_removed \
package_net-snmp_removed"

export NTP1_SOURCE NTP2_SOURCE TARGET_LOG_HOST MINIMUM_AGE_LOGIN_DEFS LOG_RETENTION_WEEKS SSHD_PERMIT_ROOT_LOGIN PASSWORD_WARN_AGE_LOGIN_DEFS DISABLE_POST_PW_EXPIRATION CRACKLIB_PASSWORD_RETRIES CRACKLIB_PASSWORD_DCREDIT CRACKLIB_PASSWORD_UCREDIT CRACKLIB_PASSWORD_OCREDIT CRACKLIB_PASSWORD_LCREDIT CRACKLIB_PASSWORD_DIFOK CRACKLIB_PASSWORD_MINLEN PAM_FAILLOCK_DENY RUN_SCAP_PROFILE RULE_LIST

