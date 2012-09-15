class sudo {
    package { "sudo":
        ensure => installed,
    }

    file { "/etc/sudoers":
        ensure => present,
        owner  => "root",
        group  => "root",
        mode   => 0440,
        content => template("sudo/sudoers.erb"),
    }
}
