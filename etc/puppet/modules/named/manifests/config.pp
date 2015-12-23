define named::config (
  $type, 
  $view,
  $pool,
  $root_jail    = $named::params::root_jail,
  $config_file  = $named::params::config_file,
  $config_zone  = $named::params::config_zone,
  $dir_zone     = $named::params::dir_zone
) {

  # Set globals permissions
  File {
    owner => 'root',
    group => 'named',
    mode  => '0640',
  }

  # Main config file
  file { $config_file :
    path   => "$config_file",
    content=> template('named/named.conf.erb'),
    notify => Service['named'],
    require => Package['bind', 'bind-chroot'],
  }
  file { "/etc/named.conf" : ensure => 'link', target => "$config_file", }

  # Zones - Main zone config file
  file { $config_zone :
    path   => "$config_zone",
    source => ["puppet:///modules/named/pool_${pool}/conf/named.zones.conf"],
    before => File [$config_file],
    notify => Service['named'],
  }
  file { "/etc/named.zones.conf" : ensure => 'link', target => "$config_zone", }

  # Zones - ACL config files
  file { "${root_jail}etc/named.zones_acl.conf" :
    path   => "${root_jail}etc/named.zones_acl.conf",
    source => ["puppet:///modules/named/pool_${pool}/conf/named.zones_acl.conf"],
    before => File [$config_file],
    notify => Service['named'],
  }
  file { "/etc/named.zones_acl.conf" : ensure => 'link', target => "${root_jail}etc/named.zones_acl.conf", }
  
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
    source => ["puppet:///modules/named/pool_${pool}/conf/$cfg_zone_internal"],
    before => File [$config_file],
    notify => Service['named'],
  }
  file { "/etc/named.zones_internal.conf" : ensure => 'link', target => "${root_jail}etc/named.zones_internal.conf", }
  
  file { "${root_jail}etc/named.zones_external.conf" :
    path   => "${root_jail}etc/named.zones_external.conf",
    source => ["puppet:///modules/named/pool_${pool}/conf/$cfg_zone_external"],
    before => File [$config_file],
    notify => Service['named'],
  }
  file { "/etc/named.zones_external.conf" : ensure => 'link', target => "${root_jail}etc/named.zones_external.conf", }
  
  file { "${root_jail}etc/named.rfc1912.zones" :
    path   => "${root_jail}etc/named.rfc1912.zones",
    source => ["puppet:///modules/named/pool_${pool}/conf/default/named.rfc1912.zones"],
    before => File [$config_file],
    notify => Service['named'],
  }
  file { "/etc/named.rfc1912.zones" : ensure => 'link', target => "${root_jail}etc/named.rfc1912.zones", }


  # Creating directories of zones
  # en: Create a dir from destination zone
  # pt: Cria o sub-diretporio da zona 
  file { "${dir_zone}/master" :
    ensure  => directory,
    recurse => true,
    mode    => 0750,
  }
  file { "${dir_zone}/slaves" :
    ensure  => directory,
    recurse => true,
    mode    => 0750,
  }
  file { "${dir_zone}/data" :
    ensure  => directory,
    owner   => 'named',
    recurse => true,
    mode    => 0750,
  }

  # Copying default zones
  file { "${dir_zone}/named.loopback" :
    path => "${dir_zone}/named.loopback",
    source => ["puppet:///modules/named/pool_${pool}/zones/default/named.loopback"],
    before => File [$config_file],
    notify => Service['named'],
  }
  file { "${dir_zone}/named.localhoost" :
    path => "${dir_zone}/named.localhost",
    source => ["puppet:///modules/named/pool_${pool}/zones/default/named.localhost"],
    before => File [$config_file],
    notify => Service['named'],
  }
  file { "${dir_zone}/named.empty" :
    path => "${dir_zone}/named.empty",
    source => ["puppet:///modules/named/pool_${pool}/zones/default/named.empty"],
    before => File [$config_file],
    notify => Service['named'],
  }
  file { "${dir_zone}/named.ca" :
    path => "${dir_zone}/named.ca",
    source => ["puppet:///modules/named/pool_${pool}/zones/default/named.ca"],
    before => File [$config_file],
    notify => Service['named'],
  }

  # Copying scripts
  file { "${dir_zone}/master/script_sign_zone.sh" :
    path => "${dir_zone}/master/script_sign_zone.sh",
    source => ["puppet:///modules/named/pool_${pool}/zones/script_sign_zone.sh"],
  }

}
