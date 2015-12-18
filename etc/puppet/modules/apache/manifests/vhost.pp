# create a new virtual host
define apache::vhost ($port, $document_root, $servername, $vhost_name = '*', $vhost_dir) {

  # set permissions
  File {
    mode => 0677,
  }

  file { 'index': 
    path    => "${document_root}/index.html",
    ensure  => file,
    content => template ('apache/index.html.erb'),
    before  => File['config_file'],  # before this config run that
  }

  # Create a virtual host config file config
  file { 'config_file':
    path => "${vhost_dir}/${servername}.conf",
    content => template('apache/vhost.conf.erb'),
    require => Package['apache'],		 # guarantie that packa are installed before run this
    notify => Service['apache'],
  }

}
