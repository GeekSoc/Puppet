class ssh::sshd (
  $sshd_config_AllowGroups = "sysadmin gsag root",
  $sshd_config_PasswordAuthentication = "yes",
  $sshd_config_AllowTcpForwarding = "yes",
  $sshd_config_StrictModes = "yes",
  $sshd_config_PermitRootLogin = "yes",
  $sshd_config_PermitTunnel = "yes",
  ) {

	case $::operatingsystem {
		debian, ubuntu: {
			$config_tpl = "sshd.conf.debian.erb"
			$pkg_name   = [ "ssh" ]
		}
		centos, redhat: {
			$config_tpl = "sshd.conf.el.erb"
			$pkg_name   = [ "sshd" ]
		}
		Solaris: {
			$config_tpl = "sshd.conf.sol.erb"
                        $pkg_name   = [ "ssh" ]
		}
	}
	
	package { openssh-server: ensure => present }
    service { $pkg_name: ensure => running, enable => true }

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
