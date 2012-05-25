class openvpn {
	
	package { "openvpn":
		ensure => installed,
	}
	
	service { "openvpn":
        enable    => true,
        ensure    => running,
        hasstatus => true,
        require   => Package["openvpn"],
    }

	file { "/etc/openvpn/server.conf":
		ensure => present,
		owner   => "root",
        group   => "root",
        mode    => 0644,
        source => "puppet:///modules/openvpn/server443.conf",
		notify => Service["openvpn"]
	}
	file { "/etc/openvpn/server2.conf":
		ensure => present,
		owner   => "root",
        group   => "root",
        mode    => 0644,
        source => "puppet:///modules/openvpn/server1194.conf",
		notify => Service["openvpn"]
	}
	file { "/etc/openvpn/auth/auth-ldap.conf":
		ensure => present,
		owner   => "root",
        group   => "root",
        mode    => 0644,
        source => "puppet:///modules/openvpn/auth_ldap.conf",
		notify => Service["openvpn"]
	}
}