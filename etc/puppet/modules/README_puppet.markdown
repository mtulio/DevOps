# Puppet Modules Description 


___

# Puppet HELP commands 

## Install puppet master on RHEL7

rpm -ivh https://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm
yum install puppet-server

## Creating a module skelleton

 ~~~
 puppet module generate USER-MOD_NAME
 ~~~


## Create a module tarbal to be published

~~~
 # puppet module build /etc/puppet/modules/linux
 Notice: Building /etc/puppet/modules/linux for release
 Module built: /etc/puppet/modules/linux/pkg/mtulio-linux-0.1.0.tar.gz
~~~

## Gem to check Puppet syntax errors

$ gem install puppet-lint
$ puppet-lint /etc/puppet/modules

## Links

* https://docs.puppetlabs.com/puppet/latest/reference/modules_publishing.html
