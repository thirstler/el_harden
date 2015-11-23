#!/bin/bash
###############################################################################
# Name: main.sh
# Desc: Entry point for secfix scripts. These scripts will configure a server
#       to conform to the requirements specified in the provided list of
#       rules. Distributed rule lists are USGCB and C2S (a CIS clone aped by
#       the SCAP Security Guide folks). See README for more information.
# Date: 2015-11-08
# Author: Jason Russler <jason.russler@gmail.com>
#       Includes remediation content derived from the Fedora SSG.
###############################################################################

##
# See the config file for, you know, configuration.
. ./config


###############################################################################
# Run it
###############################################################################

##
# Sanity checks
if [ ! -d ./fixes ]; then
    echo "where the hell are we? exiting."
    exit 1
fi
export RUNROOT=$(pwd)

if [[ "$(id -u)" != "0" ]]; then
    echo "you no root???"
    exit 1
fi

##
# Sanity check distribution and set some values
set_rh_release || exit 1

echo -n "running for $RH_DIST ver ${RH_VERSION}"
[[ "${RH_TYPE}" == "fedora" ]] || echo -n ", release ${RH_RELEASE}"
echo ""

##
# Check that everything's there. If not then we should probably stop.
for chk in $CHECKUS; do
    if [ ! -f "./fixes/${RH_TYPE}/${RH_VERSION}/${chk}.sh" ]; then
        echo "rule file not found: $(pwd)/fixes/${RH_TYPE}/${RH_VERSION}/${chk}.sh"
        echo "quitting before we really break things"
        exit 1
    fi
done

cat << EOF

                               ### WARNING ###
                              
You're about to run a security "fixing" tool on this system. It sort of sticks
your server in a salad-spinner of existential ruin. Make sure that's ok.

See ./run.log for info and errors and other stuff. This script will only echo
good things.

EOF

while true; do
    echo -n "ok, you ready to do this? [y/N]: "
    read YN
    [ "$(echo $YN|tr [:upper:] [:lower:])" == "y" ] && break
    [ "$(echo $YN|tr [:upper:] [:lower:])" == "n" ] && exit 1
done

if [[ "${WRITE_DEFAULT_FIREWALL}" == "y" ]]; then
echo -n "writing permissive firewall configuration..."
##
# FIREWALL CONFIGS - SET IPv4 OPEN and IPv6 CLOSED DEFAULTS
cat << EOF > /etc/sysconfig/ip6tables
*filter
:INPUT DROP [0:0]
:FORWARD DROP [0:0]
:OUTPUT ACCEPT [41:7160]
COMMIT
EOF

cat << EOF > /etc/sysconfig/iptables
*filter
:INPUT DROP [0:0]
:FORWARD DROP [0:0]
:OUTPUT ACCEPT [41:7160]
-A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
-A INPUT -j ACCEPT
COMMIT
EOF
fi
echo "done"

if [[ "${ADMIN_USER}" != "" ]]; then
echo -n "creating temporary administrative user (expires in 3 days)..."

##
# Create administrative user (lasts for 3 days)
if ! id  -u ${ADMIN_USER} &> /dev/null; then
/usr/bin/id ${ADMIN_USER} &> /dev/null || /usr/sbin/useradd -u${ADMIN_UID} \
-c"Default admin user (ssa_secfixes)" \
-Gwheel \
-e $(date +%Y-%m-%d -d "+3 days") \
-p ${ADMIN_PASSWD} \
${ADMIN_USER}

cat << EOF > /etc/sudoers.d/wheel
%wheel        ALL=(ALL)       ALL
EOF
echo "done"
else
echo "already there (expires $(chage -l ${ADMIN_USER}|grep "^Account expires"|sed "s/^.*: //"))"
fi
fi

##
# Set root password to whatever
echo -n "setting root password to random garbage..."
cat /proc/sys/kernel/random/uuid|sed "s/\-//g"|passwd --stdin root &> /dev/null
echo "done"

##
# Install scap-security-guide for functions and running an audit
if ! rpm -q scap-security-guide &> /dev/null; then
    echo -n "scap-security-guide package not installed, install it..."
    if ! yum -y install scap-security-guide &> /dev/null; then
        echo "can't install scap-security-guide, this is needed for proper function, exiting"
        exit 1
    fi
    echo "done"
    REMOVE_SCAP_SECURITY_GUIDE="y"
fi

# truncate the log
:> ${RUNROOT}/run.log

echo "do configuration changes..."
for chk in $CHECKUS; do
    if [ ! -f "fixes/${RH_TYPE}/${RH_VERSION}/${chk}.sh" ]; then
        echo "WARNING: rule file not found: fixes/${RH_TYPE}/${RH_VERSION}/${chk}.sh"
    fi
    echo -n "running ${chk} ..."
    echo "$(date) - ./fixes/${RH_TYPE}/${RH_VERSION}/${chk}.sh --" &>> ${RUNROOT}/run.log
    ./fixes/${RH_TYPE}/${RH_VERSION}/${chk}.sh
    echo "done"
done

if [[ ${RUN_SCAP_AUDIT} == "y" ]]; then

echo -n "generating SCAP report for ${RUN_SCAP_PROFILE} benchmark:"
oscap xccdf eval --profile ${RUN_SCAP_PROFILE} \
  --report /tmp/$(hostname)-${RUN_SCAP_PROFILE}-report.html \
  --results /tmp/$(hostname)-${RUN_SCAP_PROFILE}-results.xml \
  /usr/share/xml/scap/ssg/content/ssg-rhel6-xccdf.xml > /tmp/$(hostname)-${RUN_SCAP_PROFILE}.log
COMP=$(grep '<td class="score-percent">' /tmp/$(hostname)-${RUN_SCAP_PROFILE}-report.html | sed -E "s/\s+<.*>(.*)<.*>/\1/")
echo "done (${COMP})"
echo "full report file: /tmp/$(hostname)-${RUN_SCAP_PROFILE}-report.html"
echo ""
echo "reboot and rerun SCAP scan (or this script) for more accuracy in this report."
echo "A reboot is needed to update some detections."

fi

echo -n "clean-up..."
[[ "${REMOVE_SCAP_SECURITY_GUIDE}" == "y" ]] && yum -y erase scap-security-guide &> /dev/null
echo "done"

