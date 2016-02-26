class nginx (
  $service_name = 'nginx',
  $package_name = 'nginx',

  ### Custom ###
  $repo_files     = undef,
  $repo_templates = undef,
  $reconfig       = 'no',
  $ssl            = 'disabled',
) {

  # Class from /jfryman-nginx   
  class { '::nginx::package':
    package_name   => $package_name,
    notify         => Class['::nginx::service'],
  }

  if $reconfig == 'yes' {
    file { 'NginxSyncConfMain':
      path    => "/etc/nginx/proxy.conf",
      source  => ["puppet:///modules/${repo_files}/conf/proxy.conf"],
      notify  => Service['nginx'],
    }
    file { 'NginxSyncConfProxy':
      path    => "/etc/nginx/nginx.conf",
      source  => ["puppet:///modules/${repo_files}/conf/nginx.conf"],
      before  => File['NginxSyncConfMain'],
      notify  => Service['nginx'],
    }
  } else {
    file { 'NginxSyncConfMain':
      path    => "/etc/nginx/proxy.conf",
      require => Package['nginx'],
    }
    file { 'NginxSyncConfProxy':
      path    => "/etc/nginx/nginx.conf",
      before  => File['NginxSyncConfMain'],
      notify  => Service['nginx'],
    }
  }    

  if $repo_files {
    # Sync directory conf.d/
    file {'NginxSyncConfd':
      ensure  => 'directory',
      recurse => 'true',
      purge   => 'true',
      path    => '/etc/nginx/conf.d/',
      source  => ["puppet:///modules/${repo_files}/conf.d"],
      before  => File['NginxSyncConfMain'],
      notify  => Service["nginx"],
    }  

    if $ssl == 'enabled' {
      # Copiando certificado (usado no vhost enit.mte.br )
      file { '/etc/nginx/server.crt':
        path    => "/etc/nginx/server.crt",
        source  => ["puppet:///modules/${repo_files}/conf/server.crt"],
        before  => File['NginxSyncConfMain'],
      } 
      file { '/etc/nginx/server.key':
        path    => "/etc/nginx/server.key",
        source  => ["puppet:///modules/${repo_files}/conf/server.key"],
        before  => File['NginxSyncConfMain'],
      } 
    }
  }

  # Class from /jfryman-nginx   
  class { '::nginx::service': }

  # TODO: config dynamic vhosts

}
