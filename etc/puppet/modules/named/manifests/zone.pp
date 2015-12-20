define named::zone ($domain, $zone_dir, $zone_file) 
{

  # en: Create a dir from destination zone
  # pt: Cria o sub-diretporio da zona 
#  file { $zone_dir :
#    ensure  => directory,
#    recurse => true,
#    #create_parents => true,
#    owner   => 'root',
#    group   => 'named',
#    mode    => 0750,
#  }

  # en: Mapping master's zone file
  # pt: Mapeia os arquivos de zona no master
#  case $domain {
#    'example1.gov.br' : {
#      $src_zone_file = "db.example1.gov.br"
#    }
#    'example2.gov.br' : {
#      $src_zone_file = "db.example2.gov.br"
#    }
#  }

  # en: Create/update files
  # pt: Cria/atualiza arquivos
  file { "${zone_dir}/${zone_file}" :
    path    => "${zone_dir}/${zone_file}",
    source  => ["puppet:///modules/named/zones/${zone_file}"],
    notify  => Service['named'],
    owner   => 'root',
    group   => 'named',
    mode    => 0640,
  }


}
