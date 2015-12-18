class named {
  $package_name = $named::params::package_name,
  $service_name = $named::params::service_name,
  $config_file  = $named::params::config_file,
  $config_zone  = $named::params::config_zone,
  $dir_zone     = $named::params::dir_zone,
  $dir_log      = $named::params::dir_log

} inherits named::params {


  # Instala e inicia o serviço
  include named::package
  include named::service

  # Cria os diretórios
  file { $dir_log:
    ensure => directory,
    recurse=> true,
  }

  case $::hostname {
    'rhensprd01' : {
      $dir_zone = "${dir_zone_root}/master"
      file { $dir_zone :
        ensure  => directory,
        recurse => true, 
      }
      $domain = "example1.gov.br"
      #$domains = ["example1.gov.br", "example2.gov.br"]

      #$domains.each |$domain| {
        named::zone {
          server_type => master,
          domain      => "$domain",
          zone_file   => ${dir_zone}/db.${domain},
        }
      #}
    } # finish server rhensprd01
  }
}
