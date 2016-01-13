
class zabbix::agent::package inherits zabbix::agent {

  include zabbix::repo 
  package { $agent_package : ensure => 'latest', }

}
