
# Class created by Marco Tulio <https://github.com/mtulio/DevOps/tree/master/etc/puppet/modules>

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

  # en: Check each hostname and apply its profile
  case $::hostname {
    /(clitst01|dnseprd01|dnseprd02|dnseprd03|dnseprd04)/: {
      $server_type = "master"
      $dir_zone_m  = "${dir_zone}/${server_type}"
      $pool        = "dmz"
      $dnssec      = "yes"
      
      # Config server and sync data
      named::zonesync { $::hostname:
        type   => $server_type,
	pool   => $pool,
        dnssec => $dnssec,
      }

      # en: Config server
      named::config { $::hostname:
        type   => $server_type,
	pool   => $pool,
        dnssec => $dnssec,
      }

      notice("# Todos os dados foram sincronizados do servidor MASTER")
    }
    'pmaster' : {
      $server_type = "master"
      $pool = "example"
      $dir_zone_m = "${dir_zone}/${server_type}"
      $dnssec = "yes"

      named::zonesync { $::hostname:
        type   => $server_type,
	pool   => $pool,
        dnssec => $dnssec,
      }

      # en: Config server
      named::config { $::hostname:
        type   => $server_type,
	pool   => $pool,
        dnssec => $dnssec,
      }

    } # finish server rhensprd01
  } # finish case

  # Setup firewall rules
  if $::osfamily == "redhat" and $::operatingsystemmajrelease == 7 {
    ensure_packages("iptables-services",{'ensure' => "latest"})
    Package["iptables-services"] -> Firewall <| |>
    service { "firewalld": 
      enable => false,
    }
 
    service { "iptables":
      enable => true,
    }
  } 

  firewall { '000 accept TCP DNS queries ':
    iniface  => 'eth0',
    proto    => 'tcp',
    port     => '53',
    state    => ['RELATED', 'ESTABLISHED'],
    action   => 'accept',
  }
  firewall { '000 accept UDP DNS queries ':
    iniface  => 'eth0',
    proto    => 'udp',
    port     => '53',
    action   => 'accept',
  }

}
