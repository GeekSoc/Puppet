class global {

	$users_auth = 'ldap'
	$users_ldap_servers = ['ldap.geeksoc.org']
	$users_ldap_basedn = 'dc=geeksoc,dc=org'
	$users_ldap_ssl = 'no'
	$syslog_server = 'picon.geeksoc.org'

	include users
	include sudo
    include ssh::sshd
    include ssh::known_hosts
	include munin::node
	include rsyslog
	include fail2ban

    class { "ntp":
        servers       => [ 'ntp0.net.strath.ac.uk',
                           'ntp1.net.strath.ac.uk',
                           'ntp2.net.strath.ac.uk',
                           'ntp3.net.strath.ac.uk', ],
        autoupdate    => false,
    }

	cron { "run-puppet":
		command => "/usr/bin/puppet agent --test > /dev/null",
		minute  => inline_template("<%= hostname.hash.abs % 30 %>"),
	}
	cron { "run-puppet2":
		command => "/usr/bin/puppet agent --test > /dev/null",
		minute  => inline_template("<%= hostname.hash.abs % 30 + 30 %>"),
	}
	service { "puppet":
		ensure => stopped,
		enable => false,
	}

	###################
	# Global Packages #
	###################
	case $::operatingsystem {
        debian, ubuntu: {
            $vim_name = "vim"
        }
        centos, redhat: {
            $vim_name = "vim-enhanced"
        }
    }

    package { [ "screen",
                "tmux",
                "git",
                "bash-completion",
                "htop",
                "${vim_name}", ]:
        ensure => installed,
    }

}
