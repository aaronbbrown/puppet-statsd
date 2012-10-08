class statsd (
  $graphite_host = 'localhost',
  $graphite_user = 'root',
  $graphite_port = '2003',
  $statsd_port   = '8125'
) {
  include statsd::package
  include statsd::service
  include statsd::config

  Class['statsd::package'] -> Class['statsd::config'] -> Class['statsd::service']
}
