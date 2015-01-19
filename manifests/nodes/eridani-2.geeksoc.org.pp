node 'eridani-2.geeksoc.org' {

  # Message of the day
  file { '/etc/motd':
        content => "
Primary Contact: GSAG - gsag@geeksoc.org 
Purpose: Sun v440 for General Purpose

This server is Puppet managed - local changes may be overwritten!

"
    }


  # Roles
  include global
}
