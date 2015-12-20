define named::config ($type, $view)
{

  # Main config file
  file { '/etc/named.conf' :
    path   => "/etc/named.conf",
    content=> template('named/named.conf.erb'),
    owner  => 'root',
    group  => 'named',
    mode   => 0640,
    notify => Service['named'],
    require => Package['bind'],
  }

  # Zones - Main zone config file
  file { '/etc/named.zones.conf' :
    path   => "/etc/named.zones.conf",
    source => ["puppet:///modules/named/named.zones.conf"],
    owner  => 'root',
    group  => 'named',
    mode   => 0640,
    notify => Service['named'],
  }

  # Zones - ACL config files
  file { '/etc/named.zones_acl.conf' :
    path   => "/etc/named.zones_acl.conf",
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
  file { '/etc/named.zones_internal.conf' :
    path   => "/etc/named.zones_internal.conf",
    source => ["puppet:///modules/named/$cfg_zone_internal"],
    owner  => 'root',
    group  => 'named',
    mode   => 0640,
    notify => Service['named'],
  }
  
  file { '/etc/named.zones_external.conf' :
    path   => "/etc/named.zones_external.conf",
    source => ["puppet:///modules/named/$cfg_zone_external"],
    owner  => 'root',
    group  => 'named',
    mode   => 0640,
    notify => Service['named'],
  }

}
