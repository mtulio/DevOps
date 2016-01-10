class profiles::linux_base {

  include motd
  include users
  include linux::security::firewall
  include linux::security::selinux
  include linux::security::policies

}
