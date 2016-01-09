
# Test3: send args from class declaration on manifests/site.pp
# Test2: send args from class declaration on tests/init.pp
# Test1: inherits from ntp::params 
class ntp ($package = $ntp::params::package_name) inherits ntp::params {

  # Install NTP 
  package { $package:
    ensure => present,
  }

  include ntp::file
  include ntp::service
}
