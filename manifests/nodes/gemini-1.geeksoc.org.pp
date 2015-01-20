
node 'gemini-1.geeksoc.org' {

  # Message of the day
  file { '/etc/motd':
        content => "
 _____                _       _        __  
|  __ \              (_)     (_)      /  | 
| |  \/ ___ _ __ ___  _ _ __  _ ______`| | 
| | __ / _ \ '_ ` _ \| | '_ \| |______|| | 
| |_\ \  __/ | | | | | | | | | |      _| |_
 \____/\___|_| |_| |_|_|_| |_|_|      \___/

Primary Contact: GSAG - gsag@geeksoc.org 
Purpose: Xen dom0 for Development

This server is Puppet managed - local changes may be overwritten!

"
    }


  # Roles
  include global
}
