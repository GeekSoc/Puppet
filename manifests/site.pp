
import "services/*.pp"
import "nodes/*.pp"

# The filebucket option allows for file backups to the server
filebucket { main: server => 'puppet' }

# Set global defaults - including backing up all files to the main filebucket and adds a global path
File { backup => main }
Exec { path => "/usr/bin:/usr/sbin/:/bin:/sbin" }

node basenode {
  include sudo

  class { "ntp":
      servers 		=> [ 'ntp0.net.strath.ac.uk',
  								 	 	 'ntp1.net.strath.ac.uk',
  								 	   'ntp2.net.strath.ac.uk',
  								     'ntp3.net.strath.ac.uk', ],
			autoupdate	=> false,
  }
}
