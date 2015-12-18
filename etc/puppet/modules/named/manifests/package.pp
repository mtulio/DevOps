class named::package ($package_name = $named::params::package_name) {
  package {
    name   => $package_name,
    ensure => present,
  }
}
