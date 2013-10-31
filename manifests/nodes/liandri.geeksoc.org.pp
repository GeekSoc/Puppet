
node 'liandri.geeksoc.org' {
		
	# Message of the day
	file { '/etc/motd':
        content => "
   _     _                 _      _  _____           _    _____           
  | |   (_)               | |    (_)|  __ \         | |  /  ___|          
  | |    _  __ _ _ __   __| |_ __ _ | |  \/ ___  ___| | _\ `--.  ___  ___ 
  | |   | |/ _` | '_ \ / _` | '__| || | __ / _ \/ _ \ |/ /`--. \/ _ \/ __|
  | |___| | (_| | | | | (_| | |  | || |_\ \  __/  __/   </\__/ / (_) \__ \
  \_____/_|\__,_|_| |_|\__,_|_|  |_(_)____/\___|\___|_|\_\____/ \___/|___/
                                                                          
Primary Contact: GSAG - gsag@geeksoc.org
Purpose: Game Server

This server is Puppet managed - local changes may be overwritten!

" 
    }
	
    class {'ssh::sshd':
      sshd_config_AllowGroups => 'sysadmin-games sysadmin gsag root',
    }
    
    class {'sudo':
      sudoers => '%sysadmin-games',
    }

	# Roles
	include global
}
