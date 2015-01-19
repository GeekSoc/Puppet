class shell {
  
  class {'ssh::sshd':
        sshd_config_AllowGroups => 'members sysadmin gsag root',
      }

  include gs-scripts::listusers
  
  package { [ 'alpine',
        'autoconf',
        'automake',
        'binutils',
        'bison',
        'bzr',
        'cvs',
        'darcs',
        'elinks',
        'emacs',
        'erlang',
        'flex',
        'gcc',
        'gettext',
        'haskell-platform',
        'irssi',
        'jwhois',
        'libtool',
        'lynx',
        'make',
        'mc',
        'openjdk-7-jdk',
        'patch',
        'perl',
        'php5',
        'php5-curl',
        'php5-mcrypt',
        'ruby',
        'rubygems',
        'samba-client',
        'siege',
        'sshfs',
        'subversion',
        'telnet',
        'texlive', ]:
        ensure => installed,
    }
  
    include global
}
