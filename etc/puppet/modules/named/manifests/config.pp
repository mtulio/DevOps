define named::config (
  $type, 
  $pool,
  $dnssec,
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

  # Main config file [/etc/named.conf]
  file { $config_file :
    path    => "$config_file",
    #content => template('named/named.conf.erb'),
    source   => ["puppet:///modules/named/pool_${pool}/${type}/etc/named.conf"],
    notify  => Service['named'],
    require => Package['bind', 'bind-chroot'],
  }
  file { "/etc/named.conf" : ensure => 'link', target => "$config_file", }
 
  # Sync directory confs [/etc/named] & Create a link to root jail
  file {'DirConfSync':
    ensure   => 'directory',
    recurse  => 'true',
    purge    => 'true',
    mode     => 0650,
    name     => "${root_jail}/etc/named",
    source   => ["puppet:///modules/named/pool_${pool}/${type}/etc/named/"],
    require  => Package['bind', 'bind-chroot'],
    before   => File["${config_file}"],
    #notify  => Service["nginx"],
  }
  # Create syn links to config:acl.conf  key.conf  logging.conf  zones.conf
  file { "DirConfLinkAcl" : 
    path   => '/etc/named/acl.conf', 
    ensure => 'link', 
    target => "${root_jail}etc/named/acl.conf",
    require=> File['DirConfSync'],
  }
  file { "DirConfLinkKey" : 
    path   => '/etc/named/key.conf', 
    ensure => 'link', 
    target => "${root_jail}etc/named/key.conf",
    require=> File['DirConfSync'],
  }
  file { "DirConfLinkLog" : 
    path   => '/etc/named/logging.conf', 
    ensure => 'link', 
    target => "${root_jail}etc/named/logging.conf",
    require=> File['DirConfSync'],
  }
  file { "DirConfLinkZones" : 
    path   => '/etc/named/zones.conf', 
    ensure => 'link', 
    target => "${root_jail}etc/named/zones.conf",
    require=> File['DirConfSync'],
  }

  case $dnssec {
    'yes' : {
      file {'ScriptSignZone':
        path    => "${dir_zone}/master/atualiza_dnssec.sh",
        owner   => root,
        group   => root,
        mode    => 0755,
        source   => ["puppet:///modules/named/pool_${pool}/${type}/zones/master/atualiza_dnssec.sh"],
        #require => File[$config_file],
        before   => File["${config_file}"],
        require  => File['SyncDirZones'],
        notify   => Exec['sign_all'],
      }
    }
  }
}
