class apache {
	
	package { "httpd":
        ensure => installed,
    }

    service { "httpd":
        enable    => true,
        ensure    => running,
        hasstatus => true,
        restart   => "/sbin/service httpd graceful",
        require   => Package["httpd"],
    }

	file { "/etc/httpd/conf/httpd.conf":
        owner   => "root",
        group   => "root",
        mode    => 0644,
        source  => "puppet://modules/apache/httpd.conf.el6",
        notify  => Service["httpd"],
        require => Package["httpd"],
    }

	file { "/var/www/vhosts":
        owner  => "root",
        group  => "root",
        mode   => 0755,
        ensure => directory,
    }

	# PHP
	file { "/etc/httpd/conf.d/php.conf":
        owner   => "root",
        group   => "root",
        mode    => 0644,
        source  => "puppet://modules/apache/php.conf.el6",
        notify  => Service["httpd"],
        require => Package["httpd"],
    }

}

define apache::website (
    $server_aliases = [],
    $server_admin = "support@geeksoc.org" 
) {    
    file { "/etc/httpd/conf.d/$name.conf":
        owner   => "root",
        group   => "root",
        mode    => 0644,
        content => template("apache/website.conf.erb"),
        notify  => Service["httpd"],
        require => Package["httpd"],
    }

}