class profiles::base {
  #include base
  #include base::params
  #include base::ssh
  #include base::variables
  #include ssh
  #include localusers
  #include localusers::groups::finance
  #include localusers::groups::wheel
  include users
  #include ntp
  class { 'ntp' : package => 'ntp', }


  # 
  include profiles::motd
  include profiles::users



}
