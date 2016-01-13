
# Class Zabbix Agent Service

class zabbix::agent::service inherits zabbix::params {
  # Config service    
  service { $agent_service:
    ensure  => 'running',
    enable  => true,
    require => Package[$agent_package],
  }

}

