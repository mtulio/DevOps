
#class profiles () inherits profiles::params 
class profiles {
  include profiles::params

  class { 'profiles::motd' : enabled => $enable_motd, }
  class { 'profiles::ssh' : enabled => $enable_ssh, }

}
