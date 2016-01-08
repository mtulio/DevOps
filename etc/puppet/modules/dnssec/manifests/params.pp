class dnssec::params {

#  case $::osfamily {
#    'Redhat' : {
      $root_jail      = "/var/named/chroot/"
      $package_name   = "bind"
      $package_chroot = "bind-chroot"
      $service_name   = "named"
      $config_file    = "${root_jail}etc/named.conf"
      $config_zone    = "${root_jail}etc/named.zones.conf"
      $dir_zone       = "${root_jail}var/named"
      $dir_log        = "${root_jail}var/log"
      $ip_addr        = $::ipaddress
#    }
#    'Debian' : {
#    }
#  }
  
} # end class
