class global {

	include sudo
    include ssh::sshd
    include ssh::known_hosts

    class { "ntp":
        servers       => [ 'ntp0.net.strath.ac.uk',
                           'ntp1.net.strath.ac.uk',
                           'ntp2.net.strath.ac.uk',
                           'ntp3.net.strath.ac.uk', ],
        autoupdate    => false,
    }

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
