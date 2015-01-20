
node 'andor.geeksoc.org' {

  # Message of the day
  file { '/etc/motd':
        content => "
    ___            _            _____           _    _____            
   / _ \          | |          |  __ \         | |  /  ___|           
  / /_\ \_ __   __| | ___  _ __| |  \/ ___  ___| | _\ `--.  ___   ___ 
  |  _  | '_ \ / _` |/ _ \| '__| | __ / _ \/ _ \ |/ /`--. \/ _ \ / __|
  | | | | | | | (_| | (_) | |_ | |_\ \  __/  __/   </\__/ / (_) | (__ 
  \_| |_/_| |_|\__,_|\___/|_(_) \____/\___|\___|_|\_\____/ \___/ \___|
                                                                      
Primary Contact: GSAG - gsag@geeksoc.org 
Purpose: Suggest One

This server is Puppet managed - local changes may be overwritten!

"
    }


  # Roles
  include global
}
