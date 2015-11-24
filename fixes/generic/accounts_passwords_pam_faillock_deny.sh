#!/bin/bash
# SID: CCE-26844-1 CCE-27110-6 CCE-27215-3

{
: ${PAM_FAILLOCK_DENY:="3"}
AUTH_FILES[0]="/etc/pam.d/system-auth"
AUTH_FILES[1]="/etc/pam.d/password-auth"

for pamFile in "${AUTH_FILES[@]}"
do
	
	# pam_faillock.so already present?
	if grep -q "^auth.*pam_faillock.so.*" $pamFile; then

		# pam_faillock.so present, deny directive present?
		if grep -q "^auth.*[default=die].*pam_faillock.so.*authfail.*deny=" $pamFile; then

			# both pam_faillock.so & deny present, just correct deny directive value
			sed -i --follow-symlink "s/\(^auth.*required.*pam_faillock.so.*preauth.*silent.*\)\(deny *= *\).*/\1\2$PAM_FAILLOCK_DENY unlock_time=604800 fail_interval=900/" $pamFile
			sed -i --follow-symlink "s/\(^auth.*[default=die].*pam_faillock.so.*authfail.*\)\(deny *= *\).*/\1\2$PAM_FAILLOCK_DENY unlock_time=604800 fail_interval=900/" $pamFile

		# pam_faillock.so present, but deny directive not yet
		else

			# append correct deny value to appropriate places
			sed -i --follow-symlink "/^auth.*required.*pam_faillock.so.*preauth.*silent.*/ s/$/ deny=$PAM_FAILLOCK_DENY unlock_time=604800 fail_interval=900/" $pamFile
			sed -i --follow-symlink "/^auth.*[default=die].*pam_faillock.so.*authfail.*/ s/$/ deny=$PAM_FAILLOCK_DENY unlock_time=604800 fail_interval=900/" $pamFile
		fi

	# pam_faillock.so not present yet
	else

		# insert pam_faillock.so preauth & authfail rows with proper value of the 'deny' option
		sed -i --follow-symlink "/^auth.*sufficient.*pam_unix.so.*/i auth        required      pam_faillock.so preauth silent deny=$PAM_FAILLOCK_DENY  unlock_time=604800 fail_interval=900" $pamFile
		sed -i --follow-symlink "/^auth.*sufficient.*pam_unix.so.*/a auth        [default=die] pam_faillock.so authfail deny=$PAM_FAILLOCK_DENY  unlock_time=604800 fail_interval=900" $pamFile
		sed -i --follow-symlink "/^account.*required.*pam_unix.so/i account     required      pam_faillock.so" $pamFile
	fi
done

} &>> ${RUNROOT}/${LOGFILE}

