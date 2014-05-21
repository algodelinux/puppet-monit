class puppet-monit {
   file { "/etc/monit":
      owner => root, group => root,
      ensure => directory,
   }

   file { "/etc/monit.d":
      owner => root, group => root,
      ensure => directory,
      source => "puppet:///modules/puppet-monit/monit.d",
      recurse => true,
      notify => Service ["monit"]
   }

   if $freeradius {
      file { "/etc/monit.d/freeradius":
         owner => root, group => root, mode => 600,
         source => "puppet:///modules/puppet-monit/monit.d.select/freeradius",
         notify => Service ["monit"]
      }
   }
   
   file { "/etc/monit/monitrc":
      owner => root, group => root, mode => 600,
      source => "puppet:///modules/puppet-monit/monitrc",
      require => File ["/etc/monit"],
      notify => Service ["monit"]
   }
   
   file { "/etc/default/monit":
      owner => root, group => root, mode => 644,
      source => "puppet:///modules/puppet-monit/monit",
      require => File ["/etc/monit"],
      notify => Service ["monit"]
   }

   package { monit:
      ensure => latest,
      notify => Service ["monit"]
   }
	
   service { monit:
      ensure => running,
      enable => true,
      hasrestart => true,
   }

}
