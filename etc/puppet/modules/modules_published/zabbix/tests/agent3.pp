## 3 - Using custom config
class { 'zabbix::agent': 
	opt_use_template => 'no',
	server		 => 'your.zabbix.server',
	listen_port      => "$::ipaddress",
	listen_ip        => '10050',
	start_agents     => '2',
	server_active    => 'your.zabbix.server',
	buffers_send     => '10',
	buffers_size     => '512',
}
