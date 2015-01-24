
node 'mun.geeksoc.org' {
  
  $nagiosusers ='asmillie,kcoyle,pkinnaird,wnelson,amckinlay,fvalente,\
sswindells,fmacisaac,rwilson'

  include apache
  include apache::mod::ldap
  include apache::mod::authnz_ldap

  class { 'nagios::server':
  apache_httpd                                 => false,
  apache_httpd_ssl                             => false,
  apache_httpd_htpasswd_source                 => false,
  apache_httpd_conf_content                    =>
template('custom/httpd-nagios.conf.erb'),
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
  


  # Message of the day
  file { '/etc/motd':
        content => "
min.geeksoc.org Sorry no ascii     

                                                          

Primary Contact: GSAG - gsag@geeksoc.org 
Purpose: Backup and Monitoring server

This server is Puppet managed - local changes may be overwritten!

"
    }


  # Roles
  include global
}
