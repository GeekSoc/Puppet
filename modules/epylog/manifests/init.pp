class epylog {

    package { 'epylog':
      ensure => installed,
    }

    file { '/etc/epylog/epylog.conf':
        source => 'puppet:///modules/epylog/epylog.conf',
    }

    file { '/etc/cron.daily/epylog.cron':
        source => 'puppet:///modules/epylog/epylog.cron',
        mode   => '0755',
    }
  
    file { '/etc/epylog/weed_local.cf':
        source => 'puppet:///modules/epylog/weed_local.cf',
    }

}
