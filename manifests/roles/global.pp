# Every geeksoc server should have this included
class global {

    $users_auth = 'ldap'
    $users_ldap_servers = ['ldap.geeksoc.org']
    $users_ldap_basedn = 'dc=geeksoc,dc=org'
    $users_ldap_ssl = 'yes'
    $syslog_server = 'picon.geeksoc.org'

    include custom
    include ssh::sshd
    include ssh::known_hosts
    include munin::node
    include rsyslog
    include resolv
    include gs-scripts::retrieve_public_keys

    class { 'nagios::client':
        nrpe_allowed_hosts => '130.159.141.90',
    }

    case $::operatingsystem {
        Solaris: {  }
        default: {
            include users
            include sudo
            include fail2ban
        }
    }

    resolv_conf { 'geeksoc.org':
        domainname  => 'geeksoc.org',
        searchpath  => ['geeksoc.org'],
        nameservers => ['130.159.141.75', '130.159.141.81'],
    }

    class { 'ntp':
        servers    => [
            'ntp0.net.strath.ac.uk',
            'ntp1.net.strath.ac.uk',
            'ntp2.net.strath.ac.uk',
            'ntp3.net.strath.ac.uk', ],
        autoupdate => false,
    }

    cron { 'run-puppet':
        command => '/usr/bin/puppet agent --test > /dev/null',
        minute  => inline_template('<%= hostname.hash.abs % 30 %>'),
    }
    cron { 'run-puppet2':
        command => '/usr/bin/puppet agent --test > /dev/null',
        minute  => inline_template('<%= hostname.hash.abs % 30 + 30 %>'),
    }
    service { 'puppet':
        ensure => stopped,
        enable => false,
    }

    #Ensure root password is the same
    user { 'root':
        ensure   => present,
        password => extlookup('root_pw'),
    }

    ###################
    # Global Packages #
    ###################
    case $::operatingsystem {
        debian, ubuntu, Solaris: {
            $vim_name = 'vim'
            $netcat_name = 'netcat'
        }
        centos, redhat: {
            $vim_name = 'vim-enhanced'
            $netcat_name = 'nc'
        }
        default: {
            $vim_name = 'vim'
            $netcat_name = 'netcat'
        }
    }

    package {
        [   'screen',
            'tmux',
            'git',
            'bash-completion',
            'htop',
            'nano',
            'iftop',
            'python',
            'python-ldap',
            'zsh',
            $netcat_name,
            $vim_name,
        ]:
        ensure => installed,
    }

}
