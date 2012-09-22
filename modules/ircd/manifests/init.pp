class ircd {
	
	file { "/home/ircd/ircd/unrealircd.conf":
        owner   => "ircd",
        group   => "ircd",
        mode    => 0600,
        source  => "puppet:///modules/ircd/ircd.conf",
    }

	file { "/home/ircd/ircd/ircd.motd":
        owner   => "ircd",
        group   => "ircd",
        mode    => 0600,
        source  => "puppet:///modules/ircd/ircd.motd",
    }

	exec { "/home/ircd/ircd/unreal rehash":
		subscribe => [
			File["/home/ircd/ircd/unrealircd.conf"],
			File["/home/ircd/ircd/ircd.motd"]
			],
		refreshonly => true
	}

}