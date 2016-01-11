
# Server groups:
## DNS
## NGINX

class roles::params {

  $config_repo = "0_REPO"

  $enable_mod_dnssec = 'no'
  $enable_mod_ntp    = 'no'
  $enable_mod_nginx  = 'no'
  $enable_mod_motd   = 'yes'
  $enable_mod_ssh    = 'yes'
  $enable_mod_users  = 'yes'
  $enable_mod_dns    = 'yes'

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

}
