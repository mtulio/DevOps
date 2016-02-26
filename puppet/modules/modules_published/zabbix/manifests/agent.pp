
# Class Zabbix - Agent
## Allow you to configure each config of agent.

# There are 3 options to configure:
## 1 - Using default template
# class { 'zabbix::agent': 
#	opt_use_template => 'yes',
#	server => 'your.zabbix.server',
# }
## 2 - Using custom template
# class { 'zabbix::agent': 
#	opt_use_template => 'yes',
#	server 		 => 'your.zabbix.server',
#	agent_template   => 'path/to/your/template.erb',
# }
## 3 - Using custom config
# class { 'zabbix::agent': 
#	opt_use_template => 'no',
#	server		 => 'your.zabbix.server',
#	listen_port      => "$::ipaddress",
#	listen_ip        => '10050',
#	start_agents     => '2',
#	server_active    => 'your.zabbix.server',
#	buffers_send     => '10',
#	buffers_size     => '512',
# }

class zabbix::agent (
  ## GLOBALS ##
  $opt_use_template   = 'no',
  $server             = undef,

  ## Option USE TEMPLETE ##
  $agent_template  = undef,
  
  ## Option DO NOT USE TEMPLATE ##
  ##> CONFIG FILE OPTIONS <##
  ### GENERAL PARAMETERS ###
  $pid_file        = $zabbix::params::pid_file,
  $log_file        = $zabbix::params::log_file,
  $log_file_size   = $zabbix::params::log_file_size,
  $debug_level     = $zabbix::params::debug_level,
  $source_ip       = $zabbix::params::source_ip,
  $en_remote_cmd   = $zabbix::params::en_remote_cmd,
  $log_remote_cmd  = $zabbix::params::log_remote_cmd,
  $listen_port     = $zabbix::params::listen_port,
  $listen_ip       = $zabbix::params::listen_ip,
  $start_agents    = $zabbix::params::start_agents,
  $server_active   = $zabbix::params::server_active,
  $hostname        = $zabbix::params::hostname,
  $hostname_item   = $zabbix::params::hostname_item,
  $host_metadata   = $zabbix::params::host_metadata,
  $host_metadata_it= $zabbix::params::host_metadata_item,
  $refresh_act_chk = $zabbix::params::refresh_active_checks,
  $buffers_send    = $zabbix::params::buffers_send,
  $buffers_size    = $zabbix::params::buffers_size,
  $max_lines_p_sec = $zabbix::params::max_lines_per_second,
  
  ### ADVANCED PARAMETERS ###
  $alias_val       = $zabbix::params::alias_val,
  $timeout         = $zabbix::params::timeout,
  $allow_root      = $zabbix::params::allow_root,
  $include         = $zabbix::params::include,
  
  ### USER-DEFINED MONITORED PARAMETERS ###
  $unsage_usr_par  = $zabbix::params::unsafe_user_parameters,
  $user_parameter  = $zabbix::params::user_parameter,
  
  ### ADVANCED PARAMETERS ###
  $load_mod_path   = $zabbix::params::load_module_path,
  $load_module     = $zabbix::params::load_module,

) inherits zabbix::params {

  if $server == undef {
    fail("#> ERROR - You must set zabbix server.")
  }

  # Configuration option 1
  if $opt_use_template == 'yes' and $agent_template != undef {
    $template = "$agent_template"
  }
  # Configuration option 2
  elsif $opt_use_template == 'yes' {
    $template = 'zabbix/etc/zabbix/zabbix_agentd.conf.erb'
  }
  # Configuration option 3
  else {
    $template = 'zabbix/etc/zabbix/zabbix_agentd-custom.conf.erb'
  }

  # Install package  
  include zabbix::agent::package
  include zabbix::agent::service

  # Config & Start

  file { '/etc/zabbix/zabbix_agentd.conf':
    ensure  => present,
    content => template($template),
    mode    => '0644',
    require => Package[$zabbix::params::agent_package],
    notify  => Service[$zabbix::params::agent_service],
  }
  
  file {'/var/run/zabbix':
    ensure => directory,
    group => 'zabbix',
    owner => 'zabbix',
  }
}

