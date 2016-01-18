#MTulios Puppet Modules

NEW: each module has its own project. Have a look : 

* Project module [linux]: https://github.com/mtulio/puppet-linux
* Project module [zabbix]: https://github.com/mtulio/puppet-mod-zabbix
* Project module [ssh]: //github.com/mtulio/puppet-mod-ssh
* Project module [profiles]: https://github.com/mtulio/puppet-mod-profiles
* Project module [profiles]: https://github.com/mtulio/puppet-mod-roles


####Table of Contents

[Overview](#overview)
[Modules](#modules)
*  [Modules - motd](#modules-motd)
*  [Modules - apache](#modules-apache)
*  [Modules - named](#modules-named)
*  [Modules - nginx](#modules-nginx)

##Overview

Adds a custom puppet modules

##Modules

###Module: motd

Module 'hello world' , is a first module to set system banner.

###Module: Apache
[in development]


###Module: Named
[in development]

This is a DNS module to use jail server [chroot] in Red Hat-based. That module was wrote by me and is in constantly improvment.


###Module: Nginx
[in development]

Module to install and configure reverse proxy using the fatest web proxy, NGINX.

###Module: DNSsec
[in development]

Module to install DNS with jail (chroot) and sigining zones placed on dir /var/named/chroot/var/named/master/2.zones.

This modules depends of Firewall module, install it as a follow:

 ~~~
 puppet module install puppetlabs-firewall
 ~~~

###Module: DNSnet

This module uses a DNS module provided for TheForeman project .

Installing steps:
 * On your puppet master modules repo, type

 ~~~
 puppet module install theforeman-dns 
 puppet module install puppetlabs-firewall
 ~~~

NOTE: The DNS module uses concat and stdlib modules. It will be installed on the first usage/apply.

See project at https://forge.puppetlabs.com/theforeman/dns

###Module: Tests

This module is only to tests syntax and isolated tests of puppet lang. ;)
