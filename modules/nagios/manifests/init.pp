 class nagios::nrpe {
	
	case $::architecture {
		i386: {
			$pluginsdir  = "/usr/lib/nagios/plugins"
		}
		amd64: {
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
			$nrpepidfile   = [ "/var/run/nagios/nrpe.pid"]
			$diskroot      = [ "/" ]
		}
		centos, redhat: {
			$nrpepackage   = [ "nrpe" ]
			$nrpeplugins   = [ "nagios-plugins" ]
			$nrpeservice   = [ "nrpe" ]
			$nrpeuser      = [ "nrpe" ]
			$nrpepidfile   = [ "/var/run/nrpe/nrpe.pid"]
			$diskroot      = [ "/dev/root" ]
		}
		Solaris: {
                        $nrpepackage   = [ "nrpe" ]
                        $nrpeplugins   = [ "nrpe_plugin" ]
                        $nrpeservice   = [ "cswnrpe" ]
                        $nrpeuser      = [ "nrpe" ]
                        $nrpepidfile   = [ "/var/run/nrpe/nrpe.pid"]
                        $diskroot      = [ "/" ]
                }

	}
	
	package { 
		[$nrpepackage, $nrpeplugins]: 
		ensure => present,
	}
   
 	service { $nrpeservice: 
		ensure => running, 
		enable => true,
		hasrestart => true,
		pattern => "nrpe",
	}
	 
	


	file { "/etc/nagios/nrpe.cfg":
		mode    => "644",
		owner   => root,
		group   => root,
		content => template("nagios/nrpe.cfg.erb"),
		require => [Package[$nrpepackage],File["/etc/nagios"]],
		notify => Service[$nrpeservice],
	}

        file { "/etc/nagios":
                ensure => "directory",
        }

}

class nagios::server {
	
    user { 'www-data': groups => 'nagios' }
	
	package {
		["nagios3",
		 "nagios-nrpe-plugin",
		]: ensure => present,
	}
	
	service { nagios3: 
		ensure => running, 
		enable => true,
		hasrestart => true,
	}
	
	file { '/etc/nagios3/conf.d':
		ensure => directory,
        source => 'puppet:///modules/nagios/conf.d/',
        owner => nagios,
        group => nagios,
        recurse => true,
		replace => true,
		purge => true, # purge all unmanaged junk
		force => true, # also purge subdirs and links etc.
		notify => Service["nagios3"]
    }

    file { '/etc/nagios3/nagios.cfg':
		source => 'puppet:///modules/nagios/nagios.cfg',
		ensure => present,
		notify => Service["nagios3"]
    }

    file { '/etc/nagios3/cgi.cfg':
		source => 'puppet:///modules/nagios/cgi.cfg',
		ensure => present,
		notify => Service["nagios3"]
    }

    file { '/etc/nagios3/commands.cfg':
		source => 'puppet:///modules/nagios/commands.cfg',
		ensure => present,
		notify => Service["nagios3"]
    }

	file { "/etc/apache2/sites-enabled/nagios.geeksoc.org":
		source => 'puppet:///modules/nagios/nagios-apache.conf',
		ensure => present,
	}
}
