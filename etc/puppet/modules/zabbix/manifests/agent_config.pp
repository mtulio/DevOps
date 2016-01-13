
# Class Zabbix - Agent
## Allow you to configure each config of agent.

class zabbix::agent_config (
  
  ### GENERAL PARAMETERS ###
  $zabbix_server   = $server,
  $pid_file        = $zabbix::agent::params::pid_file,
  $log_file        = $zabbix::agent::params::log_file,
  $log_file_size   = $zabbix::agent::params::log_file_size,
  $debug_level     = $zabbix::agent::params::debug_level,
  $source_ip       = $zabbix::agent::params::source_ip,
  $en_remote_cmd   = $zabbix::agent::params::en_remote_cmd,
  $log_remote_cmd  = $zabbix::agent::params::log_remote_cmd,
  $server          = $zabbix::agent::params::server,
  $listen_port     = $zabbix::agent::params::listen_port,
  $listen_ip       = $zabbix::agent::params::listen_ip,
  $start_agents    = $zabbix::agent::params::start_agents,
  $server_active   = $zabbix::agent::params::server_active,
  $hostname        = $zabbix::agent::params::hostname,
  $hostname_item   = $zabbix::agent::params::hostname_item,
  $host_metadata   = $zabbix::agent::params::host_metadata,
  $refresh_act_chk = $zabbix::agent::params::refresh_active_checks,
  $buffers_send    = $zabbix::agent::params::buffers_send,
  $buffers_size    = $zabbix::agent::params::buffers_size,
  $max_lines_p_sec = $zabbix::agent::params::max_lines_per_second,
  
  ### ADVANCED PARAMETERS ###
  $alias_val           = $zabbix::agent::params::alias_val,
  $timeout         = $zabbix::agent::params::timeout,
  $allow_root      = $zabbix::agent::params::allow_root,
  $include         = $zabbix::agent::params::include,
  
  ### USER-DEFINED MONITORED PARAMETERS ###
  $unsage_usr_par  = $zabbix::agent::params::unsafe_user_parameters,
  $user_parameter  = $zabbix::agent::params::user_parameter,
  
  ### ADVANCED PARAMETERS ###
  $load_mod_path   = $zabbix::agent::params::load_module_path,
  $load_module     = $zabbix::agent::params::load_module,

) inherits zabbix::agent::params {

  # Install package  
  include zabbix::repo
  package { $agent_package : ensure => 'latest', }

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

