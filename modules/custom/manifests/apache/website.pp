define custom::apache::website (
    $server_aliases = [],
    $server_admin = 'support@geeksoc.org',
     $https = false,
) {

    apache::vhost { $name:
        serveraliases => $server_aliases,
        ssl           => false,
        serveradmin   => $server_admin,
        docroot       => "/var/www/vhosts/${name}/public_html",
        options       => ["+Indexes"],
        override      => ["All"],
        port          => 80,
    }

    if $https {

        apache::vhost { "${name}-ssl":
            servername    => $name,
            serveraliases => $server_aliases,
            ssl           => true,
            serveradmin   => $server_admin,
            docroot       => "/var/www/vhosts/${name}/public_html",
            options       => ["+Indexes"],
            override      => ["All"],
            port          => 433,
        }

    }

}
