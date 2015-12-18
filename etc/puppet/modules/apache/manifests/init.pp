# Declaring params
class apache (
  $package_name = $apache::params::package_name,
  $service_name = $apache::params::service_name,
  $vhost_dir    = $apache::params::vhost_dir,
  $conf_dir     = $apache::params::conf_dir,
  $document_root= $apache::params::document_root,
  $servername   = $apache::params::servername,
  $log_dir      = $apache::params::log_dir

) inherits apache::params {

  # including classes
   #class {'apache::package' : package_name ...  (formaERRADA)
  include apache::package
  include apache::service

  # add resource name - document root
  file { $document_root: 
    ensure => directory,
    recurse => true,     # create all files and locations : /var/www/websites
  }

  # add log dir verification/creation
  file { $log_dir:
    ensure => directory,
    recurse => true,
  }

}
