
# Class zabbix::params

class zabbix::params {

  $agent_dir      = undef
  $repository     = 'http://repo.zabbix.com'
  $agent_package  = 'zabbix-agent'
  $agent_service  = 'zabbix-agent'
 

  # Zabbix - Agent
  ## Allow you to configure each config of agent.
 
  ### GENERAL PARAMETERS ###
  $pid_file		= '/var/run/zabbix/zabbix_agentd.pid'
  $log_file		= '/var/log/zabbix/zabbix_agentd.log'
  $log_file_size	= '100'
  $debug_level		= '3'
  $source_ip		= undef
  $en_remote_cmd	= '1'
  $log_remote_cmd	= '0'
  $server		= 'default.template.zabbix'
  $listen_port		= '10050'
  $listen_ip		= '0.0.0.0'
  $start_agents		= '3'
  $server_active	= undef 
  $hostname		= "$::fqdn"
  $hostname_item	= 'system.hostname' 
  $host_metadata	= 'system.uname'
  $host_metadata_item	= 'system.uname'
  $refresh_active_checks= '120' 
  $buffers_send		= '5'
  $buffers_size		= '100' 
  $max_lines_per_second = '100'
  
  ### ADVANCED PARAMETERS ###
  $alias_val		= undef
  $timeout		= '3'
  $allow_root		= '0'
  $include		= []     #TODO: check&define array on erb
  
  ### USER-DEFINED MONITORED PARAMETERS ###
  $unsafe_user_parameters = '0'
  $user_parameter	  = undef
  
  ### ADVANCED PARAMETERS ###
  $load_module_path 	= "\${libdir}/modules"
  $load_module		= undef

}
