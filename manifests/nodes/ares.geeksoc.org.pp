
node 'ares.geeksoc.org' {

  # Message of the day
  file { '/etc/motd':
        content => " 


  ___                
 / _ \               
/ /_\ \_ __ ___  ___ 
|  _  | '__/ _ \/ __|
| | | | | |  __/\__ \
\_| |_/_|  \___||___/
                     
                     
Primary Contact: GSAG - support@geeksoc.org
Purpose: TF2 Server

"
    }

    include global
}
