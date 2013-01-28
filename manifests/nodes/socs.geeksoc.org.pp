
node 'socs.geeksoc.org' {

	# Modules
	
	# Message of the day
	file { '/etc/motd':
        content => " 
 _____                      _____           _     _____            
/  ___|                    |  __ \         | |   /  ___|           
\ `--.  ___   ___ ___      | |  \/ ___  ___| | __\ `--.  ___   ___ 
 `--. \/ _ \ / __/ __|     | | __ / _ \/ _ \ |/ / `--. \/ _ \ / __|
/\__/ / (_) | (__\__ \  _  | |_\ \  __/  __/   < /\__/ / (_) | (__ 
\____/ \___/ \___|___/ (_)  \____/\___|\___|_|\_\\\____/ \___/ \___|

Primary Contact: GSAG - gsag@geeksoc.org
Purpose: Clubs & Socs Web Server

This server is Puppet managed - local changes may be overwritten!

" 
    }

	include apache
	include php
	include mysql
	include mysql::phpMyAdmin
	
	nfs::share { "home":
        path    => "/var/www/vhosts",
        allowed => "130.159.141.64/26",
        options => "rw,sync,no_subtree_check",
    }
	
	apache::website { "socs.geeksoc.org":
        server_aliases => [ "www.socs.geeksoc.org", "clubs.geeksoc.org", "www.clubs.geeksoc.org"],
		# https => true,
    }

	apache::website { "strathclydefusion.com":
	    server_aliases => [ "www.strathclydefusion.com", "fusion.clubs.geeksoc.org"],
		server_admin => "systems@strathclydefusion.com",
		groupname => "soc-fusion",
	}

    include global
}
