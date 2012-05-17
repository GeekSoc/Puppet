
node 'idran.geeksoc.org' {

	file { '/etc/motd':
        content => " 
 _____     _                       _____           _     _____            
|_   _|   | |                     |  __ \         | |   /  ___|           
  | |   __| |_ __ __ _ _ __       | |  \/ ___  ___| | __\ `--.  ___   ___ 
  | |  / _` | '__/ _` | '_ \      | | __ / _ \/ _ \ |/ / `--. \/ _ \ / __|
 _| |_| (_| | | | (_| | | | |  _  | |_\ \  __/  __/   < /\__/ / (_) | (__ 
 \___/ \__,_|_|  \__,_|_| |_| (_)  \____/\___|\___|_|\_\\\____/ \___/ \___|

Primary Contact: GSAG - gsag@geeksoc.org
Purpose: Primary Web Server

This server is Puppet managed - local changes may be overwritten!

" 
    }

	include web
}
