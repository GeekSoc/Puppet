
import "roles/*.pp"
import "nodes/*.pp"

$extlookup_datadir = "/etc/puppet-private"
$extlookup_precedence = ["%{fqdn}", "domain_%{domain}", "common"]

# The filebucket option allows for file backups to the server
filebucket { main: server => 'puppet' }

# Set global defaults - including backing up all files to the main filebucket and adds a global path
File { backup => main }
Exec { path => "/usr/bin:/usr/sbin/:/bin:/sbin" }
