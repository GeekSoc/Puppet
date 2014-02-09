# Class: mumble::iptables
#
# This class will configure the firewall
class mumble::iptables {
  if ! defined(Class['::iptables']) {
    include ::iptables
  }
  iptables::rule{'mumble-server-tcp':
    dport => $mumble::port,
    proto => 'tcp',
  }
  iptables::rule{'mumble-server-udp':
    dport => $mumble::port,
    proto => 'udp',
  }
}
