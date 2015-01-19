class postfix::mailman {

  package { 'mailman':
    ensure => installed,
  }
  
  service { 'mailman':
    enable  => true,
    ensure  => running,
    require => Package['mailman'],
  }
  
  package { 'apache2':
    ensure => installed,
  }
  
  service { 'apache2':
    enable  => true,
    ensure  => running,
    require => Package['apache2'],
  }
  
  file { '/etc/apache2/sites-enabled/mm.cfg':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/postfix/mailman/apache.conf',
    notify => Service['apache2'],
  }
  
  file { '/usr/lib/mailman/bin/getMailingList.py':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0744',
    source => 'puppet:///modules/postfix/mailman/getMailingList.py',
  }
  
  cron { 'mailingListSync':
    command => '/usr/lib/mailman/bin/getMailingList.py > /tmp/new-members && /usr/sbin/sync_members --welcome-msg=no --goodbye-msg=no --notifyadmin=no --file /tmp/new-members announce && rm -v /tmp/new-members',
    user   => root,
    hour   => 1,
    minute => 30
  }


}
