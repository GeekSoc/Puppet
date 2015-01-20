class postfix::spamassassin {

  package { 'spamassassin':
    ensure => installed,
  }

  package { 'spamc':
    ensure => installed,
  }
  
  service { 'spamassassin':
    ensure => running,
    enable => true,
  }

  group { 'spamd':
    gid    => 5001,
  }
  
  file { '/var/lib/spamassassin':
    ensure => 'directory',
    owner  => 'spamd',
    group  => 'spamd',
  }

  user { 'spamd':
    ensure  => present,
    gid     => '5001',
    groups  => 'spamd',
    shell   => '/bin/false',
    home    => '/var/lib/spamassassin',
    require => Group['spamd'],
  }

  file { '/etc/default/spamassassin':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/postfix/spamassassin/spamassassin.conf',
  }
  
  file { '/etc/spamassassin/local.cf':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/postfix/spamassassin/local.cf',
  }
  

}
