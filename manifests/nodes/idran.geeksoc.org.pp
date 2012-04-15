
node 'idran.geeksoc.org' {

    mount { "/home":
        device  => "storage.geeksoc.org:/home",
        fstype  => "nfs",
        ensure  => "mounted",
        options => "rw,hard,intr",
        atboot  => true,
    }

	include global
}
