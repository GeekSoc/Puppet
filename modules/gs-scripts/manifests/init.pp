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