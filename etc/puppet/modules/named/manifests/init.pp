class named (
  $package_name   = $named::params::package_name,
  $package_chroot = $named::params::package_chroot,
  $service_name   = $named::params::service_name,
  $config_file    = $named::params::config_file,
  $config_zone    = $named::params::config_zone,
  $dir_zone       = $named::params::dir_zone,
  $dir_log        = $named::params::dir_log,
  $ip_addr        = $named::params::ip_addr

) inherits named::params {


  # Instala e inicia o serviço
  include named::package
  include named::service

  # Cria os diretórios
  ## Criado automaticamente pelo pacote bind-chroot
  #file { $dir_log:
  #  ensure => directory,
  #  recurse=> true,
  #}

  case $::hostname {
    'pmaster' : {
      $server_type = "master"
      $dir_zone_m = "${dir_zone}/${server_type}"

      # Config server
      named::config {$::hostname:
        type   => $server_type,
        view   => "all",		# all(internal+external), internal, external
      }

      # Create each domain
      $domain = "example1.gov.br"
      #$domains = ["example1.gov.br", "example2.gov.br"]

      #$domains.each |$domain| {
        named::zone { $domain:
          domain    => $domain,
          zone_dir  => "${dir_zone_m}",
          #zone_file => "$dir_zone_m/db.${domain}",
          zone_file => "db_ext-${domain}",
        }
      #}
    } # finish server rhensprd01
  }
}
