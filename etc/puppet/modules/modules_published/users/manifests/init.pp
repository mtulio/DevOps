class users {

  group { 'whell':
    ensure => present,
  }
  group { 'finance':
    ensure => present,
  }

  user { 'admin':
	ensure		=> present,
	shell		=> '/bin/bash',
	name		=> 'admin',
	gid		=> 'wheel',
	managehome 	=> true,
	password	=> '$6$PwqLo2r.YvDpNFnO$VnbS8MXNZCPKTscTBVy2uH.BfrKkcOUOA91XhmFEBq8Nqd6ghAfcnZbwL44gHPf.yT6YJtkthWZel9DNrYkbg/',
  }

  user { 'user2':
	ensure		=> present,
	shell		=> '/bin/bash',
	name		=> 'user2',
	gid		=> ['wheel', 'finance'],
	managehome 	=> true,
	password	=> '$6$PwqLo2r.YvDpNFnO$VnbS8MXNZCPKTscTBVy2uH.BfrKkcOUOA91XhmFEBq8Nqd6ghAfcnZbwL44gHPf.yT6YJtkthWZel9DNrYkbg/',
  }

}
