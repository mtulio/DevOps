
# Class Zabbix - Agent

#class zabbix::agent inherits zabbix ( $agent_template = undef, ) {
class zabbix::agent (
  $agent_template = undef,
  $zabbix_server  = $zabbix::params::server,
) inherits zabbix::params {

  # Install package  
  #include zabbix::repo
  #package { $agent_package : ensure => 'latest', }
  include zabbix::agent::package

  # Config service    
  service { $agent_service:
    ensure  => 'running',
    enable  => true,
    require => Package[$agent_package],
  }

  # Config & Start
  if $agent_template == undef {
    $template = 'zabbix/etc/zabbix/zabbix_agentd.conf.erb'
  }
  else {
    $template = $agent_template
  }

  file { '/etc/zabbix/zabbix_agentd.conf':
    ensure  => present,
    content => template($template),
    mode    => '0644',
    require => Package[$agent_package],
    notify  => Service[$agent_service],
  }
  
  file {'/var/run/zabbix':
    ensure => directory,
    group => 'zabbix',
    owner => 'zabbix',
  }
}



