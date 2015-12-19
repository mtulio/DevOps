class named::package (
$package_name = $named::params::package_name,
$package_chroot = $named::params::package_chroot
) {
  package { 'bind':
    name   => $package_name,
    ensure => present,
  }
  package { 'bind-chroot':
    name  => $package_chroot,
    ensure => present,
  }
}
