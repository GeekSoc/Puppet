class shell {
	$sshd_config_AllowGroups = 'members gssg gsag root'

	include gs-scripts::listusers
	
	package { [ "alpine",
				"autoconf",
				"automake",
				"binutils",
				"bison",
				"bzr",
				"cvs",
				"darcs",
				"elinks",
				"emacs",
				"erlang",
				"flex",
				"fuse-sshfs",
				"gcc",
				"gcc-c++",
				"gettext",
				"haskell-platform",
				"irssi",
				"java-1.6.0-openjdk",
				"jwhois",
				"libtool",
				"lynx",
				"make",
				"mc",
				"patch",
				"perl",
				"php",
				"pkgconfig",
				"python",
				"python-ldap",
				"redhat-rpm-config",
				"rpm-build",
				"ruby",
				"rubygems",
				"samba-client",
				"siege",
				"subversion",
				"telnet",
				"texlive-latex",
				"zsh", ]:
        ensure => installed,
    }
	
    include global
}
