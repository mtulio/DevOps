#MTulios Puppet Modules

####Table of Contents

1. [Overview](#overview)
2. [Modules](#modules)

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


###Module: DNSnet

This module uses a DNS module provided for TheForeman project .

Installing steps:
 * On your puppet master modules repo, type

 ~~~
 puppet module install theforeman-dns 
 ~~~

NOTE: The DNS module uses concat and stdlib modules. It will be installed on the first usage/apply.

See project at https://forge.puppetlabs.com/theforeman/dns

###Module: Tests

This module is only to tests syntax and isolated tests of puppet lang. ;)
