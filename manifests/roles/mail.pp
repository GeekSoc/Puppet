class mail {
        include postfix
	include dovecot
	
	class { 'dovecot':
	        plugins         => [ 'ldap' ],
	        protocols       => 'imap',
        }
}
