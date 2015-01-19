class haproxy {
  
  package { 'haproxy':
    ensure => installed,
  }
  
    service { 'haproxy':
        enable    => true,
        ensure    => running,
        hasstatus => true,
        require   => Package['haproxy'],
    }
  
  file { '/etc/haproxy/haproxy.cfg':
    ensure    => present,
    owner     => 'root',
        group => 'root',
        mode  => '0644',
    content   => template('haproxy/haproxy.cfg.erb'),
    notify    => Service['haproxy']
  }
  
  file { '/etc/haproxy/custom_errors':
    ensure      => directory,
        source  => 'puppet:///modules/haproxy/errors/',
        owner   => root,
        group   => root,
        recurse => true,
    replace     => true,
    purge       => true, # purge all unmanaged junk
    force       => true, # also purge subdirs and links etc.
    notify      => Service['haproxy']
    }
  
}