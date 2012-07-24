
node 'tauron.geeksoc.org' {

	# Message of the day
	file { '/etc/motd':
        content => "
 _____                                 _____           _     _____            
|_   _|                               |  __ \         | |   /  ___|           
  | | __ _ _   _ _ __ ___  _ __       | |  \/ ___  ___| | __\ `--.  ___   ___ 
  | |/ _` | | | | '__/ _ \| '_ \      | | __ / _ \/ _ \ |/ / `--. \/ _ \ / __|
  | | (_| | |_| | | | (_) | | | |  _  | |_\ \  __/  __/   < /\__/ / (_) | (__ 
  \_/\__,_|\__,_|_|  \___/|_| |_| (_)  \____/\___|\___|_|\_\\\____/ \___/ \___|
                                                          

Primary Contact: GSAG - gsag@geeksoc.org 
Purpose: Xen dom0 for Development Boxes

This server is Puppet managed - local changes may be overwritten!

" 
    }


	# Roles
	include global
}
