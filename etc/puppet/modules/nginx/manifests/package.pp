class nginx::package {

  package { 'nginx' :
    name   => nginx,
    ensure => present,
  }

}
