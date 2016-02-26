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

  # add resource name - document root (removed when use multiples virtualhosts see vhosts.pp)
  #file { $document_root: 
  #  ensure  => directory,
  #  recurse => true,     # create all files and locations : /var/www/websites
  #}

  # add log dir verification/creation
  file { $log_dir:
    ensure  => directory,
    recurse => true,
  }

  # Add virtual host config - default vhost config
  apache::vhost { "default": 
    port          => 80,
    document_root => $document_root,
    servername    => $servername,
    vhost_dir     => $vhost_dir,
  }

  case $::hostname {
    # Apply N vhosts for hostname 'pmaster'
    'pmaster': {
      apache::vhost { "site1.mtulio.eng.br":
        port          => 80,
        document_root => "${document_root}/site1.mtulio.eng.br",
        servername    => "site1.mtulio.eng.br",
        vhost_dir     => $vhost_dir,
      }
      apache::vhost { "site2.mtulio.eng.br":
        port          => 80,
        document_root => "${document_root}/site2.mtulio.eng.br",
        servername    => "site2.mtulio.eng.br",
        vhost_dir     => $vhost_dir,
      }

    }
    # Apply Y vhosts for hostname 's1'
    's1': {
       apache::vhost { "ict-eng.net":
         port          => 80,
         document_root => "${document_root}/ict-eng.net",
         servername    => "ict-eng.net",
         vhost_dir     => $vhost_dir,
       }
    }
  }
}
