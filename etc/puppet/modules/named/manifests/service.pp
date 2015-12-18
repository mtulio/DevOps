class named::service ($service_name = $named::params::service_named) {

  service ('named' :
    named  => $service_named,
    enable => true,
    ensure => running,
    require => Package['named'],
  }

}
