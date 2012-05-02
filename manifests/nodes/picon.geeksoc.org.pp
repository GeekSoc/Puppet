
node 'picon.geeksoc.org' {
	$sshd_config_PermitRootLogin = 'no'
	
	include epylog
	
    nfs::share { "home":
        path    => "/home",
        allowed => "130.159.141.64/26",
        options => "rw,sync,no_subtree_check",
    }

	file { '/etc/motd':
        content => "
______ _                        _____           _     _____            
| ___ (_)                      |  __ \         | |   /  ___|           
| |_/ /_  ___  ___  _ __       | |  \/ ___  ___| | __\ `--.  ___   ___ 
|  __/| |/ __|/ _ \| '_ \      | | __ / _ \/ _ \ |/ / `--. \/ _ \ / __|
| |   | | (__| (_) | | | |  _  | |_\ \  __/  __/   < /\__/ / (_) | (__ 
\_|   |_|\___|\___/|_| |_| (_)  \____/\___|\___|_|\_\\\____/ \___/ \___|

Primary Contact: GSAG - gsag@geeksoc.org
Purpose: NFS, LDAP, DNS Server & Puppet Master

This server is Puppet managed - local changes may be overwritten!
-------------------

Bringing your files to you - Because we can!

" 
    }

	include global
}
