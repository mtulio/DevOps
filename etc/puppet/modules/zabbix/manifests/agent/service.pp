
# Class Zabbix Agent Service

class zabbix::agent::service (
  $agent_service = $zabbix::params::agent_service,
  $agent_package = $zabbix::params::agent_package,
) inherits zabbix::params {

  # Config service    
  service { $agent_service:
    ensure  => 'running',
    enable  => true,
    require => Package[$agent_package],
  }

}

