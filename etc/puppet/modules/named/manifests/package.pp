class named::package (
$package_name = $named::params::package_name,
$package_chroot = $named::params::package_chroot
) {

#  package { 'bind':
#    name   => $package_name,
#    ensure => present,
#  }
#  package { 'bind-chroot':
#    name  => $package_chroot,
#    ensure => present,
#  }

  $pack_bind = $osfamily ? {
    'RedHat' => 'bind',
    'Debian' => 'bind9',
    default  => 'bind',
  }
  
  $pack_bind_jail = $osfamily ? {
    'RedHat' => 'bind-chroot',
    default  => 'bind-chroot',
  }

  package { [$pack_bind, $pack_bind_jail] :
    ensure => present,
  }
}
