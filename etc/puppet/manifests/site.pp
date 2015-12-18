node default {

  #class {'motd': }
  include motd
  include apache

}
