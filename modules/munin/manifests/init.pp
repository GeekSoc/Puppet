class munin::node {

  case $operatingsystem {
          Solaris: { $pkg = 'munin_node'
       $srv = 'cswmuninnode' }
          default: { $pkg = 'munin-node'
       $srv = 'munin-node' }
      }
  
  package { $pkg: ensure => installed }
  service { $srv:  ensure => running, enable => true, require => Package[$pkg] }
  
  file { '/etc/munin/munin-node.conf':
    source  => 'puppet:///modules/munin/munin-node.conf',
    ensure  => present,
    require => File['/etc/munin'],
    notify  => Service[$srv]

  }

  file { '/etc/munin':
        ensure => 'directory',
  }

}

class munin::server {
  
  package { 'munin': ensure => installed }
  service { 'munin':  ensure => running}
  
  file { '/etc/munin/munin.conf':
    source => 'puppet:///modules/munin/munin.conf',
    ensure => present,
  }

  file { '/etc/apache2/sites-enabled/munin.geeksoc.org':
    source => 'puppet:///modules/munin/munin-apache.conf',
    ensure => present,

  }
}
