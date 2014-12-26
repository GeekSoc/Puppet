# Class: mumble::group
#
# Class which deploys the mumble group
class mumble::group {
  group{'mumble-server':
    ensure => 'present',
    gid    => '4000',
  }
}
