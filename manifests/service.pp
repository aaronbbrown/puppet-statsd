class statsd::service {
  $graphite_user = $::statsd::graphite_user

  service { 'statsd':
    provider => 'upstart',
    enable   => true,
    require  => [ File['/etc/init/statsd.conf'], 
                  File['/var/log/statsd'] ]
  }

  file { 
    '/etc/init/statsd.conf':
      content => template('statsd/statsd.upstart.erb');

    '/etc/init.d/statsd' : 
      ensure => 'link',
      target => '/lib/init/upstart-job';
  }
}


