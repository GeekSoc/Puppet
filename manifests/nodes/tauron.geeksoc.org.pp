
node 'tauron.geeksoc.org' {

  include nagios::server
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
