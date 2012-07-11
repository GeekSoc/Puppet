class gs-scripts::adduser {
	
	file { "/usr/local/sbin/gsadduser":
        owner   => "root",
        group   => "root",
        mode    => 0750,
        source  => "puppet:///modules/gs-scripts/ldap/gsadduser",
    }

	file { "/usr/local/etc/gsuser.template":
        owner   => "root",
        group   => "root",
        mode    => 0640,
        source  => "puppet:///modules/gs-scripts/ldap/gsuser.template",
    }

	file { "/usr/local/etc/gsruntime":
        owner   => "root",
        group   => "root",
        mode    => 0640,
        source  => "puppet:///modules/gs-scripts/ldap/gsruntime",
    }
}

class gs-scripts::listusers {
	file { "/usr/local/sbin/gslistusers":
        owner   => "root",
        group   => "root",
        mode    => 0755,
        source  => "puppet:///modules/gs-scripts/ldap/gslistusers",
    }

	file { "/usr/local/sbin/gsparseldif":
        owner   => "root",
        group   => "root",
        mode    => 0755,
        source  => "puppet:///modules/gs-scripts/ldap/gsparseldif",
    }

}

class gs-scripts::userdir-disable {
	
	file { "/usr/local/sbin/userdir-disable":
        owner   => "root",
        group   => "root",
        mode    => 0750,
        source  => "puppet:///modules/gs-scripts/userdir-disable.py",
    }
	
}

class gs-scripts::retrieve_public_keys {
	
	file { "/usr/local/sbin/retrieve_public_keys":
        owner   => "root",
        group   => "root",
        mode    => 0750,
        source  => "puppet:///modules/gs-scripts/retrieve_public_keys.py",
    }

	file { "/etc/cron.d/retrieve_public_keys":
		owner   => "root",
        group   => "root",
        source  => $syncGasOften ? {
                        true    => "puppet:///modules/gs-scripts/retrieve_public_keys_often.cron",
                        default => "puppet:///modules/gs-scripts/retrieve_public_keys.cron",
        },
		mode => 0644,
	}
	
}
