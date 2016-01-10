
# Main class

class base::params {

  case $::osfamily {
    'RedHat': {
      $ssh_name = 'sshd' }
    }
    'Debian': {
      $ssh_name = 'ssh' }
    }
    default: {
      fail ('OS not support by puppet module') }
    }
  }

}
