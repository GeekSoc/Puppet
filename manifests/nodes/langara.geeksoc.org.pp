
node 'langara.geeksoc.org' {

	# Modules

	# Message of the day
	file { '/etc/motd':
        content => "
 _                                        _____           _                   
| |                                      |  __ \         | |                  
| |     __ _ _ __   __ _  __ _ _ __ __ _ | |  \/ ___  ___| | _____  ___   ___ 
| |    / _` | '_ \ / _` |/ _` | '__/ _` || | __ / _ \/ _ \ |/ / __|/ _ \ / __|
| |___| (_| | | | | (_| | (_| | | | (_| || |_\ \  __/  __/   <\__ \ (_) | (__ 
\_____/\__,_|_| |_|\__, |\__,_|_|  \__,_(_)____/\___|\___|_|\_\\\____/ \___/ \___|
                   __/ |                                                     
                  |___/                                                      

Primary Contact: GSAG - gsag@geeksoc.org
Purpose: Mail server

This server is Puppet managed - local changes may be overwritten!

" 
    }

	# Roles
	include global
	include mail
}
