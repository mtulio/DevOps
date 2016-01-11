#Role class

Role class creates category of modules using profiles.

roles -> profiles -> MODULES

## Business layer

Role: pool_dmz_nginx
-> Profiles: 
* linux_base
* nginx

Role: pool_dmz_dnssec
-> Description: External DNS (DMZ) using DNSsec
-> Profiles:
* linux_base
* nginx
