class statsd::package {
  vcsrepo { '/usr/share/statsd' :
    ensure   => present,
    provider => git,
    source   => 'git://github.com/etsy/statsd.git',
  }

  file { [ '/etc/statsd', '/var/log/statsd' ]:
    ensure  => directory
  }

}


