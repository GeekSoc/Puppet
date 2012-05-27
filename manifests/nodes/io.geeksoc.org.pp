
node 'io.geeksoc.org' {

	# Modules
	include varnish
	include nginx

	# Message of the day
	file { '/etc/motd':
        content => "
 _____             _____           _     _____            
|_   _|           |  __ \         | |   /  ___|           
  | |   ___       | |  \/ ___  ___| | __\ `--.  ___   ___ 
  | |  / _ \      | | __ / _ \/ _ \ |/ / `--. \/ _ \ / __|
 _| |_| (_) |  _  | |_\ \  __/  __/   < /\__/ / (_) | (__ 
 \___/ \___/  (_)  \____/\___|\___|_|\_\\\____/ \___/ \___|

Primary Contact: GSAG - gsag@geeksoc.org
Purpose: Varnish reverse proxy

This server is Puppet managed - local changes may be overwritten!

" 
    }
	
	# Roles
	include global
}
