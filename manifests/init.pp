class statsd (
  $graphite_host = "localhost",
  $graphite_user = "root",
  $graphite_port = 2003,
  $statsd_port   = 8125
) {

  vcsrepo { '/usr/share/statsd' :
    ensure   => present,
    provider => git,
    source   => 'git://github.com/etsy/statsd.git',
  }

  file { "/etc/statsd":
    ensure  => directory
  }

  file { "/etc/statsd/localConfig.js":
    content => template("statsd/statsd.conf.erb"),
    require => File["/etc/statsd"]
  }

  file { "/etc/init/statsd.conf":
    content => template("statsd/statsd.upstart.erb"),
    require => File["/etc/statsd/localConfig.js"]
  }

  service { "statsd":
    provider => "upstart",
    enable   => true,
    require  => File["/etc/init/statsd.conf"]
  }
}
