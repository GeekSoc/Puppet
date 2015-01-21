define apache::website (
    $server_aliases = [],
    $server_admin = 'support@geeksoc.org',
     $https = false,
) {

    apache::vhost { $name:
        serveraliases => $server_aliases,
        ssl           => $https,
        serveradmin   => $server_admin,
        docroot       => "/var/www/vhosts/${name}/public_html",
        options       => ["+Indexes"],
        override      => ["All"],
    }

}

define apache::phpapp (
    $server_aliases = [],
    $server_admin = 'support@geeksoc.org',
     $https = false,
    $groupname = $apacheuser,
    $app_name = $name
) {
  
    file { "${name}.conf":
    path        => $operatingsystem ? {
         'Debian' => "/etc/apache2/sites-enabled/${name}.conf",
         default  => "/etc/httpd/conf.d/${name}.conf",
      },
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        content => template('apache/phpapp.conf.erb'),
    notify      => Service['httpd'],
        require => Package['httpd'],
    }
  file { "/var/www/applications/production/${app_name}":
        owner  => $apacheuser,
        group  => $groupname,
        ensure => directory,
    }
  file { "/var/www/applications/production/${app_name}/shared":
        owner  => $apacheuser,
        group  => $groupname,
        ensure => directory,
    }
  file { "/var/www/applications/production/${app_name}/releases":
        owner  => $apacheuser,
        group  => $groupname,
        ensure => directory,
    }

}
