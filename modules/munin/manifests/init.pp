class munin::node {
	
	package { "munin-node": ensure => installed }
	service { "munin-node":	ensure => running, enable => true }
	
	file { "/etc/munin/munin-node.conf":
		source => 'puppet:///modules/munin/munin-node.conf',
		ensure => present,
		notify => Service["munin-node"]
	}
	file { "/etc/munin-node.conf":
		ensure => purged,
	}
}