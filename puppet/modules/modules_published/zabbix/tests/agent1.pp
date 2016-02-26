## 1 - Using default template
class { 'zabbix::agent': 
	opt_use_template => 'yes',
	server 		 => 'your.zabbix.server',
}
