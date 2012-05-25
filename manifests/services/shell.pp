class shell {
	$sshd_config_AllowGroups = 'members gssg gsag root'
	include gs-scripts::listusers
	
    include global
}
