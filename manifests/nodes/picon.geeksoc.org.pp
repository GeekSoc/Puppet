
node 'picon.geeksoc.org' {
	$sshd_config_PermitRootLogin = 'no'
	
    nfs::share { "home":
        path    => "/home",
        allowed => "130.159.141.64/26",
        options => "rw,sync,no_subtree_check",
    }

	include global
}
