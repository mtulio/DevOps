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



# POOL DMZ

Este pool manterá os registros DNS da INTERNET.

Explicação dos diretórios:
* master/ -> Mantém as configurações do DNS Master (Arquivos de configuração e zona DNS)
* slave/  -> Mantém as configurações do DNS Slave (somente arquivo de configuração)



REFERNÊNCIAS:
* [Assinando uma zona](https://www.digitalocean.com/community/tutorials/how-to-setup-dnssec-on-an-authoritative-bind-dns-server--2)


