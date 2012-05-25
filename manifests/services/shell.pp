class shell {
	$sshd_config_AllowGroups = 'members gssg gsag root'
	include gs-scripts::listusers
	
	package { [ "alpine",
				"bzr",
				"cvs",
				"darcs",
				"elinks",
				"emacs",
				"erlang",
				"fuse-sshfs",
				"haskell-platform",
				"irssi",
				"jwhois",
				"lynx",
				"mc",
				"perl",
				"php",
				"python",
				"python-ldap",
				"ruby",
				"rubygems",
				"samba-client",
				"siege",
				"subversion",
				"telnet",
				"texlive-latex",
				"zsh",]:
        ensure => installed,
    }
	
    include global
}
