
# Server groups:
## DNS
## NGINX

class profiles::params {

  $enable_mod_dnssec = 'no'
  $enable_mod_ntp    = 'no'
  $enable_mod_nginx  = 'no'
  $enable_mod_motd   = 'yes'
  $enable_mod_ssh    = 'yes'
  $enable_mod_users  = 'yes'

  # Configure hostname
  case $::hostname {
    'pmaster': {
      $pool = 'default'
      $server_group = 'dns'
    }
    default : {
      $pool = 'default'
      $server_group = 'default'
    }
  }

  # Configure modules per groups
  case $server_group {
    'dns': {
      $enable_mod_dns = 'yes'
    }
  }

  # Configure modules per host (force to install a module on specific host
  case $::hostname {
    'pmaster' : {
      $enable_mod_dns   = 'no'
      $enable_mod_nginx = 'yes'
    }
  }

  # Configure modules
  if $enable_mod_motd == 'yes' {
    $motd_template_base = "profiles/motd/pool_${pool}"
  }
  if $enable_mod_nginx == 'yes' {
    $nginx_template_base = "profiles/nginx/pool_${pool}"
    $nginx_files_base    = "profiles/nginx/pool_${pool}"
  }


}
