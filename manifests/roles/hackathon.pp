class hackathon {
	
	# Message of the day
	file { '/etc/motd':
        content => "
 _   _   ___      _      ___ _   _     _____       
| | | | /   |    | |    /   | | | |   |  _  |      
| |_| |/ /| | ___| | __/ /| | |_| |__ | |/' |_ __  
|  _  / /_| |/ __| |/ / /_| | __| '_ \|  /| | '_ \ 
| | | \___  | (__|   <\___  | |_| | | \ |_/ / | | |
\_| |_/   |_/\___|_|\_\   |_/\__|_| |_|\___/|_| |_|                                        

Primary Contact: GSAG - support@geeksoc.org 
Purpose: Hackathon Dev Box

This server is Puppet managed - local changes may be overwritten!

" 
    }
	
	$sshd_config_AllowGroups = 'members sysadmin gsag root'
	
	package { [ "autoconf",
				"automake",
				"binutils",
				"bison",
				"bzr",
				"mercurial",
				"cvs",
				"darcs",
				"elinks",
				"emacs",
				"erlang",
				"flex",
				"sshfs",
				"gcc",
				"haskell-platform",
				"openjdk-6-jdk",
				"openjdk-6-jre",
				"lynx",
				"make",
				"mc",
				"perl",
				"php5",
				"php5-ldap",
				"ruby",
				"rubygems",
				"smbclient",
				"siege",
				"subversion",
				"telnet",
				"texlive-latex3", ]:
        ensure => installed,
    }
	
    include global
}
