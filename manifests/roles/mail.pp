class mail {
  
  include postfix
	  
  class { 'dovecot':
      plugins                    => [ 'ldap', 'pigeonhole' ],
      protocols                  => 'imap sieve',
      verbose_proctitle          => 'yes',
      auth_include               => 'ldap',
      mail_location              => 'maildir:~/Maildir',
      auth_listener_userdb_mode  => '0660',
      auth_listener_userdb_group => 'vmail',
      auth_listener_postfix      => true,
      ssl_cert                   => '/etc/postfix/smtpd.cert',
      ssl_key                    => '/etc/postfix/smtpd.key',
      postmaster_address         => 'postmaster@geeksoc.org',
      hostname                   => 'langara.geeksoc.org',
      lda_mail_plugins           => '$mail_plugins sieve',
      auth_sql_userdb_static     => 'uid=vmail gid=vmail home=/home/vmail/%n',
      log_timestamp              => '"%Y-%m-%d %H:%M:%S "',
  }
	
  dovecot::file { 'dovecot-ldap.conf.ext':
      source => 'puppet:///modules/dovecot/dovecot-ldap.conf.ext',
  }
  
}
