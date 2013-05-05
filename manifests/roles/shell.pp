class shell {
  
  class {'ssh::sshd':
        sshd_config_AllowGroups => 'members sysadmin gsag root',
      }

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
				"java-1.6.0-openjdk-devel",
				"jwhois",
				"libtool",
				"lynx",
				"make",
				"mc",
				"patch",
				"perl",
				"php",
				"pkgconfig",
				"redhat-rpm-config",
				"rpm-build",
				"ruby",
				"rubygems",
				"samba-client",
				"siege",
				"subversion",
				"telnet",
				"texlive-latex", ]:
        ensure => installed,
    }
	
    include global
}
