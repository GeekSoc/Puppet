define custom::apache::website (
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
