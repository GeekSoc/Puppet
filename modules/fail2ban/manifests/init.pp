class fail2ban {
    package { "fail2ban":
        ensure => installed,
    }
	service { "fail2ban": 
		ensure => running, 
		enable => true 
	}

    file { "/etc/fail2ban/fail2ban.conf":
        ensure => present,
        source => "puppet:///modules/fail2ban/fail2ban.conf",
		notify => Service["fail2ban"]
    }

    file { "/etc/fail2ban/jail.conf":
        ensure => present,
        source => "puppet:///modules/fail2ban/jail.conf",
		notify => Service["fail2ban"]
    }
}
