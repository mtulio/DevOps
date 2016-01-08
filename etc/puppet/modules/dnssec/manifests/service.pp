class dnssec::service ($service_name = $dnssec::params::service_name) {
  
  service { 'named' :
    name    => $service_name,
    enable  => true,
    ensure  => running,
    require => Package['bind','bind-chroot'],
  }
}
