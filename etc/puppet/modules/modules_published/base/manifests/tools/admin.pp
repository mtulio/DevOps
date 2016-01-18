
# Install basic admin tools

class base::tools::admin {

  package  { ['nmap-nc','bind-utils','vim','tree'] : 
    ensure => present,
  }

}
