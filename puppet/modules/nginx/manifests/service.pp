class nginx::service {
  service {'nginx':
    name    => 'nginx',
    enable  => true,
    ensure  => running,
    require => Package['nginx'],
  }
}
