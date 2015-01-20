
node 'magrathea.geeksoc.org' {

  # Message of the day
  file { '/etc/motd':
        content => " 
___  ___                      _   _                
|  \/  |                     | | | |               
| .  . | __ _  __ _ _ __ __ _| |_| |__   ___  __ _ 
| |\/| |/ _` |/ _` | '__/ _` | __| '_ \ / _ \/ _` |
| |  | | (_| | (_| | | | (_| | |_| | | |  __/ (_| |
\_|  |_/\__,_|\__, |_|  \__,_|\__|_| |_|\___|\__,_|
               __/ |                               
              |___/                                

Primary Contact: GSAG - support@geeksoc.org
Purpose: KVM Host

"
    }

    include global
}
