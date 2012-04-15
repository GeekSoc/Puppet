
node 'kobol.geeksoc.org' {

    mount { "/home":
        device  => "storage.geeksoc.org:/home",
        fstype  => "nfs",
        ensure  => "mounted",
        options => "rw,hard,intr",
        atboot  => true,
    }

    mount { "/yesterday":
        device  => "argama.geeksoc.org:/home",
        fstype  => "nfs",
        ensure  => "mounted",
        options => "ro,hard,intr,mountvers=3",
        atboot  => true,
    }

	include shell
	include global
}
