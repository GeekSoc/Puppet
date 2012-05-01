
node 'mirror.geeksoc.org' {

file { '/etc/motd':
       content => "
___  ____                           _____           _     _____            
|  \/  (_)                         |  __ \         | |   /  ___|           
| .  . |_ _ __ _ __ ___  _ __      | |  \/ ___  ___| | __\ `--.  ___   ___ 
| |\/| | | '__| '__/ _ \| '__|     | | __ / _ \/ _ \ |/ / `--. \/ _ \ / __|
| |  | | | |  | | | (_) | |     _  | |_\ \  __/  __/   < /\__/ / (_) | (__ 
\_|  |_/_|_|  |_|  \___/|_|    (_)  \____/\___|\___|_|\_\\\____/ \___/ \___|

Primary Contact: Kenny Coyle - kcoyle@geeksoc.org
Purpose: Mirror server (FOSDEM, GCDS)

This server is Puppet managed - local changes may be overwritten!

" 
   }

	service { "mpt-statusd":
		ensure => stopped,
		enable => false,
	}

	include global
}
