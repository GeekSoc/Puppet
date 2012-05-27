
node 'vpn.geeksoc.org' {

	# Modules
	include openvpn

	# Message of the day
	file { '/etc/motd':
        content => "
 _   _______ _   _       _____           _     _____            
| | | | ___ \ \ | |     |  __ \         | |   /  ___|           
| | | | |_/ /  \| |     | |  \/ ___  ___| | __\ `--.  ___   ___ 
| | | |  __/| . ` |     | | __ / _ \/ _ \ |/ / `--. \/ _ \ / __|
\ \_/ / |   | |\  |  _  | |_\ \  __/  __/   < /\__/ / (_) | (__ 
 \___/\_|   \_| \_/ (_)  \____/\___|\___|_|\_\\\____/ \___/ \___|

Primary Contact: GSAG - gsag@geeksoc.org                                                                
Purpose: OpenVPN server

This server is Puppet managed - local changes may be overwritten!

" 
    }

	# Roles
	include global
}
