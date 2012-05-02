class epylog {

	package { "epylog":
    	ensure => installed,
    }

	file { "/etc/epylog/epylog.conf":
		source => "puppet:///epylog/epylog.conf",
	}

	file { "/etc/cron.daily/epylog.cron":
		source => "puppet:///epylog/epylog.cron",
		mode => 0755,
	}
	
	file { "/etc/epylog/weed_local.cf":
		source => "puppet:///epylog/weed_local.cf",
	}

}