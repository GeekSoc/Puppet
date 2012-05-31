class nagios::nrpe {
	
	case $::architecture {
		i386: {
			$pluginsdir  = "/usr/lib/nagios/plugins"
		}
		default: {
			$pluginsdir  = "/usr/lib64/nagios/plugins"
		}
	}
	case $::operatingsystem {
		debian: {
			$nrpepackage   = [ "nagios-nrpe-server" ]
			$nrpeplugins   = [ "nagios-plugins" ]
			$nrpeservice   = [ "nagios-nrpe-server" ]
			$nrpeuser      = [ "nagios" ]
			$nrpepidfile   = [ "/var/run/nrpe.pid"]
		}
		centos, redhat: {
			$nrpepackage   = [ "nrpe" ]
			$nrpeplugins   = [ "nagios-plugins" ]
			$nrpeservice   = [ "nrpe" ]
			$nrpeuser      = [ "nrpe" ]
			$nrpepidfile   = [ "/var/run/nrpe/nrpe.pid"]
		}
	}
	
	package { 
		[$nrpepackage, $nrpeplugins]: 
		ensure => present,
	}
   
 	service { $nrpeservice: 
		ensure => running, 
		enable => true 
	}
	 
	


	file { "/etc/nagios/nrpe.cfg":
		mode    => "644",
		owner   => root,
		group   => root,
		content => template("nagios/nrpe.cfg.erb"),
		require => Package[$nrpepackage],
	}
}