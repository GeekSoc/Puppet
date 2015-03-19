
node 'wailord.geeksoc.org' {
    
  # Message of the day
  file { '/etc/motd':
        content => "


Welcome to Wailord!
                                                                          
Primary Contact: GSAG - gsag@geeksoc.org
Purpose: Docker Host

This server is Puppet managed - local changes may be overwritten!

"
    }
  
    class {'ssh::sshd':
      sshd_config_AllowGroups => 'sysadmin-games sysadmin gsag root members',
    }
    

  # Roles
  include global
}
