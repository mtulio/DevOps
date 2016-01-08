
# Class created by Marco Tulio <https://github.com/mtulio/DevOps/tree/master/etc/puppet/modules>

class dnssec (
  $package_name   = $dnssec::params::package_name,
  $package_chroot = $dnssec::params::package_chroot,
  $service_name   = $dnssec::params::service_name,
  $config_file    = $dnssec::params::config_file,
  $config_zone    = $dnssec::params::config_zone,
  $dir_zone       = $dnssec::params::dir_zone,
  $dir_log        = $dnssec::params::dir_log,
  $ip_addr        = $dnssec::params::ip_addr

) inherits dnssec::params {

  # Instala e inicia o serviço
  include dnssec::package
  include dnssec::service
  include dnssec::exec

  # en: Check each hostname and apply its profile
  case $::hostname {
    /(clitst01|dnseprd01|dnseprd02|dnseprd03|dnseprd04)/: {
      $server_type = "master"
      $dir_zone_m  = "${dir_zone}/${server_type}"
      $pool        = "dmz"
      $dnssec      = "yes"
      
      # Config server and sync data
      dnssec::zonesync { $::hostname:
        type   => $server_type,
	pool   => $pool,
        dnssec => $dnssec,
      }

      # en: Config server
      dnssec::config { $::hostname:
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

      dnssec::zonesync { $::hostname:
        type   => $server_type,
	pool   => $pool,
        dnssec => $dnssec,
      }

      # en: Config server
      dnssec::config { $::hostname:
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
