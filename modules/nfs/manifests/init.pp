class nfs {
    
	case $::operatingsystem {
		debian, ubuntu: {
			$pkg_name   = [ "nfs-kernel-server" ]
            $srv_name   = [ "nfs-kernel-server" ]
		}
		centos, redhat: {
			$pkg_name   = [ "nfs-utils" ]
            $srv_name   = [ "nfs" ]
		}
	}

    package { "$pkg_name": ensure => installed }
    
    case $::operatingsystem {
        debian, ubuntu: {
            service { "nfs-kernel-server":
                ensure     => running,
                enable     => true,
                hasrestart => true,
                require    => Package["${pkg_name}"],
            }
        }
        centos, redhat: {
            service { [ "nfs", "nfslock" ]:
                ensure     => running,
                enable     => true,
                hasrestart => true,
                require    => Package["${pkg_name}"],
            }
        }
    }

    file { "/etc/exports.d":
               ensure => directory,
    }

    exec { "update-etc-exports":
        command     => "/bin/cat /etc/exports.d/* >/etc/exports",
        notify      => Service["${srv_name}"],
        refreshonly => true,
    }

    define share( $path, $allowed, $options = "" ) {
        include nfs

        # file { $path:
        #     ensure => directory,
        # }

        file { "/etc/exports.d/${name}":
            content => "${path} ${allowed}(${options})\n",
            notify  => Exec["update-etc-exports"],
        }
    }
}

