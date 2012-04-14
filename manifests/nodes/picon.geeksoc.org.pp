
node 'picon.geeksoc.org' inherits basenode {
	$sshd_config_PermitRootLogin = 'yes'
	$sshd_config_AllowGroups = 'gssg gsag root'
	
	include global
}
