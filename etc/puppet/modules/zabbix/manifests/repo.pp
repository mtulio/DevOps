
# Class: Repository
# Depends: Main class [::zabbix]

class zabbix::repo inherits zabbix::params {
  
  # Get from repository defined on zabbix::params
  $zabbix_repo = $repository
  
  case $::operatingsystem {
    /(RedHat)/: {
      notice("Redhat OS must be install from RHN channel [Satellite]. ")
    }
    /(CentOS|Fedora)/: {
      yumrepo{ 'zabbix':
        descr    => "Zabbix Official Repository - ${::architecture}",
        baseurl  => "${zabbix_repo}/zabbix/2.4/rhel/${::operatingsystemmajrelease}/${::architecture}/",
        enabled  => 1,
        gpgcheck => 1,
        gpgkey   => "${zabbix_repo}/RPM-GPG-KEY-ZABBIX",
      }
    }
    /(Debian)/: {
      apt::source {"repo.zabbix.com":
        location =>  "${zabbix_repo}/zabbix/2.4/debian",
        release  => "wheezy",
        repos    => "main",
        key      => 'FBABD5FB20255ECAB22EE194D13D58E479EA5ED4'   
      }
    }
    /(Ubuntu)/: {
      apt::source {"repo.zabbix.com":
        location =>  "${zabbix_repo}/zabbix/2.4/ubuntu",
        release  => "precise",
        repos    => "main",
        key      => 'FBABD5FB20255ECAB22EE194D13D58E479EA5ED4'   
      }
    }
    default: {
      fail("${::operatingsystem} is not supported yet!")
    }
  }
}
