class munin::node {
	
	package { "munin-node": ensure => installed }
	service { "munin-node":	ensure => running, enable => true }
	
	file { "/etc/munin/munin-node.conf":
		source => 'puppet:///modules/munin/munin-node.conf',
		ensure => present,
		notify => Service["munin-node"]
	}

}

class munin::server {
	
	package { "munin": ensure => installed }
	service { "munin":	ensure => running}
	
	file { "/etc/munin/munin.conf":
		source => 'puppet:///modules/munin/munin.conf',
		ensure => present,
	}

	file { "/etc/apache2/sites-enabled/munin.geeksoc.org":
		source => 'puppet:///modules/munin/munin-apache.conf',
		ensure => present,

	}
}
