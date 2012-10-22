
node 'web.geeksoc.org' {

	# Modules
	
	# Message of the day
	file { '/etc/motd':
        content => " 
 _    _      _           _____           _     _____            
| |  | |    | |         |  __ \         | |   /  ___|           
| |  | | ___| |__       | |  \/ ___  ___| | __\ `--.  ___   ___ 
| |/\| |/ _ \ '_ \      | | __ / _ \/ _ \ |/ / `--. \/ _ \ / __|
\  /\  /  __/ |_) |  _  | |_\ \  __/  __/   < /\__/ / (_) | (__ 
 \/  \/ \___|_.__/  (_)  \____/\___|\___|_|\_\\\____/ \___/ \___|

Primary Contact: GSAG - gsag@geeksoc.org
Purpose: Primary Web Server

This server is Puppet managed - local changes may be overwritten!

" 
    }
	
	mount { "/home":
        device  => "storage.geeksoc.org:/home",
        fstype  => "nfs",
        ensure  => "mounted",
        options => "rw,hard,intr",
        atboot  => true,
    }

	include apache
	include php
	# include mysql
	# include mysql::phpMyAdmin
	# include etherpad-lite
	
	apache::website { "geeksoc.org":
        server_aliases => [ "www.geeksoc.org" ],
		# https => true,
    }
	apache::website { "bugs.geeksoc.org":
        server_aliases => [ "www.bugs.geeksoc.org" ],
		# https => true,
    }
	apache::website { "dev.geeksoc.org":
        server_aliases => [ "www.dev.geeksoc.org" ],
		# https => true,
    }
	apache::website { "wiki.geeksoc.org":
        server_aliases => [ "www.wiki.geeksoc.org" ],
		# https => true,
    }
	apache::website { "accounts.geeksoc.org":
        server_aliases => [ "www.accounts.geeksoc.org" ],
		# https => true,
    }
	apache::website { "stats.irc.geeksoc.org":
        server_aliases => [ "www.irc.stats.geeksoc.org" ],
		# https => true,
    }

    include global
}
