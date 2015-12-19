class named::params {

#  case $::osfamily {
#    'Redhat' : {
      $package_name   = "bind"
      $package_chroot = "bind-chroot"
      $service_name   = "named"
      $config_file    = "/etc/named.conf"
      $config_zone    = "/etc/zones.conf"
      $dir_zone       = "/var/named/chroot/var/named"
      $dir_log        = "/var/named/chroot/var/log"
#    }
#    'Debian' : {
#    }
#  }
  
} # end class
