
node 'gemini-2.geeksoc.org' {

  # Message of the day
  file { '/etc/motd':
        content => "
 _____                _       _        _____ 
|  __ \              (_)     (_)      / __  \
| |  \/ ___ _ __ ___  _ _ __  _ ______`' / /'
| | __ / _ \ '_ ` _ \| | '_ \| |______| / /  
| |_\ \  __/ | | | | | | | | | |      ./ /___
 \____/\___|_| |_| |_|_|_| |_|_|      \_____/

Primary Contact: GSAG - gsag@geeksoc.org 
Purpose: Xen dom0 host for Socs and Fusion                                                                   

This server is Puppet managed - local changes may be overwritten!

"
    }


  # Roles
  include global
}
