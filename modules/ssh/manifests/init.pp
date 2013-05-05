class ssh::sshd {

	case $::operatingsystem {
		debian, ubuntu: {
			$config_tpl = "sshd.conf.debian.erb"
			$pkg_name   = [ "ssh" ]
		}
		centos, redhat: {
			$config_tpl = "sshd.conf.el.erb"
			$pkg_name   = [ "sshd" ]
		}
	}
	
	package { openssh-server: ensure => present }
    service { $pkg_name: ensure => running, enable => true }

	$sshd_config_PasswordAuthentication = $sshd_config_PasswordAuthentication ? {
	    '' => "yes",
	    default => $sshd_config_PasswordAuthentication
	}

	$sshd_config_AllowTcpForwarding = $sshd_config_AllowTcpForwarding ? {
	    '' => "yes",
	    default => $sshd_config_AllowTcpForwarding
	}

	$sshd_config_StrictModes = $sshd_config_StrictModes ? {
	    '' => "yes",
	    default => $sshd_config_StrictModes
	}

	$sshd_config_PermitRootLogin = $sshd_config_PermitRootLogin ? {
	    '' => "yes",
	    default => $sshd_config_PermitRootLogin
	}

	$sshd_config_PermitTunnel = $sshd_config_PermitTunnel ? {
	    '' => "yes",
	    default => $sshd_config_PermitTunnel
	}
	
	$sshd_config_AllowGroups = $sshd_config_AllowGroups ? {
	    '' => "sysadmin gsag root",
	    default => $sshd_config_AllowGroups
	}
	
	
	file { "/etc/ssh/sshd_config":
        content => template("ssh/${config_tpl}"),
        mode => 0600,
        notify => Service["${pkg_name}"],
    }

}

class ssh::known_hosts {
    file { '/etc/ssh/ssh_known_hosts':
        source => 'puppet:///modules/ssh/known_hosts',
        require => Package['openssh-server']
    }
}