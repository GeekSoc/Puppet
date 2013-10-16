
node 'abydos.geeksoc.org' {

    mount { "/home":
        device  => "storage.geeksoc.org:/home",
        fstype  => "nfs",
        ensure  => "mounted",
        options => "rw,hard,intr",
        atboot  => true,
    }

    mount { "/yesterday":
        device  => "tauron.geeksoc.org:/home/backup/home",
        fstype  => "nfs",
        ensure  => "mounted",
        options => "ro,hard,intr,mountvers=3",
        atboot  => true,
    }

	# Message of the day
	file { '/etc/motd':
        content => " 
  ___  _               _                 _____           _    _____            
 / _ \| |             | |               |  __ \         | |  /  ___|           
/ /_\ \ |__  _   _  __| | ___  ___      | |  \/ ___  ___| | _\ `--.  ___   ___ 
|  _  | '_ \| | | |/ _` |/ _ \/ __|     | | __ / _ \/ _ \ |/ /`--. \/ _ \ / __|
| | | | |_) | |_| | (_| | (_) \__ \  _  | |_\ \  __/  __/   </\__/ / (_) | (__ 
\_| |_/_.__/ \__, |\__,_|\___/|___/ (_)  \____/\___|\___|_|\_\\\____/ \___/ \___|
              __/ |                                                            
             |___/ 

Primary Contact: GSAG - support@geeksoc.org
Purpose: Shell Service

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
