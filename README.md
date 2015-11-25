# EL Harden

What does this do?

This is a collection of scripts that will edit a lot of configuration on the
target system in the hope of making it comply with site policy or one of the
usual standard benchmarks. Currently it implements rules for the USGCB, C2S,
(C2S being roughly a clone of the CIS benchmark) and the DISA guidelines (STIG).

You may want to stop by here for a more complete set of hardening scripts:

https://github.com/fcaviggia/hardening-script-el6

Frank's scripts go deeper into security configuration relevant to the DoD
and other three-letter agencies. I just find these easier to work with since
they're tailored for use with the Fedora SCAP Security Guide (SSG).

Current state:

Only works for RHEL6

Notes:

 - Please don't run this on anything you care about. Much less a production
   system. Really. This script should be used during provisioning. It could
   also be really useful for enforcing state for a subset of rules that you've
   found to be safe to run on active systems.
 - This script will create an administrative user (secfix_admin by default).
   This user can be used to log into the system and can "sudo -s" to root. The
   account expires three days after creation. On a related note:
 - This script will disable the root account on the executing system by default.
   This is per the guidelines for some some benchmarks. This is often not 
   desirable and is therefore configurable.
 - The contained rules are not entirely complete. Rules that are satisfied by
   the default RHEL configuration are not present. If you run this on a newly
   provisioned system it won't be an issue. If you're trying to harden an
   existing system with a lot of configuration, it could miss stuff. You've be
   warned.
 - Some of the script content was lifted from the Fedora SSG. So thanks for
   that. The reason this collection exists is because some of the SSG content
   has issues but mostly because it is configurable. Meaning you can specify
   log hosts, NTP servers and other variables necessary to fill in some of the
   gaps left by a generic remediation.
 - Last but not least: Get a configuration management system (something like
   Foreman/Puppet). Scripts like this are really useful for configure-on-deploy
   setups but you should have a nice site config that meets target
   requirements.
   
Prerequisites:

 - The target system needs to be able to install packages with yum. If the
   system is not configured with a Satellite or RHN or any upstream repository
   it may fail.
 - Be root on the system.
 - Script assumes no mount-points are NFS mounted. While it won't fail if any
   file systems are NFS, it may take a long time to finish. I'll try and fix
   this later.

Instructions:
 - First, edit the "config" file and change the administrative user password
   hash to something other than the default (b3292f). Use the following python
   snippet to generate a password hash:

     python -c "import crypt; print crypt.crypt('my password')"

 - Select a username/UID for the administrative user that this script will add
   if the defaults are no good for you. That or disable the creation of an admin
   user (in which case step #1 is irrelevant as well).
 - While you're in the configuration file, please select a remediation profile
   by sourcing it. This distributes with the C2S profile selected by default.
   You will eventually graduate to creating a new profile pursuant to your
   site's own set of exceptions or additions.
 - Review the remaining configuration options. The defaults are derived from
   whatever the benchmarks want but there may be some cases where they conflict
   or are not strong enough for your tastes. Keep the defaults and change them
   if they miss your target benchmark.
 - Set your "issue" login banner by editing the "banner" file. If desired, you
   can delete that file and export the BANNER_TEXT config variable and the
   scripts will then use that.
 - Change directory to be in there with "run.sh" and run it:

   ./run.sh

   You'll get a nasty warning. Be sure you're ok with this.

 - Reboot the system and rerun an SCAP audit. This script won't change the state
   of active mount points so you'll get dinged on those until a reboot.
 - Remove the created admin account (if you elected to add it) after you get
   your users and/or whatever IDM solution in place.
     
