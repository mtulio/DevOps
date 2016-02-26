# create a new virtual host
define apache::vhost ($port, $document_root, $servername, $vhost_name = '*', $vhost_dir) {

  # set permissions
  File {
    mode => 0677,
  }

  $default_index = "index_${servername}_${port}"
  $default_config = "config_${servername}_${port}"

  # add resource name - document root 
  file { $document_root: 
    ensure  => directory,
    recurse => true,
    before  => File[$default_index],   # guarantie that directory exists
  }


  file { $default_index: 
    path    => "${document_root}/index.html",
    ensure  => file,
    content => template ('apache/index.html.erb'),
    before  => File[$default_config],  # before this config run that
  }

  # Create a virtual host config file config
  file { $default_config:
    path => "${vhost_dir}/${servername}.conf",
    content => template('apache/vhost.conf.erb'),
    require => Package['apache'],		 # guarantie that packa are installed before run this
    notify => Service['apache'],
  }

}
