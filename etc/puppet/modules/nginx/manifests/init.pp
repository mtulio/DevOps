class nginx {

  # include files
  include nginx::package
  include nginx::service

  # Config repo
  # TODO: config suport for many distros, create templates, etc
  case $::operatingsystem {
    'CentOS' : {
      $tpl_repo = "nginx.repo.centos"
    }
    'Redhat' : {
      $tpl_repo = "nginx.repo.rhel"
    }
    default : {
      fail(" # Error, OS does not support!")
   }
  }

  file { '/etc/yum.repos.d/nginx.repo' :
    path    => "/etc/yum.repos.d/nginx.repo",
    source  => ["puppet:///modules/nginx/install/${tpl_repo}"],
    #notify  => Service['nginx'],
    #require => Package['nginx'],
  } 


  # Install & Update main config file
  File {
    owner => 'root',
    group => 'nginx',
    mode  => 0644, 
  }
 
  file { '/etc/nginx/nginx.conf' :
    path    => "/etc/nginx/nginx.conf",
    source  => ['puppet:///modules/nginx/nginx.conf'],
    notify  => Service['nginx'],
    require => Package['nginx'],
  } 

  # Update virtual Hosts
  file { '/etc/nginx/conf.d/aplicacoes.conf' :
    path    => "/etc/nginx/conf.d/aplicacoes.conf",
    source  => ['puppet:///modules/nginx/aplicacoes.conf'],
    notify  => Service['nginx'],
    require => Package['nginx'],
  } 


  # TODO: config dynamic vhosts

}
