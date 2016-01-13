# Linux

#### Table of Contents

1. [Overview](#overview)
2. [Module Description](#module-description)
3. [Setup - The basics of getting started](#setup)
    * [What module affects](#what-module-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning](#beginning)
4. [Usage](#usage)
5. [Reference](#reference)
5. [Limitations](#limitations)
6. [Development](#development)

## Overview

This module can install and configure zabbix agent [ and the server in future ]

## Module Description

Module to manage Zabbix Agent.


## Setup

 See [Usage](#usage)

### What 'Zabbix' affects

* This module module will set the zabbix repository [2.4] and install the latest version of agent

### Setup Requirements 


### Beginning 

This is a great module to configure your Zabbix agent. 

## Usage

You have three ways to usage the class 

1. Using default template

 ~~~
## 1 - Using default template
class { 'zabbix::agent': 
	opt_use_template => 'yes',
	server 		 => 'your.zabbix.server',
}
 ~~~

2. Using custom template
 ~~~
## 2 - Using custom template
class { 'zabbix::agent': 
	opt_use_template => 'yes',
	server 		 => 'your.zabbix.server',
	agent_template   => 'path/to/your/template.erb',
}
 ~~~

3. Using custom configuration
 ~~~
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
 ~~~





## Limitations

OS compatibility [tested]: 
* Red Hat family 7+ 

We're working to support more OS.

## Development

See project page at https://github.com/mtulio/puppet-mod-zabbix

## Release Notes

[0.1.0]
* Add zabbix agent configuration

