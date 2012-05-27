
node 'mirror.geeksoc.org' {

	# Modules
	include apache


	# fosdem videos
	cron { rsyncFOSDEM:
	  command => "/usr/bin/rsync -rv rsync://video.fosdem.org/video /var/www/vhosts/mirror.geeksoc.org/public_html/fosdem/ --delete",
	  user => root,
	  hour => 4,
	  minute => 30
	}

	apache::website { "mirror.geeksoc.org":
        server_aliases => [ "www.mirror.geeksoc.org" ],
    }


	# Stop annoying syslog messages
	service { "mpt-statusd":
		ensure => stopped,
		enable => false,
	}
	
	
	# Message of the day
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


	# Roles
	include global
}
