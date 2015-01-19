
node 'skylab-1.geeksoc.org' {

  # Message of the day
  file { '/etc/motd':
        content => "
     _          _       _           __  
    | |        | |     | |         /  | 
 ___| | ___   _| | __ _| |__ ______`| | 
/ __| |/ / | | | |/ _` | '_ \______|| | 
\__ \   <| |_| | | (_| | |_) |     _| |_
|___/_|\_\\__, |_|\__,_|_.__/      \___/
           __/ |                        
          |___/                         

Primary Contact: GSAG - gsag@geeksoc.org 
Purpose: Open Development Box                                                                   

This server is Puppet managed - local changes may be overwritten!

"
    }


  # Roles
  include global
}
