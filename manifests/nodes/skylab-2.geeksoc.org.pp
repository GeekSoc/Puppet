
node 'skylab-2.geeksoc.org' {

  # Message of the day
  file { '/etc/motd':
        content => "
     _          _       _           _____ 
    | |        | |     | |         / __  \
 ___| | ___   _| | __ _| |__ ______`' / /'
/ __| |/ / | | | |/ _` | '_ \______| / /  
\__ \   <| |_| | | (_| | |_) |     ./ /___
|___/_|\_\\__, |_|\__,_|_.__/      \_____/
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
