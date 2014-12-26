# Class: mumble
#
# Initialization class for the mumble module
class mumble (
  $package_name = $mumble::params::package_name,
  $password     = $mumble::params::password,
  $port         = $mumble::params::port,
  $bandwidth    = $mumble::params::bandwith,
  $ice          = undef,
  $dbus         = undef,
  $motd         = $mumble::params::motd,
) inherits mumble::params {

  if $motd {
    motd::register { 'mumble': }
  }

  include ::mumble::install
  include ::mumble::config
  include ::mumble::service

  Class['::mumble::install'] ->
  Class['::mumble::config'] ->
  Class['::mumble::service']
}
