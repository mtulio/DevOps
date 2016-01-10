class roles::nginx {

  include profile::linux_base
  include profile::nginx
  include profile::haproxy

}
