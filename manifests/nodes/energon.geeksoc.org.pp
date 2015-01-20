
node 'energon.geeksoc.org' {

    file { '/home':
        ensure => directory,
    }

    mount { '/home':
        ensure  => 'mounted',
        device  => 'storage.geeksoc.org:/home',
        fstype  => 'nfs',
        options => 'rw,hard,intr,mountvers=3',
        atboot  => true,
        require => File['/home'],
    }
    
    file { '/yesterday':
        ensure => directory,
    }

    mount { '/yesterday':
        ensure  => 'mounted',
        device  => 'tauron.geeksoc.org:/home/backup/home',
        fstype  => 'nfs',
        options => 'ro,hard,intr,mountvers=3',
        atboot  => true,
        require => File['/yesterday'],
    }

  # Message of the day
  file { '/etc/motd':
        content => " 

Primary Contact: GSAG - support@geeksoc.org
Purpose: Glasgow Future Cities Dev

This server is Puppet managed - local config changes may be overwritten!
-----------------------------------
Welcome to the server!!
Remember:
   * Please comply with University Regulation 6.11 and the JANET 
     Acceptable Use policy - usage may be monitored
   * Anything in your public_html directory is publicly viewable
   * You can use tools like WinSCP to manipulate files in your account
   * Have Fun!!!
   * Behave :p

-----------------------------------
"
    }

  # Roles
  include shell
}
