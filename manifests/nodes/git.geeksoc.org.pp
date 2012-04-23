
node 'git.geeksoc.org' {

	$sshd_config_AllowGroups = 'git gssg gsag root'

	include global
}
