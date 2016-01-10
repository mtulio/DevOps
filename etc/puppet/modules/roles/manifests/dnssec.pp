
# Server that has rules of dnssec

class roles::dnssec {


  include profile::linux_base
  include profile::dnssec

}
