define named::zone ($server_type, $domain, $zone_file) 
{

  # define permissoes
  File {
    mode => 0677,
  }

  # Mapeia os arquivos de zona no master
  case $domain {
    'example1.gov.br' : {
      $zone_puppet_files = "named/db.example1.gov.br"
    }
    'example2.gov.br' : {
      $zone_puppet_files = "named/db.example2.gov.br"
    }
  }

  # Atualiza arquivos
  # cria/atualiza arquivo
  file { $zone_file:
    path    => "$zone_file",
    content => files($zone_puppet_files),
    require => Package['named'],
    notify  => Service['named'],
  }


}
