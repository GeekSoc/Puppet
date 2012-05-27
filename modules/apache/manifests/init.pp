class apache {
	
	package { "httpd":
		name => $operatingsystem ? {
	       "Debian" => "apache2",
	       default  => "httpd",
	    },
        ensure => installed,
    }

    service { "httpd":
		name => $operatingsystem ? {
	       "Debian" => "apache2",
	       default  => "httpd",
	    },
        enable    => true,
        ensure    => running,
        hasstatus => true,
        require   => Package["httpd"],
    }

	file { "httpd.conf":
		path => $operatingsystem ? {
	       "Debian" => "/etc/apache2/apache2.conf",
	       default  => "/etc/httpd/conf/httpd.conf",
	    },
        owner   => "root",
        group   => "root",
        mode    => 0644,
        source  => "puppet:///modules/apache/httpd.conf.el6",
        notify  => Service["httpd"],
        require => Package["httpd"],
    }

	file { "/var/www/vhosts":
        owner  => "root",
        group  => "root",
        mode   => 0755,
        ensure => directory,
    }

	if $operatingsystem == 'centos' {
		# PHP
		file { "/etc/httpd/conf.d/php.conf":
	        owner   => "root",
	        group   => "root",
	        mode    => 0644,
	        source  => "puppet:///modules/apache/php.conf.el6",
	        notify  => Service["httpd"],
	        require => Package["httpd"],
	    }
	}
	
}

define apache::website (
    $server_aliases = [],
    $server_admin = "support@geeksoc.org" 
) {    
	
	if $operatingsystem == 'debian' {
		$notify  = 'Exec["enable-${vhost_domain}-vhost"]'
	} else {
		$notify  = 'Service["httpd"]'
	}
	
    file { "vhost.conf":
		path => $operatingsystem ? {
	       "Debian" => "/etc/apache2/sites-available/$name.conf",
	       default  => "/etc/httpd/conf.d/$name.conf",
	    },
        owner   => "root",
        group   => "root",
        mode    => 0644,
        content => template("apache/website.conf.erb"),
		notify => $notify,
        require => Package["httpd"],
    }
	file { "/var/www/vhosts/$name":
        owner  => "root",
        group  => "root",
        mode   => 0755,
        ensure => directory,
    }
	file { "/var/www/vhosts/$name/public_html":
        owner  => "root",
        group  => "root",
        mode   => 0755,
        ensure => directory,
    }

	exec { "enable-${vhost_domain}-vhost":
		command     => "/usr/sbin/a2ensite ${vhost_domain}.conf",
		require     => [ File["/etc/apache2/sites-available/${vhost_domain}.conf"] ],
		refreshonly => true,
		notify      => Service["httpd"],
	}

}