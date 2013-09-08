class postfix::mailman {

  package { "mailman":
    ensure => installed,
  }
  
  service { "mailman":
    enable    => true,
    ensure    => running,
    require   => Package["mailman"],
  }
  
  package { "apache2":
    ensure => installed,
  }
  
  file { "/etc/apache2/sites-enabled/mm.cfg":
    ensure => present,
    owner  => "root",
    group  => "root",
    mode   => 0644,
    source => 'puppet:///modules/postfix/mailman/apache.conf',
    notify => Service[$postfix::params::package],
  }


}
