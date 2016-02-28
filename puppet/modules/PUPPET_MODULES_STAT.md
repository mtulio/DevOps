## MODULES STATS
***
> > > > NOTE: This file is parte of [PUPPET MODULES](PUPPET_MODULES.md) with all metadata modules information.

| MODULE   | LOCAL VERSION   | LATEST VERSION | [ALL ALERTS](#modules-code-style-check) | WARNS | ERRORS | GENERAL |
| -------- | --------------- | -------------- | ---------- | ----------- | ----------- | ----------- |
| [apt](#module-apt) | 2.2.1 | puppetlabs-apt [![Puppet Forge](http://img.shields.io/puppetforge/v/puppetlabs/apt.svg)](https://forge.puppetlabs.com/puppetlabs/apt) | 29 | 29 | 0 | 0 |
| [stdlib](#module-stdlib) | 4.10.0 | puppetlabs-stdlib [![Puppet Forge](http://img.shields.io/puppetforge/v/puppetlabs/stdlib.svg)](https://forge.puppetlabs.com/puppetlabs/stdlib) | 6 | 6 | 0 | 0 |
| [0_REPO](#module-0_REPO) | `NA` | `NA` | 0 | 0 | 0 | 0 |
| [dnssec](#module-dnssec) | 1.0.2 | mtulio-dnssec [![Puppet Forge](http://img.shields.io/puppetforge/v/mtulio/dnssec.svg)](https://forge.puppetlabs.com/mtulio/dnssec) | 8 | 8 | 0 | 0 |
| [ssh](#module-ssh) | 1.3.1 | mtulio-ssh [![Puppet Forge](http://img.shields.io/puppetforge/v/mtulio/ssh.svg)](https://forge.puppetlabs.com/mtulio/ssh) | 4 | 4 | 0 | 0 |
| [registry](#module-registry) | 1.1.3 | puppetlabs-registry [![Puppet Forge](http://img.shields.io/puppetforge/v/puppetlabs/registry.svg)](https://forge.puppetlabs.com/puppetlabs/registry) | 8 | 4 | 4 | 0 |
| [dns](#module-dns) | 3.1.0 | theforeman-dns [![Puppet Forge](http://img.shields.io/puppetforge/v/theforeman/dns.svg)](https://forge.puppetlabs.com/theforeman/dns) | 5 | 5 | 0 | 0 |
| [nfs](#module-nfs) | 0.1.2 | gnubilafrance-nfs [![Puppet Forge](http://img.shields.io/puppetforge/v/gnubilafrance/nfs.svg)](https://forge.puppetlabs.com/gnubilafrance/nfs) | 7 | 7 | 0 | 0 |
| [nginx](#module-nginx) | `NA` | `NA` | 42 | 38 | 4 | 0 |
| [apache](#module-apache) | `NA` | `NA` | 48 | 31 | 17 | 0 |
| [git](#module-git) | 1.0.0 | jproyo-git [![Puppet Forge](http://img.shields.io/puppetforge/v/jproyo/git.svg)](https://forge.puppetlabs.com/jproyo/git) | 8 | 8 | 0 | 0 |
| [firewall](#module-firewall) | 1.7.2 | puppetlabs-firewall [![Puppet Forge](http://img.shields.io/puppetforge/v/puppetlabs/firewall.svg)](https://forge.puppetlabs.com/puppetlabs/firewall) | 14 | 14 | 0 | 0 |
| [concat](#module-concat) | 1.2.5 | puppetlabs-concat [![Puppet Forge](http://img.shields.io/puppetforge/v/puppetlabs/concat.svg)](https://forge.puppetlabs.com/puppetlabs/concat) | 12 | 12 | 0 | 0 |
| [filedemo](#module-filedemo) | `NA` | `NA` | 23 | 17 | 6 | 0 |
| [linux](#module-linux) | 1.1.1 | mtulio-linux [![Puppet Forge](http://img.shields.io/puppetforge/v/mtulio/linux.svg)](https://forge.puppetlabs.com/mtulio/linux) | 1 | 1 | 0 | 0 |
| [zabbix](#module-zabbix) | 1.1.1 | mtulio-zabbix [![Puppet Forge](http://img.shields.io/puppetforge/v/mtulio/zabbix.svg)](https://forge.puppetlabs.com/mtulio/zabbix) | 3 | 3 | 0 | 0 |
| [roles](#module-roles) | 1.0.0 | mtulio-roles [![Puppet Forge](http://img.shields.io/puppetforge/v/mtulio/roles.svg)](https://forge.puppetlabs.com/mtulio/roles) | 0 | 0 | 0 | 0 |
| [profiles](#module-profiles) | 1.1.1 | mtulio-profiles [![Puppet Forge](http://img.shields.io/puppetforge/v/mtulio/profiles.svg)](https://forge.puppetlabs.com/mtulio/profiles) | 7 | 7 | 0 | 0 |
## MODULES CODE STYLE CHECK

***

### MODULE-cst-[apt]

| TYPE  | OCCURRENCES ON MODULE [apt](#module-apt)  |
| ---------- | ------ |
| `WARNING` |/manifests/init.pp - WARNING: class inheriting from params class on line 11|
| `WARNING` |/manifests/key.pp - WARNING: line has more than 80 characters on line 17|
| `WARNING` |/manifests/key.pp - WARNING: line has more than 80 characters on line 24|
| `WARNING` |/manifests/key.pp - WARNING: line has more than 80 characters on line 31|
| `WARNING` |/manifests/key.pp - WARNING: line has more than 80 characters on line 38|
| `WARNING` |/manifests/key.pp - WARNING: line has more than 80 characters on line 45|
| `WARNING` |/manifests/key.pp - WARNING: line has more than 80 characters on line 51|
| `WARNING` |/manifests/key.pp - WARNING: line has more than 80 characters on line 63|
| `WARNING` |/manifests/backports.pp - WARNING: class not documented on line 1|
| `WARNING` |/manifests/backports.pp - WARNING: line has more than 80 characters on line 26|
| `WARNING` |/manifests/backports.pp - WARNING: line has more than 80 characters on line 41|
| `WARNING` |/manifests/source.pp - WARNING: line has more than 80 characters on line 32|
| `WARNING` |/manifests/source.pp - WARNING: line has more than 80 characters on line 36|
| `WARNING` |/manifests/source.pp - WARNING: line has more than 80 characters on line 40|
| `WARNING` |/manifests/source.pp - WARNING: line has more than 80 characters on line 42|
| `WARNING` |/manifests/source.pp - WARNING: line has more than 80 characters on line 52|
| `WARNING` |/manifests/source.pp - WARNING: line has more than 80 characters on line 56|
| `WARNING` |/manifests/source.pp - WARNING: line has more than 80 characters on line 60|
| `WARNING` |/manifests/source.pp - WARNING: line has more than 80 characters on line 64|
| `WARNING` |/manifests/source.pp - WARNING: line has more than 80 characters on line 96|
| `WARNING` |/manifests/params.pp - WARNING: class not documented on line 1|
| `WARNING` |/manifests/conf.pp - WARNING: defined type not documented on line 1|
| `WARNING` |/manifests/ppa.pp - WARNING: line has more than 80 characters on line 18|
| `WARNING` |/manifests/ppa.pp - WARNING: line has more than 80 characters on line 45|
| `WARNING` |/manifests/update.pp - WARNING: class not documented on line 1|
| `WARNING` |/manifests/setting.pp - WARNING: defined type not documented on line 1|
| `WARNING` |/manifests/setting.pp - WARNING: line has more than 80 characters on line 25|
| `WARNING` |/manifests/setting.pp - WARNING: line has more than 80 characters on line 29|
| `WARNING` |/examples/disable_keys.pp - WARNING: line has more than 80 characters on line 1|

### MODULE-cst-[stdlib]

| TYPE  | OCCURRENCES ON MODULE [stdlib](#module-stdlib)  |
| ---------- | ------ |
| `WARNING` |/examples/has_interface_with.pp - WARNING: line has more than 80 characters on line 4|
| `WARNING` |/examples/has_interface_with.pp - WARNING: line has more than 80 characters on line 5|
| `WARNING` |/examples/has_interface_with.pp - WARNING: line has more than 80 characters on line 6|
| `WARNING` |/examples/has_interface_with.pp - WARNING: line has more than 80 characters on line 7|
| `WARNING` |/examples/has_interface_with.pp - WARNING: line has more than 80 characters on line 8|
| `WARNING` |/examples/has_interface_with.pp - WARNING: line has more than 80 characters on line 9|

### MODULE-cst-[0_REPO]

| TYPE  | OCCURRENCES ON MODULE [0_REPO](#module-0_REPO)  |
| ---------- | ------ |

### MODULE-cst-[dnssec]

| TYPE  | OCCURRENCES ON MODULE [dnssec](#module-dnssec)  |
| ---------- | ------ |
| `WARNING` |/manifests/init.pp - WARNING: class inheriting from params class on line 30|
| `WARNING` |/manifests/init.pp - WARNING: indentation of => is not properly aligned on line 82|
| `WARNING` |/manifests/init.pp - WARNING: indentation of => is not properly aligned on line 83|
| `WARNING` |/manifests/init.pp - WARNING: indentation of => is not properly aligned on line 84|
| `WARNING` |/manifests/init.pp - WARNING: indentation of => is not properly aligned on line 85|
| `WARNING` |/manifests/init.pp - WARNING: indentation of => is not properly aligned on line 88|
| `WARNING` |/manifests/init.pp - WARNING: indentation of => is not properly aligned on line 89|
| `WARNING` |/manifests/init.pp - WARNING: indentation of => is not properly aligned on line 90|

### MODULE-cst-[ssh]

| TYPE  | OCCURRENCES ON MODULE [ssh](#module-ssh)  |
| ---------- | ------ |
| `WARNING` |/manifests/init.pp - WARNING: class inheriting from params class on line 10|
| `WARNING` |/manifests/sshd_config.pp - WARNING: line has more than 80 characters on line 56|
| `WARNING` |/tests/sshd_confg3.pp - WARNING: line has more than 80 characters on line 5|
| `WARNING` |/tests/sshd_confg4.pp - WARNING: line has more than 80 characters on line 13|

### MODULE-cst-[registry]

| TYPE  | OCCURRENCES ON MODULE [registry](#module-registry)  |
| ---------- | ------ |
| `WARNING` |/examples/registry_examples.pp - WARNING: double quoted string containing no variables on line 72|
| `WARNING` |/examples/registry_examples.pp - WARNING: double quoted string containing no variables on line 79|
| `WARNING` |/examples/registry_examples.pp - WARNING: double quoted string containing no variables on line 79|
| `WARNING` |/examples/registry_examples.pp - WARNING: double quoted string containing no variables on line 79|
| `ERRORS` |/examples/registry_examples.pp - ERROR: registry_example not in autoload module layout on line 16|
| `ERRORS` |/examples/service_example.pp - ERROR: registry::service_example not in autoload module layout on line 18|
| `ERRORS` |/examples/purge_example.pp - ERROR: registry::purge_example not in autoload module layout on line 34|
| `ERRORS` |/examples/compliance_example.pp - ERROR: registry::compliance_example not in autoload module layout on line 18|

### MODULE-cst-[dns]

| TYPE  | OCCURRENCES ON MODULE [dns](#module-dns)  |
| ---------- | ------ |
| `WARNING` |/manifests/init.pp - WARNING: class inheriting from params class on line 22|
| `WARNING` |/manifests/init.pp - WARNING: line has more than 80 characters on line 26|
| `WARNING` |/manifests/init.pp - WARNING: line has more than 80 characters on line 27|
| `WARNING` |/manifests/init.pp - WARNING: line has more than 80 characters on line 28|
| `WARNING` |/manifests/zone.pp - WARNING: line has more than 80 characters on line 27|

### MODULE-cst-[nfs]

| TYPE  | OCCURRENCES ON MODULE [nfs](#module-nfs)  |
| ---------- | ------ |
| `WARNING` |/manifests/server/debian.pp - WARNING: class not documented on line 1|
| `WARNING` |/manifests/server/redhat.pp - WARNING: class not documented on line 1|
| `WARNING` |/manifests/server/redhat.pp - WARNING: line has more than 80 characters on line 4|
| `WARNING` |/manifests/client/debian.pp - WARNING: class not documented on line 1|
| `WARNING` |/manifests/client/redhat.pp - WARNING: class not documented on line 1|
| `WARNING` |/manifests/server.pp - WARNING: class not documented on line 1|
| `WARNING` |/manifests/client.pp - WARNING: class not documented on line 1|

### MODULE-cst-[nginx]

| TYPE  | OCCURRENCES ON MODULE [nginx](#module-nginx)  |
| ---------- | ------ |
| `WARNING` |/manifests/service.pp - WARNING: class not documented on line 1|
| `WARNING` |/manifests/service.pp - WARNING: ensure found on line but it's not the first attribute on line 5|
| `WARNING` |/manifests/package/debian.pp - WARNING: line has more than 80 characters on line 67|
| `WARNING` |/manifests/package/debian.pp - WARNING: line has more than 80 characters on line 71|
| `WARNING` |/manifests/package/redhat.pp - WARNING: line has more than 80 characters on line 57|
| `WARNING` |/manifests/init.pp - WARNING: class not documented on line 1|
| `WARNING` |/manifests/init.pp - WARNING: double quoted string containing no variables on line 20|
| `WARNING` |/manifests/init.pp - WARNING: double quoted string containing no variables on line 25|
| `WARNING` |/manifests/init.pp - WARNING: double quoted string containing no variables on line 32|
| `WARNING` |/manifests/init.pp - WARNING: double quoted string containing no variables on line 36|
| `WARNING` |/manifests/init.pp - WARNING: double quoted string containing no variables on line 51|
| `WARNING` |/manifests/init.pp - WARNING: double quoted string containing no variables on line 57|
| `WARNING` |/manifests/init.pp - WARNING: double quoted string containing no variables on line 62|
| `WARNING` |/manifests/init.pp - WARNING: quoted boolean value found on line 46|
| `WARNING` |/manifests/init.pp - WARNING: quoted boolean value found on line 47|
| `WARNING` |/manifests/init.pp - WARNING: indentation of => is not properly aligned on line 14|
| `WARNING` |/manifests/init.pp - WARNING: indentation of => is not properly aligned on line 15|
| `WARNING` |/manifests/init.pp - WARNING: indentation of => is not properly aligned on line 20|
| `WARNING` |/manifests/init.pp - WARNING: indentation of => is not properly aligned on line 21|
| `WARNING` |/manifests/init.pp - WARNING: indentation of => is not properly aligned on line 22|
| `WARNING` |/manifests/init.pp - WARNING: indentation of => is not properly aligned on line 25|
| `WARNING` |/manifests/init.pp - WARNING: indentation of => is not properly aligned on line 26|
| `WARNING` |/manifests/init.pp - WARNING: indentation of => is not properly aligned on line 27|
| `WARNING` |/manifests/init.pp - WARNING: indentation of => is not properly aligned on line 28|
| `WARNING` |/manifests/init.pp - WARNING: indentation of => is not properly aligned on line 36|
| `WARNING` |/manifests/init.pp - WARNING: indentation of => is not properly aligned on line 37|
| `WARNING` |/manifests/init.pp - WARNING: indentation of => is not properly aligned on line 38|
| `WARNING` |/manifests/init.pp - WARNING: indentation of => is not properly aligned on line 57|
| `WARNING` |/manifests/init.pp - WARNING: indentation of => is not properly aligned on line 58|
| `WARNING` |/manifests/init.pp - WARNING: indentation of => is not properly aligned on line 59|
| `WARNING` |/manifests/init.pp - WARNING: indentation of => is not properly aligned on line 62|
| `WARNING` |/manifests/init.pp - WARNING: indentation of => is not properly aligned on line 63|
| `WARNING` |/manifests/init.pp - WARNING: indentation of => is not properly aligned on line 64|
| `WARNING` |/manifests/params.pp - WARNING: class not documented on line 1|
| `WARNING` |/manifests/params.pp - WARNING: line has more than 80 characters on line 22|
| `WARNING` |/manifests/params.pp - WARNING: line has more than 80 characters on line 23|
| `WARNING` |/manifests/params.pp - WARNING: line has more than 80 characters on line 47|
| `WARNING` |/manifests/package.pp - WARNING: class inheriting from params class on line 22|
| `ERRORS` |/manifests/init.pp - ERROR: trailing whitespace found on line 40|
| `ERRORS` |/manifests/init.pp - ERROR: trailing whitespace found on line 52|
| `ERRORS` |/manifests/init.pp - ERROR: trailing whitespace found on line 60|
| `ERRORS` |/manifests/init.pp - ERROR: trailing whitespace found on line 65|

### MODULE-cst-[apache]

| TYPE  | OCCURRENCES ON MODULE [apache](#module-apache)  |
| ---------- | ------ |
| `WARNING` |/manifests/service.pp - WARNING: class not documented on line 1|
| `WARNING` |/manifests/service.pp - WARNING: ensure found on line but it's not the first attribute on line 5|
| `WARNING` |/manifests/init.pp - WARNING: class inheriting from params class on line 11|
| `WARNING` |/manifests/init.pp - WARNING: case statement without a default case on line 38|
| `WARNING` |/manifests/init.pp - WARNING: double quoted string containing no variables on line 31|
| `WARNING` |/manifests/init.pp - WARNING: double quoted string containing no variables on line 41|
| `WARNING` |/manifests/init.pp - WARNING: double quoted string containing no variables on line 44|
| `WARNING` |/manifests/init.pp - WARNING: double quoted string containing no variables on line 47|
| `WARNING` |/manifests/init.pp - WARNING: double quoted string containing no variables on line 50|
| `WARNING` |/manifests/init.pp - WARNING: double quoted string containing no variables on line 57|
| `WARNING` |/manifests/init.pp - WARNING: double quoted string containing no variables on line 60|
| `WARNING` |/manifests/init.pp - WARNING: line has more than 80 characters on line 18|
| `WARNING` |/manifests/vhost.pp - WARNING: optional parameter listed before required parameter on line 2|
| `WARNING` |/manifests/vhost.pp - WARNING: line has more than 80 characters on line 2|
| `WARNING` |/manifests/vhost.pp - WARNING: line has more than 80 characters on line 31|
| `WARNING` |/manifests/vhost.pp - WARNING: indentation of => is not properly aligned on line 29|
| `WARNING` |/manifests/vhost.pp - WARNING: indentation of => is not properly aligned on line 32|
| `WARNING` |/manifests/vhost.pp - WARNING: ensure found on line but it's not the first attribute on line 22|
| `WARNING` |/manifests/params.pp - WARNING: case statement without a default case on line 14|
| `WARNING` |/manifests/params.pp - WARNING: class not documented on line 1|
| `WARNING` |/manifests/params.pp - WARNING: double quoted string containing no variables on line 10|
| `WARNING` |/manifests/params.pp - WARNING: double quoted string containing no variables on line 12|
| `WARNING` |/manifests/params.pp - WARNING: double quoted string containing no variables on line 16|
| `WARNING` |/manifests/params.pp - WARNING: double quoted string containing no variables on line 17|
| `WARNING` |/manifests/params.pp - WARNING: double quoted string containing no variables on line 18|
| `WARNING` |/manifests/params.pp - WARNING: double quoted string containing no variables on line 19|
| `WARNING` |/manifests/params.pp - WARNING: double quoted string containing no variables on line 22|
| `WARNING` |/manifests/params.pp - WARNING: double quoted string containing no variables on line 23|
| `WARNING` |/manifests/params.pp - WARNING: double quoted string containing no variables on line 24|
| `WARNING` |/manifests/params.pp - WARNING: double quoted string containing no variables on line 25|
| `WARNING` |/manifests/package.pp - WARNING: ensure found on line but it's not the first attribute on line 5|
| `ERRORS` |/manifests/service.pp - ERROR: trailing whitespace found on line 2|
| `ERRORS` |/manifests/init.pp - ERROR: trailing whitespace found on line 31|
| `ERRORS` |/manifests/init.pp - ERROR: two-space soft tabs not used on line 14|
| `ERRORS` |/manifests/init.pp - ERROR: two-space soft tabs not used on line 57|
| `ERRORS` |/manifests/init.pp - ERROR: two-space soft tabs not used on line 58|
| `ERRORS` |/manifests/init.pp - ERROR: two-space soft tabs not used on line 59|
| `ERRORS` |/manifests/init.pp - ERROR: two-space soft tabs not used on line 60|
| `ERRORS` |/manifests/init.pp - ERROR: two-space soft tabs not used on line 61|
| `ERRORS` |/manifests/init.pp - ERROR: two-space soft tabs not used on line 62|
| `ERRORS` |/manifests/vhost.pp - ERROR: tab character found on line 31|
| `ERRORS` |/manifests/vhost.pp - ERROR: trailing whitespace found on line 13|
| `ERRORS` |/manifests/vhost.pp - ERROR: trailing whitespace found on line 20|
| `ERRORS` |/manifests/params.pp - ERROR: tab character found on line 5|
| `ERRORS` |/manifests/params.pp - ERROR: tab character found on line 7|
| `ERRORS` |/manifests/params.pp - ERROR: two-space soft tabs not used on line 5|
| `ERRORS` |/manifests/params.pp - ERROR: two-space soft tabs not used on line 7|
| `ERRORS` |/manifests/params.pp - ERROR: two-space soft tabs not used on line 27|

### MODULE-cst-[git]

| TYPE  | OCCURRENCES ON MODULE [git](#module-git)  |
| ---------- | ------ |
| `WARNING` |/manifests/repo.pp - WARNING: line has more than 80 characters on line 7|
| `WARNING` |/manifests/repo.pp - WARNING: line has more than 80 characters on line 15|
| `WARNING` |/manifests/repo.pp - WARNING: line has more than 80 characters on line 42|
| `WARNING` |/manifests/repo.pp - WARNING: line has more than 80 characters on line 77|
| `WARNING` |/manifests/repo.pp - WARNING: line has more than 80 characters on line 82|
| `WARNING` |/manifests/init.pp - WARNING: line has more than 80 characters on line 16|
| `WARNING` |/manifests/params.pp - WARNING: line has more than 80 characters on line 9|
| `WARNING` |/tests/init.pp - WARNING: line has more than 80 characters on line 3|

### MODULE-cst-[firewall]

| TYPE  | OCCURRENCES ON MODULE [firewall](#module-firewall)  |
| ---------- | ------ |
| `WARNING` |/manifests/init.pp - WARNING: class inheriting from params class on line 18|
| `WARNING` |/manifests/linux.pp - WARNING: class inheriting from params class on line 18|
| `WARNING` |/manifests/params.pp - WARNING: class not documented on line 1|
| `WARNING` |/manifests/linux/archlinux.pp - WARNING: class inheriting from params class on line 21|
| `WARNING` |/manifests/linux/debian.pp - WARNING: class inheriting from params class on line 21|
| `WARNING` |/manifests/linux/debian.pp - WARNING: line has more than 80 characters on line 26|
| `WARNING` |/manifests/linux/debian.pp - WARNING: line has more than 80 characters on line 35|
| `WARNING` |/manifests/linux/gentoo.pp - WARNING: class inheriting from params class on line 21|
| `WARNING` |/manifests/linux/redhat.pp - WARNING: class inheriting from params class on line 20|
| `WARNING` |/manifests/linux/redhat.pp - WARNING: line has more than 80 characters on line 26|
| `WARNING` |/manifests/linux/redhat.pp - WARNING: line has more than 80 characters on line 27|
| `WARNING` |/manifests/linux/redhat.pp - WARNING: line has more than 80 characters on line 43|
| `WARNING` |/manifests/linux/redhat.pp - WARNING: line has more than 80 characters on line 44|
| `WARNING` |/manifests/linux/redhat.pp - WARNING: line has more than 80 characters on line 61|

### MODULE-cst-[concat]

| TYPE  | OCCURRENCES ON MODULE [concat](#module-concat)  |
| ---------- | ------ |
| `WARNING` |/manifests/setup.pp - WARNING: line has more than 80 characters on line 14|
| `WARNING` |/manifests/setup.pp - WARNING: line has more than 80 characters on line 20|
| `WARNING` |/manifests/setup.pp - WARNING: line has more than 80 characters on line 23|
| `WARNING` |/manifests/init.pp - WARNING: line has more than 80 characters on line 100|
| `WARNING` |/manifests/init.pp - WARNING: line has more than 80 characters on line 205|
| `WARNING` |/manifests/init.pp - WARNING: line has more than 80 characters on line 208|
| `WARNING` |/manifests/fragment.pp - WARNING: line has more than 80 characters on line 49|
| `WARNING` |/manifests/fragment.pp - WARNING: line has more than 80 characters on line 52|
| `WARNING` |/manifests/fragment.pp - WARNING: line has more than 80 characters on line 55|
| `WARNING` |/manifests/fragment.pp - WARNING: line has more than 80 characters on line 58|
| `WARNING` |/manifests/fragment.pp - WARNING: line has more than 80 characters on line 71|
| `WARNING` |/manifests/fragment.pp - WARNING: line has more than 80 characters on line 114|

### MODULE-cst-[filedemo]

| TYPE  | OCCURRENCES ON MODULE [filedemo](#module-filedemo)  |
| ---------- | ------ |
| `WARNING` |/manifests/init.pp - WARNING: class inheriting from params class on line 1|
| `WARNING` |/manifests/init.pp - WARNING: class not documented on line 1|
| `WARNING` |/manifests/init.pp - WARNING: double quoted string containing no variables on line 9|
| `WARNING` |/manifests/init.pp - WARNING: double quoted string containing no variables on line 10|
| `WARNING` |/manifests/init.pp - WARNING: double quoted string containing no variables on line 17|
| `WARNING` |/manifests/init.pp - WARNING: double quoted string containing no variables on line 21|
| `WARNING` |/manifests/init.pp - WARNING: double quoted string containing no variables on line 32|
| `WARNING` |/manifests/init.pp - WARNING: line has more than 80 characters on line 1|
| `WARNING` |/manifests/init.pp - WARNING: line has more than 80 characters on line 32|
| `WARNING` |/manifests/params.pp - WARNING: class not documented on line 1|
| `WARNING` |/manifests/params.pp - WARNING: double quoted string containing no variables on line 3|
| `WARNING` |/manifests/rc.pp - WARNING: class not documented on line 1|
| `WARNING` |/manifests/rc.pp - WARNING: double quoted string containing no variables on line 3|
| `WARNING` |/manifests/rc.pp - WARNING: double quoted string containing no variables on line 4|
| `WARNING` |/manifests/newfile.pp - WARNING: class inheriting from params class on line 3|
| `WARNING` |/manifests/newfile.pp - WARNING: class not documented on line 1|
| `WARNING` |/manifests/newfile.pp - WARNING: double quoted string containing no variables on line 5|
| `ERRORS` |/manifests/newfile.pp - ERROR: tab character found on line 2|
| `ERRORS` |/manifests/newfile.pp - ERROR: tab character found on line 3|
| `ERRORS` |/manifests/newfile.pp - ERROR: trailing whitespace found on line 1|
| `ERRORS` |/manifests/newfile.pp - ERROR: trailing whitespace found on line 2|
| `ERRORS` |/manifests/newfile.pp - ERROR: two-space soft tabs not used on line 2|
| `ERRORS` |/manifests/newfile.pp - ERROR: two-space soft tabs not used on line 3|

### MODULE-cst-[linux]

| TYPE  | OCCURRENCES ON MODULE [linux](#module-linux)  |
| ---------- | ------ |
| `WARNING` |/manifests/init.pp - WARNING: class inheriting from params class on line 17|

### MODULE-cst-[zabbix]

| TYPE  | OCCURRENCES ON MODULE [zabbix](#module-zabbix)  |
| ---------- | ------ |
| `WARNING` |/manifests/repo.pp - WARNING: line has more than 80 characters on line 7|
| `WARNING` |/manifests/repo.pp - WARNING: line has more than 80 characters on line 16|
| `WARNING` |/manifests/init.pp - WARNING: class inheriting from params class on line 11|

### MODULE-cst-[roles]

| TYPE  | OCCURRENCES ON MODULE [roles](#module-roles)  |
| ---------- | ------ |

### MODULE-cst-[profiles]

| TYPE  | OCCURRENCES ON MODULE [profiles](#module-profiles)  |
| ---------- | ------ |
| `WARNING` |/manifests/init.pp - WARNING: class inheriting from params class on line 21|
| `WARNING` |/manifests/linux.pp - WARNING: class inheriting from params class on line 32|
| `WARNING` |/manifests/web/nginx.pp - WARNING: class inheriting from params class on line 9|
| `WARNING` |/manifests/params.pp - WARNING: line has more than 80 characters on line 20|
| `WARNING` |/manifests/linux/users.pp - WARNING: line has more than 80 characters on line 22|
| `WARNING` |/manifests/linux/users.pp - WARNING: line has more than 80 characters on line 30|
| `WARNING` |/manifests/nms/zabbix_agent.pp - WARNING: class inheriting from params class on line 4|
