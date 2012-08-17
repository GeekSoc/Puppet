class web {
	
	mount { "/home":
        device  => "storage.geeksoc.org:/home",
        fstype  => "nfs",
        ensure  => "mounted",
        options => "rw,hard,intr",
        atboot  => true,
    }

	include apache
	include php
	include mysql
	include mysql::phpMyAdmin
	
	apache::website { "geeksoc.org":
        server_aliases => [ "www.geeksoc.org" ],
    }
	apache::website { "bugs.geeksoc.org":
        server_aliases => [ "www.bugs.geeksoc.org" ],
    }
	apache::website { "dev.geeksoc.org":
        server_aliases => [ "www.dev.geeksoc.org" ],
    }
	apache::website { "wiki.geeksoc.org":
        server_aliases => [ "www.wiki.geeksoc.org" ],
    }
	apache::website { "accounts.geeksoc.org":
        server_aliases => [ "www.accounts.geeksoc.org" ],
    }
	apache::website { "stats.irc.geeksoc.org":
        server_aliases => [ "www.irc.stats.geeksoc.org" ],
    }

    include global
}
