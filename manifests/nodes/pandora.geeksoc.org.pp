
node 'pandora.geeksoc.org' {
		
	# Message of the day
	file { '/etc/motd':
        content => "
______               _                   _____           _    _____            
| ___ \             | |                 |  __ \         | |  /  ___|           
| |_/ /_ _ _ __   __| | ___  _ _ __ _   | |  \/ ___  ___| | _\ `--.  ___   ___ 
|  __/ _` | '_ \ / _` |/ _ \| '_/ _` |  | | __ / _ \/ _ \ |/ /`--. \/ _ \ / __|
| | | (_| | | | | (_| | (_) | || (_| | _| |_\ \  __/  __/   </\__/ / (_) | (__ 
\_|  \__,_|_| |_|\__,_|\___/|_| \__,_|(_)\____/\___|\___|_|\_\____/ \___/ \___|

Primary Contact: Fraser McVean (FrazzleMcV) - fmcvean@geeksoc.org
Purpose: Game Server

This server is Puppet managed - local changes may be overwritten!

" 
    }
	
    $sshd_config_AllowGroups = 'sysadmin-games sysadmin gsag root'
    $sudoers = ["%sysadmin-games"]

	# Roles
	include global
}
