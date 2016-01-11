class roles::pool_portal {

  $pool = "portal"

  include profiles::linux

  case $::hostname {
    'srv_portal_www': {
      include profiles::webserver::apache
      include profiles::webserver::php
    }
    'srv_portal_cache': {
      include profiles::webserver::varnish
    }
    default : {
      notice("Server $::hostname not allowed to this pool")
    }
  }

}
