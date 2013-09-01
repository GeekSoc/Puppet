class postfix {
  require postfix::params

  package { $postfix::params::package: ensure => present, }

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
  
}
