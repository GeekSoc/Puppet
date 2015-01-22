# This class has all the web based configuration
class web {
  
  class {'ssh::sshd':
        sshd_config_AllowGroups => 'deploy sysadmin gsag root',
  }
  
  mount { '/home':
        ensure  => 'mounted',
        device  => 'storage.geeksoc.org:/home',
        fstype  => 'nfs',
        options => 'rw,hard,intr',
        atboot  => true,
    }

  class { 'apache':
      
        default_ssl_cert => '/etc/pki/tls/certs/ca.crt',
        default_ssl_key  => '/etc/pki/tls/private/ca.key',
  }
  include apache::mod::php

  include mysql
  include mysql::phpMyAdmin
  include etherpad-lite
  
  custom::apache::website { 'geeksoc.org':
    server_aliases => [ 'www.geeksoc.org' ],
    https          => true,
  }
  custom::apache::website { 'bugs.geeksoc.org':
    server_aliases => [ 'www.bugs.geeksoc.org' ],
    https          => true,
  }
  custom::apache::website { 'dev.geeksoc.org':
    server_aliases => [ 'www.dev.geeksoc.org' ],
    https          => true,
  }
  custom::apache::website { 'wiki.geeksoc.org':
    server_aliases => [ 'www.wiki.geeksoc.org' ],
    https          => true,
  }
  custom::apache::phpapp { 'accounts.geeksoc.org':
    server_aliases => [ 'www.accounts.geeksoc.org' ],
    app_name       => 'gas-client',
    https          => true,
  }
  custom::apache::phpapp {'api.accounts.geeksoc.org':
    server_aliases => [ 'www.api.accounts.geeksoc.org' ],
    app_name       => 'gas-api',
    https          => true,
  }
  custom::apache::website { 'stats.irc.geeksoc.org':
    server_aliases => [ 'www.irc.stats.geeksoc.org' ],
    https          => true,
  }
  custom::apache::website { 'webmail.geeksoc.org':
    server_aliases => [ 'www.webmail.geeksoc.org' ],
    https          => true,
  }
  custom::apache::website { 'isac.geeksoc.org':
    server_aliases => [ 'www.isac.geeksoc.org' ],
    https          => true,
  }
  custom::apache::website { 'hackathon.geeksoc.org':
    server_aliases => [ 'www.hackathon.geeksoc.org' ],
    https          => true,
  }
    include global
}
