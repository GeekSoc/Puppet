class etherpad-lite {
	
	service { "etherpad-lite":
        enable    => true,
        ensure    => running,
        hasstatus => true,
        require   => File["/etc/init.d/etherpad-lite"],
    }
	
	user { etherpad-lite:
		ensure  => present,
		home    => "/srv/etherpad-lite",
		shell   => "/bin/bash",
		gid   => "etherpad-lite",
	}

	group { etherpad-lite:
		ensure => present,
	}
	
	file { "/srv/etherpad-lite":
	    ensure => "directory",
	    owner  => "etherpad-lite",
	    group  => "etherpad-lite",
	    mode   => 750,
	}
	
	file { "/etc/init.d/etherpad-lite":
		ensure => present,
		owner   => "root",
        group   => "root",
        mode    => 0744,
        source => "puppet:///modules/etherpad-lite/etherpad-lite.init",
	}
/*	
	file { "/srv/etherpad-lite/settings.json":
		ensure => present,
		owner   => "etherpad-lite",
        group   => "etherpad-lite",
        mode    => 0644,
		content => template("etherpad-lite/settings.json.erb"),
		notify => Service["etherpad-lite"]
	}
	*/
}