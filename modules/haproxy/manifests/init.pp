class haproxy {
	
	package { "haproxy":
		ensure => installed,
	}
	
    service { "haproxy":
        enable    => true,
        ensure    => running,
        hasstatus => true,
        require   => Package["haproxy"],
    }
	
	file { "/etc/haproxy/haproxy.cfg":
		ensure => present,
		owner   => "root",
        group   => "root",
        mode    => 0644,
		content => template("haproxy/haproxy.cfg.erb"),
		notify => Service["haproxy"]
	}
	
}