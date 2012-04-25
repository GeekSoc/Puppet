
node 'git.geeksoc.org' {

	$sshd_config_AllowGroups = 'git gssg gsag root'
	
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

	include global
}
