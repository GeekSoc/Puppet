class ircd {
	
	file { "/home/ircd/ircd/unrealircd.conf":
        owner   => "ircd",
        group   => "ircd",
        mode    => 0600,
        source  => "puppet:///modules/ircd/ircd.conf",
    }

	exec { "/home/ircd/ircd/unreal rehash":
		subscribe => File["/home/ircd/ircd/unrealircd.conf"],
		refreshonly => true
	}

}