
$topscope = "This is a global var from site.pp file"

node default {

  $nodescope = "This is a node scope var from site.pp file"

  #class {'motd': }
  #include motd
  #include apache
  #include dnsjail
  #include named
  #include tests
  #include nginx

  # Add class and pass params
  class { 'ntp' : package => 'ntp', }
  include ntp::service

  notify { "This is a test notify from site.pp file" : }
}
