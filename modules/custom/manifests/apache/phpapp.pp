define custom::apache::phpapp (
    $server_aliases = [],
    $server_admin = 'support@geeksoc.org',
     $https = false,
    $app_name = '',
) {

    apache::vhost { $name:
        manage_docroot => false,
        serveraliases => $server_aliases,
        ssl           => false,
        serveradmin   => $server_admin,
        docroot       => "/var/www/applications/production/${app_name}/current",
        options       => ["+Indexes"],
        override      => ["All"],
        port          => 80,
    }

}
