
node 'tauron.geeksoc.org' {
  
  $nagiosusers ='asmillie,kcoyle,pkinnaird,wnelson,amckinlay,fvalente,\
sswindells,fmacisaac,rwilson'

  include apache

  class { 'nagios::server':
  apache_httpd                                 => false,
  apache_httpd_ssl                             => false,
  apache_httpd_conf_content                    => false,
  apache_httpd_htpasswd_source                 => false,
  php                                          => false,
  php_apc                                      => false,
  cgi_authorized_for_system_information        => $nagiosusers,
  cgi_authorized_for_configuration_information => $nagiosusers,
  cgi_authorized_for_system_commands           => $nagiosusers,
  cgi_authorized_for_all_services              => '*',
  cgi_authorized_for_all_hosts                 => '*',
  cgi_authorized_for_all_service_commands      => $nagiosusers,
  cgi_authorized_for_all_host_commands         => $nagiosusers,
  cgi_default_statusmap_layout                 => '5',
  admin_email                                  => 'nagios-alert@geeksoc.org',
  
}
  include munin::server

    nfs::share { 'home':
        path    => '/home/backup',
        allowed => '130.159.141.64/26',
        options => 'rw,sync,no_subtree_check',
    }

  # Message of the day
  file { '/etc/motd':
        content => "
 _____                                 _____           _     _____            
|_   _|                               |  __ \         | |   /  ___|           
  | | __ _ _   _ _ __ ___  _ __       | |  \/ ___  ___| | __\ `--.  ___   ___ 
  | |/ _` | | | | '__/ _ \| '_ \      | | __ / _ \/ _ \ |/ / `--. \/ _ \ / __|
  | | (_| | |_| | | | (_) | | | |  _  | |_\ \  __/  __/   < /\__/ / (_) | (__ 
  \_/\__,_|\__,_|_|  \___/|_| |_| (_)  \____/\___|\___|_|\_\\\____/ \___/ \___|
                                                          

Primary Contact: GSAG - gsag@geeksoc.org 
Purpose: Backup and Monitoring server

This server is Puppet managed - local changes may be overwritten!

"
    }


  # Roles
  include global
}
