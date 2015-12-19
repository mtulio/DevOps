define named::zone ($domain, $zone_dir, $zone_file) 
{

  # define permissoes (substituido abaixo)
#  File {
#    mode => 0660,
#  }

  # Create a dir from destination zone
  file { $zone_dir :
    ensure  => directory,
    recurse => true,
    #create_parents => true,
    owner   => 'root',
    group   => 'named',
    mode    => 0750,
  }

  # Mapeia os arquivos de zona no master
  case $domain {
    'example1.gov.br' : {
      $src_zone_file = "db.example1.gov.br"
    }
    'example2.gov.br' : {
      $src_zone_file = "db.example2.gov.br"
    }
  }

  # Atualiza arquivos
  # cria/atualiza arquivo
  file { $zone_file:
    path    => "$zone_file",
    source  => ["puppet:///modules/named/$src_zone_file"],
    notify  => Service['named'],
    owner   => 'root',
    group   => 'named',
    mode    => 0640,
  }


}
