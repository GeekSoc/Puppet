class munin::node {
	
	package { "munin-node": ensure => installed }
	service { "munin-node":	ensure => running, enable => true }
	
	file { "/etc/munin-node.conf":
		source => 'puppet:///modules/munin/munin-node.conf',
		ensure => file,
		notify => Service["munin-node"]
	}
}