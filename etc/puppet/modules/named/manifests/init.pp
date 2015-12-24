
# Class created by Marco Tulio <git@mtulio.eng.br>

class named (
  $package_name   = $named::params::package_name,
  $package_chroot = $named::params::package_chroot,
  $service_name   = $named::params::service_name,
  $config_file    = $named::params::config_file,
  $config_zone    = $named::params::config_zone,
  $dir_zone       = $named::params::dir_zone,
  $dir_log        = $named::params::dir_log,
  $ip_addr        = $named::params::ip_addr

) inherits named::params {

  # Instala e inicia o serviço
  include named::package
  include named::service
  include named::exec

  #TODO: create install or call require to install package before config

  # en: Check each hostname and apply its profile
  case $::hostname {
    'rhclitst01' : {
      $server_type = "master"
      $dir_zone_m = "${dir_zone}/${server_type}"
      $pool = "dmz"
      
      # Config server and sync data
      named::config { $::hostname:
        type   => $server_type,
        view   => "external",     # not used
        pool   => $pool,
      }
    
      # Sign zone
      # manifests/dnssec.pp

      notice("# Todos os dados foram sincronizados do servidor MASTER")
    }
    'pmaster' : {
      $server_type = "master"
      $pool = "dmz"
      $dir_zone_m = "${dir_zone}/${server_type}"

      # en: Config server
      named::config { $::hostname:
        type   => $server_type,
        view   => "external",		# all(internal+external), internal, external
	pool   => $pool,
      }

      # Create each domain
      $domain = "example.gov.br"
 
      # TODO: create a loop and add all domains
      #$domains = ["example1.gov.br", "ict-eng.net"]

      #zzone external : example1.gov.br
      named::zone { "EXT-$domain" :
        pool      => $pool,
        domain    => $domain,
        zone_dir  => "${dir_zone_m}",
        zone_file => "db-${domain}",
      }
        
      #zone internal : example1.gov.br
      #named::zone { "INT-$domain":
      #  domain    => $domain,
      #  zone_dir  => "${dir_zone_m}",
      #  zone_file => "db_int-${domain}",
      #}

      #zone external: ict-eng.net
      named::zone { "ict-eng.net":
        pool      => $pool,
        domain    => "ict-eng.net",
        zone_dir  => "${dir_zone_m}",
        zone_file => "db-ict-eng.net",
      }
    } # finish server 
    case default : {
      $server_type = "master"
      $dir_zone_m = "${dir_zone}/${server_type}"
      $pool = "default"
      
      # Config server and sync data
      named::config { $::hostname:
        type   => $server_type,
        view   => "external",     # not used
        pool   => $pool,
      }
    
      # Sign zone
      # manifests/dnssec.pp

      notice("# Data was sync with MASTER")
    
    }
  }
}
