define named::config (
  $type, 
  $view,
  $root_jail    = $named::params::root_jail,
  $config_file  = $named::params::config_file,
  $config_zone  = $named::params::config_zone,
  $dir_zone     = $named::params::dir_zone
) {

  # Main config file
  file { $config_file :
    path   => "$config_file",
    content=> template('named/named.conf.erb'),
    owner  => 'root',
    group  => 'named',
    mode   => 0640,
    notify => Service['named'],
    require => Package['bind'],
  }

  # Zones - Main zone config file
  file { $config_zone :
    path   => "$config_zone",
    source => ["puppet:///modules/named/named.zones.conf"],
    owner  => 'root',
    group  => 'named',
    mode   => 0640,
    notify => Service['named'],
  }

  # Zones - ACL config files
  file { "${root_jail}etc/named.zones_acl.conf" :
    path   => "${root_jail}etc/named.zones_acl.conf",
    source => ["puppet:///modules/named/named.zones_acl.conf"],
    owner  => 'root',
    group  => 'named',
    mode   => 0640,
    notify => Service['named'],
  }
  
  # Zones - Views configs files

  ## ... Determing name of files
  case $view {
    'all' : {
      case $type {
       'master' : {
          $cfg_zone_internal = "named.zones_internal.conf-MASTER"
          $cfg_zone_external = "named.zones_external.conf-MASTER"
        } # master
       'slave' : {
          $cfg_zone_internal = "named.zones_internal.conf-SLAVE"
          $cfg_zone_external = "named.zones_external.conf-SLAVE"
        } # slave
        default : { 
	  notice ("named: TYPE[$type] not found. Using empty files named.zones_internal.conf-EMPTY") 
          $cfg_zone_internal = "named.zones_internal.conf-EMPTY"
          $cfg_zone_external = "named.zones_external.conf-EMPTY"
        }
      } # type
    } # all
    default : {
	  notice ("named: VIEW[$view]  not found. Using empty files named.zones_{external,internal}.conf-EMPTY")
          $cfg_zone_internal = "named.zones_internal.conf-EMPTY"
          $cfg_zone_external = "named.zones_external.conf-EMPTY"
    }
  } # views

  ## ... Creating files
  file { "${root_jail}etc/named.zones_internal.conf" :
    path   => "${root_jail}etc/named.zones_internal.conf",
    source => ["puppet:///modules/named/$cfg_zone_internal"],
    owner  => 'root',
    group  => 'named',
    mode   => 0640,
    notify => Service['named'],
  }
  
  file { "${root_jail}etc/named.zones_external.conf" :
    path   => "${root_jail}etc/named.zones_external.conf",
    source => ["puppet:///modules/named/$cfg_zone_external"],
    owner  => 'root',
    group  => 'named',
    mode   => 0640,
    notify => Service['named'],
  }


  # Creating directories of zones
  # en: Create a dir from destination zone
  # pt: Cria o sub-diretporio da zona 
  file { "${dir_zone}/master" :
    ensure  => directory,
    recurse => true,
    owner   => 'root',
    group   => 'named',
    mode    => 0750,
  }
  file { "${dir_zone}/slaves" :
    ensure  => directory,
    recurse => true,
    owner   => 'root',
    group   => 'named',
    mode    => 0750,
  }

}
