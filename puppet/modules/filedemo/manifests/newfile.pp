class filedemo::newfile 
	($content_file = $filedemo::params::content_file) 
	inherits filedemo::params {

  file { "/tmp/mynewfile1.txt" :
    content => $content_file,
  }


}

