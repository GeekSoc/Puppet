class nginx {
	
    package { "nginx": 
		ensure => installed 
	}
    
	service { "nginx":
        enable => true,
        ensure => running,
		hasstatus => true,
        restart   => "/usr/sbin/service nginx reload",
        require   => Package["nginx"],
    }

    file { "/etc/nginx/nginx.conf":
		owner   => "root",
        group   => "root",
        mode    => 0644,
        source  => "puppet:///modules/nginx/nginx.conf",
        notify  => Service["nginx"],
        require => Package["nginx"],
	} 
	
	# Config for SSL reverse proxy
	file { "/etc/nginx/sites-available/geeksoc.org":
		owner   => "root",
        group   => "root",
        mode    => 0644,
        source  => "puppet:///modules/nginx/geeksoc_ssl.conf",
        notify  => Service["nginx"],
        require => Package["nginx"],
	}
	file { "/etc/nginx/sites-enabled/geeksoc.org":
	    ensure  => link,
	    target  => "/etc/nginx/sites-available/geeksoc.conf",
	    require => File["/etc/nginx/sites-available/geeksoc.org"],
	    notify => Package["nginx"],
	}
}
