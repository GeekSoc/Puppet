node 'linn.strathclydefusion.com' {

    class {'ssh:sshd':
        sshd_config_AllowGroups => 'soc-fusion sysadmin gsag root',
    }

    class {'sudo':
        sudoers => '%soc-fusion',
    }

    #Roles
    include global

}
