class named::exec (
  $dir_zone = $named::params::dir_zone
) {
  
  exec { "sign_ict-eng.net" :
    command     => "${dir_zone}/master/script_sign_zone.sh $domain",
    refreshonly => true,
    require     => Package['bind','bind-chroot']
  }
  
  exec { "sign_example.gov.br" :
    command     => "${dir_zone}/master/script_sign_zone.sh $domain",
    refreshonly => true,
    require     => Package['bind','bind-chroot']
  }
}
