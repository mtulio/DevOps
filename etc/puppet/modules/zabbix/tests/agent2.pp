## 2 - Using custom template
class { 'zabbix::agent': 
	opt_use_template => 'yes',
	server 		 => 'your.zabbix.server',
	agent_template   => 'path/to/your/template.erb',
}
