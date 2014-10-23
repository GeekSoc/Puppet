class web {
	
  class {'ssh::sshd':
        sshd_config_AllowGroups => 'deploy sysadmin gsag root',
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
	include mysql
	include mysql::phpMyAdmin
	include etherpad-lite
	
	apache::website { "geeksoc.org":
    server_aliases => [ "www.geeksoc.org" ],
		https => true,
  }
	apache::website { "bugs.geeksoc.org":
    server_aliases => [ "www.bugs.geeksoc.org" ],
		https => true,
  }
	apache::website { "dev.geeksoc.org":
   server_aliases => [ "www.dev.geeksoc.org" ],
		https => true,
  }
	apache::website { "wiki.geeksoc.org":
    server_aliases => [ "www.wiki.geeksoc.org" ],
		https => true,
  }
	apache::phpapp { "accounts.geeksoc.org":
    server_aliases => [ "www.accounts.geeksoc.org" ],
	  app_name => "gas-client",
		https => true,
  }
  apache::phpapp {"api.accounts.geeksoc.org":
    server_aliases => [ "www.api.accounts.geeksoc.org" ],
		app_name => "gas-api",
    https          => true,
  }
	apache::website { "stats.irc.geeksoc.org":
    server_aliases => [ "www.irc.stats.geeksoc.org" ],
		https => true,
  }
	apache::website { "webmail.geeksoc.org":
    server_aliases => [ "www.webmail.geeksoc.org" ],
		https => true,
  }
	apache::website { "isac.geeksoc.org":
    server_aliases => [ "www.isac.geeksoc.org" ],
		https => true,
  }
	apache::website { "hackathon.geeksoc.org":
    server_aliases => [ "www.hackathon.geeksoc.org" ],
		https => true,
  }
    include global
}
