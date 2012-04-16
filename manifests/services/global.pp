class global {

	$users_auth = 'ldap'
	$users_ldap_servers = ['ldap.geeksoc.org']
	$users_ldap_basedn = 'dc=geeksoc,dc=org'
	$users_ldap_ssl = 'no'

	include users
	include sudo
    include ssh::sshd
    include ssh::known_hosts
	include munin::node

    class { "ntp":
        servers       => [ 'ntp0.net.strath.ac.uk',
                           'ntp1.net.strath.ac.uk',
                           'ntp2.net.strath.ac.uk',
                           'ntp3.net.strath.ac.uk', ],
        autoupdate    => false,
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
