class profile::motd ($enabled) {

  if $enabled == 'yes' {
    class { '::motd' :
      template => $profiles::params::motd_template_base,
    }
  }

}
