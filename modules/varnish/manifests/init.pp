class varnish {
    
    package { 'varnish':
        ensure => installed,
    }
    
    service { 'varnish':
        ensure    => running,
        enable    => true,
        hasstatus => true,
        require   => Package['varnish'],
    }
    
    file { '/etc/varnish/default.vcl':
        ensure => present,
        owner  => 'root',
        group  => 'root',
        mode   => '0644',
        source => 'puppet:///modules/varnish/config.vcl',
        notify => Service['varnish']
    }
    
}