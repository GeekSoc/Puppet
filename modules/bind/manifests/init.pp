class bind {
  
  package { 'bind':
    ensure => installed,
  }
  package { 'bind-utils':
    ensure => installed,
  }
  
    service { 'named':
        enable    => true,
        ensure    => running,
        hasstatus => true,
        restart   => '/etc/init.d/named reload',
        require   => Package['bind'],
    }
  
  file { '/etc/named/zones/':
      ensure  => 'directory',
    owner     => 'root',
        group => 'root',
        mode  => '0644',
  }
  file { '/etc/named.conf':
    ensure     => present,
    owner      => 'root',
        group  => 'root',
        mode   => '0644',
        source => 'puppet:///modules/bind/named.el.conf',
    notify     => Service['named']
  }
  file { '/etc/named/zones/geeksoc.org.zone':
    ensure     => present,
        source => 'puppet:///modules/bind/zones/geeksoc.org.zone',
    notify     => Service['named']
  }
  file { '/etc/named/zones/141.159.130.in-addr.arpa.hosts':
    ensure     => present,
        source => 'puppet:///modules/bind/zones/141.159.130.in-addr.arpa.hosts',
    notify     => Service['named']
  }
}