
node 'caprica.geeksoc.org' {

	# Message of the day
	file { '/etc/motd':
        content => "
 _____                  _                _____           _     _____            
/  __ \                (_)              |  __ \         | |   /  ___|           
| /  \/ __ _ _ __  _ __ _  ___  __ _    | |  \/ ___  ___| | __\ `--.  ___   ___ 
| |    / _` | '_ \| '__| |/ __|/ _` |   | | __ / _ \/ _ \ |/ / `--. \/ _ \ / __|
| \__/\ (_| | |_) | |  | | (__| (_| | _ | |_\ \  __/  __/   < /\__/ / (_) | (__ 
 \____/\__,_| .__/|_|  |_|\___|\__,_|(_) \____/\___|\___|_|\_\\\____/ \___/ \___|
            | |                                                                   
            |_|                                                                   

Primary Contact: GSAG - gsag@geeksoc.org 
Purpose: Xen dom0 for Core services

This server is Puppet managed - local changes may be overwritten!

" 
    }


	# Roles
	include global
}
