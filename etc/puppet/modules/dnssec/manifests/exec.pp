class dnssec::exec (
  $dir_zone = $dnssec::params::dir_zone
) {
  
  exec { "sign_all" :
    command     => "${dir_zone}/master/atualiza_dnssec.sh",
    refreshonly => true,
    require     => File['ScriptSignZone']
  }

  #exec { "sign_ict-eng.net" :
  #  command     => "${dir_zone}/master/atualiza_dnssec.sh domain $domain",
  #  refreshonly => true,
  #  require     => Package['bind','bind-chroot']
  #}
  
  #exec { "sign_example.gov.br" :
  #  command     => "${dir_zone}/master/atualiza_dnssec.sh domain $domain",
  #  refreshonly => true,
  #  require     => Package['bind','bind-chroot']
  #}
}
