# EL Harden

What does this do?

This is a collection of scripts that will edit a lot of configuration on the
target system in the hope of making it comply with site policy or one of the
usual standard benchmarks. Currently it implements rules for the USGCB and the
C2S benchmarks (C2S being roughly a clone of the CIS benchmark).

You may want to stop by here for a more complete set of hardening scripts:

https://github.com/fcaviggia/hardening-script-el6

I just find these easier to work with.

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
 - This script will create a random password for the root account. Per the
   rules, root should only ever be accessed from a regular user account so, in
   a perfect world, this should be ok. Meaning "su -" will not work (unless you
   trust the wheel group) because the root password is set to a large random
   value. Use "sudo -s" - or "sudo -l" or whatever.
 - The contained rules are not entirely complete. Rules that are satisifed by
   the default RHEL configuration are not present. If you run this on a newly
   provisioned system it won't be an issue. If you're trying to harden an
   existing system with a lot of configuration, it could miss stuff. You've be
   warned.
 - Some of the script content was lifed from the Fedora SSG. So thanks for
   that. The reason this collection exists is because some of the SSG content
   has issues but mostly because it is configurable. Meaning you can specify
   log hosts, NTP servers and other variables necessary to fill in some of the
   gaps left by a generic remediation.
 - Last but not least: Get a configuration management system (something like
   Foreman/Puppet). Scripts like this are really useful for configure-on-deploy
   setups but you should have a nice site config that meets target
   requirements, there's no such thing as running something that will "harden"
   your OS.
   
Prerequisites:

 - The target system needs to be able to install packages with yum. If the
   system is not configured with a Satellite or RHN or any upstream repository
   it may fail.
 - Be root on the system.
 - Script assumes no mount-points are NFS mounted. While it won't fail if any
   file systems are NFS, it may take a long time to finish. I try and fix this
   later.

Instructions:

1) First, edit the script and change the administrative user password hash to 
   something other than the default (b3292f). Use "grub-crypt --sha-512" to
   create a hash.
2) Select a UID for the administrative user that this script will add. That or
   disable the creation of an admin user20 (in which case step #1 is irrelevant
   as well). If the default is fine then fine.
3) Review the remaining configuration options. The defaults are derived from
   whatever the benchmarks want but there may be some cases where they conflict
   or are not strong enough for your tastes. Keep the defaults and change them
   if they miss your target benchmark.
4) Look in "functions" at the rule lists. You may want to exclude rules that
   will break things for your site. I'd create a new rule called CUSTOM and 
   give it the list of rules you do want and leave the defaults for the others
   alone.
5) Select a benchmark to target. Currently there is $USGCB, $C2S and $CUSTOM if
   you created it. You'll select the benchmark by assigning it to $CHECKUS.
   E.g:
   
   CHECKUS=$USGCB
   
6) Change directory to be in there with "run.sh" and run it:

   ./run.sh
   
   You'll get a nasty warning. Be sure you're ok with this.
   
7) After running you may decide you want to actually know the root password.
   change it if you must.
8) Reboot the system a rerun an SCAP audit. This script won't change the state
   of active mount points so you'll get dinged on those until a reboot.
9) Remove the created admin account (if you elected to add it) after you get
   your users and/or whatever IDM solution in place.   
