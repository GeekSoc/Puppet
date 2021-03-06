class mysql {
  
  package { 'mysql-server':
        ensure => installed,
    }

  package { 'mysql':
    name       => $operatingsystem ? {
         'Debian' => 'mysql-client',
         default  => 'mysql',
      },
        ensure => installed,
    }

    service { 'mysqld':
    name        => $operatingsystem ? {
         'Debian' => 'mysql',
         default  => 'mysqld',
      },
        enable  => true,
        ensure  => running,
        # hasstatus => true,
        require => Package['mysql-server'],
    }

  file { '/etc/my.cnf':
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
    source      => $operatingsystem ? {
         'Debian' => 'puppet:///modules/mysql/my.cnf.deb',
         default  => 'puppet:///modules/mysql/my.cnf.el6',
      },
        notify  => Service['mysqld'],
        require => Package['mysql-server'],
    }

# Sample Use:
# 
# mysql::db { "johnstest":
#   user => "john",
#   password => "johnstest",
# }
  define db( $user, $password ) {
    include mysql
    
    exec { "create-${name}-db":
        unless  => "/usr/bin/mysql -u${user} -p${password}
		    ${name}",
        command => "/usr/bin/mysql -uroot -p${mysql_password} -e
		    \"create database ${name}; grant all on ${name}.* to
		    ${user}@localhost identified by '${password}'; flush
		    privileges;\"",
        require => Service['mysql'],
    }
  }

}

class mysql::phpMyAdmin {
  package { 'phpMyAdmin':
    ensure => installed,
  }
}