class postfix {
  require postfix::params

  package { $postfix::params::package: ensure => present, }

  service { $postfix::params::service:
    ensure => running,
    enable => true,
  }
}
