
# Class Zabbix Agent Package

class zabbix::agent::package (
  $agent_package = $zabbix::params::agent_package,

) inherits zabbix::params {

  include zabbix::repo 
  package { $agent_package : ensure => 'latest', }

}
