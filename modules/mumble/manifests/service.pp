# Class: mumble::service
#
# Class which ensures the mumble services is running
class mumble::service {
  service{'mumble-server':
    ensure    => 'running',
    hasstatus => true,
    enable    => true,
    require   => File['/etc/mumble-server.ini'],
  }
}
