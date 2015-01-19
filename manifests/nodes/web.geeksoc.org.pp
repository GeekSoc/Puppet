
node 'web.geeksoc.org' {

  # Modules
    include bind
  
  # Message of the day
  file { '/etc/motd':
        content => " 
 _    _      _           _____           _     _____            
| |  | |    | |         |  __ \         | |   /  ___|           
| |  | | ___| |__       | |  \/ ___  ___| | __\ `--.  ___   ___ 
| |/\| |/ _ \ '_ \      | | __ / _ \/ _ \ |/ / `--. \/ _ \ / __|
\  /\  /  __/ |_) |  _  | |_\ \  __/  __/   < /\__/ / (_) | (__ 
 \/  \/ \___|_.__/  (_)  \____/\___|\___|_|\_\\\____/ \___/ \___|

Primary Contact: GSAG - gsag@geeksoc.org
Purpose: Primary Web Server

This server is Puppet managed - local changes may be overwritten!

"
    }
    
    #Roles
    include web
}
