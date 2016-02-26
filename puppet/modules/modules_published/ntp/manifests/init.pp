
# Test3: send args from class declaration on manifests/site.pp

# Test2: send args from class declaration on tests/init.pp
class ntp ($package) inherits ntp::params {

# Test1: inherits from ntp::params 
#class ntp ($package = $ntp::params::package_name) inherits ntp::params {

  # Install NTP 
  package { 'ntp' :
    name   => $package,
    ensure => present,
  }

  include ntp::file
  include ntp::service
}
