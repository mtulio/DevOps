class roles::pool_dmz_nginx (
$config_repo = $roles::params::config_repo,
) inherits roles::params {

  # BASIC envs
  $pool = "dmz"

  # TODO:
  #include roles::linux
  class { 'profiles::linux' : 
	pool           => $pool, 
	security_level => 'basic',
  }

  notice(" ##I> roles::pool_dmz_nginx::pool = $pool")

  case $::hostname {
    /^(pmaster|srv_nginx)$/: {
      #include roles::webserver::nginx
      class { 'profiles::webserver::nginx' : 
        repo_files       => "${config_repo}/nginx/pool_${pool}",
        repo_templates   => "${config_repo}/nginx",
        config_overwrite => 'yes',
      }
    }
    default : {
      notice("Server $::hostname not allowed to this pool")
    }
  }

}
