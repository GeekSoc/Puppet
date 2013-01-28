class apache {
	
	case $::operatingsystem {
		debian: {
			$apacheuser = [ "www-data" ]
		}
		centos, redhat: {
			$apacheuser = [ "apache" ]
		}
	}
	
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
		source  => $operatingsystem ? {
	       "Debian" => "puppet:///modules/apache/httpd.conf.deb",
	       default  => "puppet:///modules/apache/httpd.conf.el6",
	    },
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
    $server_admin = "support@geeksoc.org",
 	$https = false,
	$groupname = $apacheuser
) {    
	
    file { "${name}.conf":
		path => $operatingsystem ? {
	       "Debian" => "/etc/apache2/sites-enabled/$name.conf",
	       default  => "/etc/httpd/conf.d/$name.conf",
	    },
        owner   => "root",
        group   => "root",
        mode    => 0644,
        content => template("apache/website.conf.erb"),
		notify => Service["httpd"],
        require => Package["httpd"],
    }
	file { "/var/www/vhosts/$name":
        owner  => $apacheuser,
        group  => $groupname,
        mode   => 0775,
        ensure => directory,
    }
	file { "/var/www/vhosts/$name/public_html":
        owner  => $apacheuser,
        group  => $groupname,
        mode   => 0755,
        ensure => directory,
    }

}