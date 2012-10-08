class statsd::config {
  $graphite_host = $::statsd::graphite_host
  $graphite_port = $::statsd::graphite_port
  $statsd_port   = $::statsd::statsd_port

  file { '/etc/statsd/localConfig.js':
    content => template('statsd/statsd.conf.erb'),
    require => File['/etc/statsd']
  }
}
