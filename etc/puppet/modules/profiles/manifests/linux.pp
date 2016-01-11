class profiles::linux (
$pool,
$security_level,
) {

  #TODO:
  #include linux::security::firewall
  #include linux::security::selinux
  #include linux::security::policies
  #include profiles::linux::users
  #class { 'profiles::linux::groups' : groups => $groups }
  #include profiles::linux::sudoers
  
  #include motd
  class { '::motd' :
      template => "roles/motd/pool_$pool.erb",
  }

  include users
  
  if $security_level == 'basic' {
    notice("Disable all security options")
    #include profiles::linux::sec_basic
    # disable selinux
    # disable iptables
  } 
  elsif $security_level == 'high' {
    notify("Enable all security options")
    #include profiles::linux::sec_high
    # enable selinux
    # enable iptables
    # enable audit
  }



}


