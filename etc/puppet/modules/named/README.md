# Configuração do DNS server (named)

## Provisionamento manual (sem o foreman). Procedimentos:
[SO]
* Instalar o SO no Hypervisor
** Configurar inteface de rede
** Configurar hostname
* Registrar no controle de subinscrições (caso seja Red Hat- Satellite6)
* RHEL: Instalar katello agent
* Instalar puppet agent
* Atualizar o sistema
[Puppet]
* Criar classe do bind
* Criar arquivos de configs por hosts
* Criar zonas no dir files
* Testar as classes
[Sync]
* Configurar o puppet no orquestrador
* Associar a classe DNS nos servidores
* Atualizar o cliente do puppet

