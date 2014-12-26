# Class: mumble::firewall
#
# Class which configures the iptables firewall
class mumble::firewall {
  Firewall{
    action => 'accept',
  }
  firewall{'020 mumble-server-tcp':
    dport => $mumble::port,
    proto => 'tcp',
  }
  firewall{'021 mumble-server-udp':
    dport => $mumble::port,
    proto => 'udp',
  }
}
