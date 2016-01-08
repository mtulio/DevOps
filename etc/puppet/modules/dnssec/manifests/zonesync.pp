

#
# Sequence:
#      1              2              3             4          5
# SyncDirZones -> Sync..Signed -> Sync..Keys -> Sync..DB -> ScriptSign
#


define dnssec::zonesync (
  $type, 
  $pool,
  $dnssec,
  $config_file  = $dnssec::params::config_file,
  $dir_zone     = $dnssec::params::dir_zone
) {

  # Set globals permissions
  File {
    owner => 'root',
    group => 'named',
    mode  => '0640',
  }

  #1 Sync directory /var/named/master/
  file {'SyncDirZones':
    ensure   => 'directory',
    recurse  => 'true',
    purge    => 'true',
    #mode     => 0750,
    name     => "${dir_zone}/master",
    #source   => ["puppet:///modules/named/pool_${pool}/${type}/zones/"],
    before   => File["${config_file}"],
    require  => Package['bind', 'bind-chroot'],
  }

  #2 Sync directory /var/named/master/signed
  file {'SyncDirZonesSigned':
    ensure   => 'directory',
    recurse  => 'true',
    #purge    => 'true',
    name     => "${dir_zone}/master/3.signed",
    #source   => ["puppet:///modules/named/pool_${pool}/${type}/zones/master/3.signed"],
    require   => File['SyncDirZones'],
  }
  file { "LinkDirZonesSigned" : 
    path   => "${dir_zone}/master/signed", 
    ensure => 'link', 
    target => "${dir_zone}/master/3.signed",
    require=> File['SyncDirZonesSigned'],
  }

  #3 Sync directory /var/named/master/keys
  file {'SyncDirZonesKeys':
    ensure   => 'directory',
    recurse  => 'true',
    purge    => 'true',
    name     => "${dir_zone}/master/1.keys",
    source   => ["puppet:///modules/dnssec/pool_${pool}/${type}/zones/master/1.keys"],
    require  => File['LinkDirZonesSigned'],
  }
  file { "LinkDirZonesKeys" : 
    path   => "${dir_zone}/master/keys", 
    ensure => 'link', 
    target => "${dir_zone}/master/1.keys",
    require=> File['SyncDirZonesKeys'],
  }
  
  #4 Sync directory /var/named/master/zones
  file {'SyncDirZonesDB':
    ensure   => 'directory',
    recurse  => 'true',
    purge    => 'true',
    name     => "${dir_zone}/master/2.zonas",
    source   => ["puppet:///modules/dnssec/pool_${pool}/${type}/zones/master/2.zonas"],
    require  => File['SyncDirZonesKeys'],
    notify   => [Exec['sign_all'],Service['named']],
  }
  #file { "LinkDirZonesDB" : 
  #  path   => "${dir_zone}/master/zonas", 
  #  ensure => 'link', 
  #  target => "${dir_zone}/master/2.zonas",
  #  require=> File['SyncDirZonesDB'],
  #}
  #file { "LinkDirZonesDBkeys" :
  #  path   => "${dir_zone}/master/zonas/keys",
  #  ensure => 'link', 
  #  target => "${dir_zone}/master/1.keys",
  #  require=> File['LinkDirZonesDB'],
  #}
  
  # 5
  #file {'ScriptSignZone':
  #  path    => "${dir_zone}/master/atualiza_dnssec.sh",
  #  owner   => root,
  #  group   => root,
  #  mode    => 0755,
  #  source  => ["puppet:///modules/named/pool_${pool}/${type}/zones/master/atualiza_dnssec.sh"],
  #  require => File['LinkDirZonesDBkeys'],
  #  notify  => Exec['sign_all'],
  #}
  case $dnssec {
    'yes' : {
      file {'ScriptSignZone':
        path    => "${dir_zone}/master/atualiza_dnssec.sh",
        owner   => root,
        group   => root,
        mode    => 0755,
        source   => ["puppet:///modules/dnssec/pool_${pool}/${type}/zones/master/atualiza_dnssec.sh"],
        #require => File[$config_file],
        #before   => File["${config_file}"],
        #require => File['LinkDirZonesDBkeys'],
        #require  => File['SyncDirZonesDB'],
        #notify   => Exec['sign_all'],
      }
    }
  }
 
  ########################
  # Sync pool_default/zones
  file {'SyncDirZonesDefault':
    ensure   => 'directory',
    recurse  => 'true',
    purge    => 'true',
    #mode     => 0750,
    name     => "${dir_zone}/default/",
    source   => ["puppet:///modules/dnssec/pool_default/zones/default/"],
    before   => File["${config_file}"],
    require  => File['SyncDirZones'],
  }
}
