
node 'git.geeksoc.org' {

	# ensure that the git and gitlab users can actually login to clone repos
	$sshd_config_AllowGroups = 'git gssg gsag root'
	
	# Message of the day
	file { '/etc/motd':
        content => "
 _____ _ _         _____           _     _____            
|  __ (_) |       |  __ \         | |   /  ___|           
| |  \/_| |_      | |  \/ ___  ___| | __\ `--.  ___   ___ 
| | __| | __|     | | __ / _ \/ _ \ |/ / `--. \/ _ \ / __|
| |_\ \ | |_   _  | |_\ \  __/  __/   < /\__/ / (_) | (__ 
 \____/_|\__| (_)  \____/\___|\___|_|\_\\\____/ \___/ \___|
                                             

Primary Contact: Andrew Smillie (Smilers) - asmillie@geeksoc.org 
Purpose: Test Gitlab Server

This server is Puppet managed - local changes may be overwritten!

" 
    }

	# Roles
	include global
}
