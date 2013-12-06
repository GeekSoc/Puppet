class sudo (

    case $::operatingsystem {
        debian: {
          $secure_path = "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
        }
        centos, redhat: {
          $secure_path = "/sbin:/bin:/usr/sbin:/usr/bin"          
        }
    }
    $sudoers = ''
  ) {

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
