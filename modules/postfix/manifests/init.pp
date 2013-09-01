class postfix {
  require postfix::params

  package { $postfix::params::package: ensure => present, }
  
  package { "postfix-ldap":
    ensure => installed,
  }

  group { "vmail":
    gid    => 5000, 
  }
  
  file { "/home/vmail":
    ensure => "directory",
    owner => "vmail",
    group => "vmail",
  }

  user { "vmail":
    ensure => present,
    gid => "5000",
    groups => "vmail",
    shell => "/bin/false",
    home => "/home/"vmail"",
    require => Group["vmail"],
  }
  

  service { $postfix::params::service:
    ensure => running,
    enable => true,
  }
  
  file { "/etc/postfix/main.cf":
      ensure => present,
      owner  => "root",
      group  => "root",
      mode   => 0644,
      content => template("postfix/main.cf.erb"),
  }
  
  file { "/etc/postfix/master.cf":
      ensure => present,
      owner  => "root",
      group  => "root",
      mode   => 0644,
      content => template("postfix/master.cf.erb"),
  }
  
  file { "/etc/postfix/ldap_virtual_aliases.cf":
      ensure => present,
      owner  => "root",
      group  => "root",
      mode   => 0644,
      source => 'puppet:///modules/postfix/ldap_virtual_aliases.cf',
  }
  
  file { "/etc/postfix/ldap_virtual_users.cf":
      ensure => present,
      owner  => "root",
      group  => "root",
      mode   => 0644,
      source => 'puppet:///modules/postfix/ldap_virtual_users.cf',
  }
  
  file { "/etc/postfix/ldap_virtual_groups.cf":
      ensure => present,
      owner  => "root",
      group  => "root",
      mode   => 0644,
      source => 'puppet:///modules/postfix/ldap_virtual_groups.cf',
  }
  
}
