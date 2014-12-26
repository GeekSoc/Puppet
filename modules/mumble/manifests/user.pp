# Class: mumble::user
#
# Class which deploys the mumble-server user
class mumble::user {
  user{'mumble-server':
    ensure => 'present',
    gid    => '4000',
    shell  => '/sbin/nologin';
  }
}
