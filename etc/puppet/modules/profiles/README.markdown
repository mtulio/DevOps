# Profiles class

Implemantation layer of business (roles class)

roles -> profiles -> MODULES

## Implematation layer:

Profile: linux_base
-> Description: Basic modules of Linux Operation Systems
-> Modules:
* users
* motd
* selinux
* firewall
* ntp
* sudo
-> Dependencies:

 ~~~
 puppet module install puppetlabs-motd
 puppet module install puppetlabs-firewall
 ~~~

__

Profile: webserver::nginx
-> Description: Install module nginx and its dependencies
-> Modules:
* firewall - role port 80 and 443
* nginx

Profile: webserver::apache
-> Description: Install module apache and its dependencies
-> Modules:
* firewall - role port 80 and 443
* apache

Profile: webserver::apache_php
-> Description: Install module Apache with php
-> Modules:
* apache
* php

Profile: dnssec
-> Description: Install DNS server with DNSSEC support
-> Modules:
* dnssec





See also:
* http://puppetspecialist.nl/MPIpres/img/RolesProfiles.png
