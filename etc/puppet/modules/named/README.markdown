#MTulios Puppet Modules

####Table of Contents

[Overview](#overview)
[Module: named](#module-named)
*  [Modules - xxx](#modules-xx)

##Overview

Module to provisioning and keep configuration of DNS zones

* Keep these files:
named.conf
named_zones.conf
named_zones_..
> Notify daemon and rndc

master/
'- keys/
 '-- key symlinks to domain
'- db.zoneX
'- script_resign_zone.sh


## Pool of configurations

### Default pool

Default pool has default configuration of a server. If no host has defined on init.pp, the default configuration will apply. Basically these are:
* Master zones
* aaa

This is the directory tree:

 ~~~
files/pool_default/
├── etc
│   └── named
│       ├── acl.conf
│       ├── key.conf
│       └── logging.conf
├── master
│   ├── etc
│   │   └── named
│   │       └── zones.conf
│   └── zones
│       └── script_sign_zone.sh
├── slave
│   └── etc
│       └── named
│           └── zones.conf
└── zones
    └── default
        ├── named.ca
        ├── named.empty
        ├── named.localhost
        └── named.loopback

 ~~~

