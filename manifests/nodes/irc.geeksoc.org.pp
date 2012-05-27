
node 'irc.geeksoc.org' {

	# Modules
	include ircd

	# Message of the day
	file { '/etc/motd':
        content => "
 ___________ _____       _____           _     _____            
|_   _| ___ |  __ \     |  __ \         | |   /  ___|           
  | | | |_/ / /  \/     | |  \/ ___  ___| | __\ `--.  ___   ___ 
  | | |    /| |         | | __ / _ \/ _ \ |/ / `--. \/ _ \ / __|
 _| |_| |\ \| \__/\  _  | |_\ \  __/  __/   < /\__/ / (_) | (__ 
 \___/\_| \_|\____/ (_)  \____/\___|\___|_|\_\\\____/ \___/ \___|

Primary Contact: GSAG - gsag@geeksoc.org
Purpose: IRC server

This server is Puppet managed - local changes may be overwritten!

" 
    }

	# Roles
	include global
}
